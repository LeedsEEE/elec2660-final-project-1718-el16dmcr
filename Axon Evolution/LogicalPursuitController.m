//
//  LogicalPursuitController.m
//  Axon Evolution
//
//  Created by David Russell [el16dmcr] on 28/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "LogicalPursuitController.h"


@interface LogicalPursuitController ()

@end

@implementation LogicalPursuitController

#pragma mark - Initialisation of App
-(void)viewDidLoad {
    [super viewDidLoad];
    self.logicalPursuitData = [[LogicalPursuit alloc] init];            // Need this so it knows what ive set variables as in other classes
    
    [self.view setUserInteractionEnabled:NO];           // Makes the user unable to interact with the screen so they cant store any taps while the pattern is flashing
    [self setupLooks];
    [self initShapes];
    [self.logicalPursuitData setStartLives];            // Sets the start lives depending on what the user set in settings page
    
    NSLog(@"counter is %d", self.logicalPursuitData.roundCounter);
    NSLog(@"lives are %d", self.logicalPursuitData.currentLives);
    self.scoreLabel.text = [NSString stringWithFormat:@"Score : %d", self.logicalPursuitData.currentPoints];
    self.livesRemainingLabel.text = [NSString stringWithFormat:@"Lives Remaining: %d", self.logicalPursuitData.currentLives];           // Displays the intial lives the user has at the beginning of the game
    self.whenToPlayLabel.text = @"0";
    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(generatePattern) userInfo:nil repeats:NO];         // Delays the pattern being generated by two seconds to give the user some breathing room as the screen loads

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Function to make defining colours easier
UIColor *RGB18(float r, float g, float b)            //adapted from https://stackoverflow.com/questions/13224206/how-do-i-create-a-uicolor-from-rgba
{
    return [UIColor colorWithRed:r/255.0f
                           green:g/255.0f
                            blue:b/255.0f
                           alpha:1.0];
}

#pragma mark - Colours of Labels and Buttons
// This is what defines how my screen look for the most part, see the draw view for the rest of the screen
-(void)setupLooks{
    self.livesRemainingLabel.layer.borderColor = RGB18(255, 153, 0).CGColor;
    self.livesRemainingLabel.layer.borderWidth = 3.0;
    self.livesRemainingLabel.layer.cornerRadius = 8.0;
    self.livesRemainingLabel.textColor = [UIColor whiteColor];
    self.whenToPlayLabel.layer.borderColor = RGB18(255, 153, 0).CGColor;
    self.whenToPlayLabel.layer.borderWidth = 3.0;
    self.whenToPlayLabel.layer.cornerRadius = 8.0;
    self.whenToPlayLabel.textColor = [UIColor whiteColor];
    self.scoreLabel.layer.borderColor = RGB18(255, 153, 0).CGColor;
    self.scoreLabel.layer.borderWidth = 3.0;
    self.scoreLabel.layer.cornerRadius = 8.0;
    self.scoreLabel.textColor = [UIColor whiteColor];
    self.mainMenuButton.tintColor = [UIColor whiteColor];
    self.mainMenuButton.layer.borderWidth = 3.0;
    self.mainMenuButton.layer.borderColor = RGB18(255, 153, 0).CGColor;
    self.mainMenuButton.layer.cornerRadius = 8.0;
}

#pragma mark - Initialisation of shapeImages
// This function sets all the UIImages as their correct coloured shape and allows them to be interacted with a single tap, when they are tapped they will call their respective functions
-(void)initShapes{
    
    // Assinging the image views with the correct images
    [self.redCircleImage setImage:[UIImage imageNamed:@"redCircleOffImage"]];
    [self.redCircleImage setUserInteractionEnabled:YES];
    [self.pinkInvertedSquareImage setImage:[UIImage imageNamed:@"pinkInvertedSquareOffImage"]];
    [self.pinkInvertedSquareImage setUserInteractionEnabled:YES];
    [self.blueRhombusImage setImage:[UIImage imageNamed:@"blueRhombusOffImage"]];
    [self.blueRhombusImage setUserInteractionEnabled:YES];
    [self.cyanSquareImage setImage:[UIImage imageNamed:@"cyanSquareOffImage"]];
    [self.cyanSquareImage setUserInteractionEnabled:YES];
    [self.purpleDiamondImage setImage:[UIImage imageNamed:@"purpleDiamondOffImage"]];
    [self.purpleDiamondImage setUserInteractionEnabled:YES];
    [self.greenTriangleImage setImage:[UIImage imageNamed:@"greenTriangleOffImage"]];
    [self.greenTriangleImage setUserInteractionEnabled:YES];
    
    // Makes the image views able to accept interactions from the user
    UITapGestureRecognizer *redCircleTapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(circleClicked)];
    [redCircleTapped setNumberOfTapsRequired:1];
    UITapGestureRecognizer *pinkInvertedSquareTapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(invertedSquareClicked)];
    [pinkInvertedSquareTapped setNumberOfTapsRequired:1];
    UITapGestureRecognizer *blueRhombusTapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(rhombusClicked)];
    [blueRhombusTapped setNumberOfTapsRequired:1];
    UITapGestureRecognizer *cyanSquareTapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(squareClicked)];
    [cyanSquareTapped setNumberOfTapsRequired:1];
    UITapGestureRecognizer *purpleDiamondTapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(diamondClicked)];
    [purpleDiamondTapped setNumberOfTapsRequired:1];
    UITapGestureRecognizer *greenTriangleTapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(triangleClicked)];
    [greenTriangleTapped setNumberOfTapsRequired:1];
    
    // Adds the gesture recognizer to the correct shapes so they will call the correct function when tapped
    [self.redCircleImage addGestureRecognizer:redCircleTapped];
    [self.pinkInvertedSquareImage addGestureRecognizer:pinkInvertedSquareTapped];
    [self.blueRhombusImage addGestureRecognizer:blueRhombusTapped];
    [self.cyanSquareImage addGestureRecognizer:cyanSquareTapped];
    [self.purpleDiamondImage addGestureRecognizer:purpleDiamondTapped];
    [self.greenTriangleImage addGestureRecognizer:greenTriangleTapped];
}

#pragma mark - Check Length of Array
// This function will count the array that the user is entering infoation into and once its the same length as the pattern array it will start the next round
-(void)checkLenghtOfArray{
    if (self.tempCounter2 == self.logicalPursuitData.roundCounter - 1){
        [self reset];
        [self.logicalPursuitData roundCounterPlus];
        [self generatePattern];
        
    }
    else{
        self.tempCounter2++;
    }

}

#pragma mark - Save Score and Exit
// This function is called once all your lives are gone and it saves your highscore to the text file as long as you have beaten the previous highscore, it also takes you to the correct screen depending on your score
-(void)saveScoreAndExit{
    // Defining where the save file is for the highscores
    // adapted from https://stackoverflow.com/questions/1820204/objective-c-creating-a-text-file-with-a-string
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *filePath = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"save.txt"];
    NSMutableDictionary *userData = [NSMutableDictionary dictionaryWithContentsOfFile:filePath];
    int currentHighScore = [[userData valueForKey:@"LogicalPursuitHighScore"] intValue];
    if (self.logicalPursuitData.currentPoints > currentHighScore){          // Checks if your new score is greater than your latest highscore
        
        int newHighScore = self.logicalPursuitData.currentPoints;           // Temporary variable that stores your new highscore and will then save it to a text file
        NSNumber *newHighScoreNSN = [[NSNumber alloc] initWithInt:newHighScore];
        [userData setValue:newHighScoreNSN forKey:@"LogicalPursuitHighScore"];
        [userData writeToFile:filePath atomically:YES];
        
        // Moves the user to the win screen for this game
        // adapted from https://www.youtube.com/watch?v=QhNdvCE9jVg 
        UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        ViewController *vc = [mainStoryBoard instantiateViewControllerWithIdentifier:@"LogicalPursuitWinScreen"];
        [self presentViewController:vc animated:YES completion:nil];
        
    }
    else {          // If the user didnt beat their old highscore
        
        // Moves the user to the lose screen
        UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        ViewController *vc = [mainStoryBoard instantiateViewControllerWithIdentifier:@"LogicalPursuitLoseScreen"];
        [self presentViewController:vc animated:YES completion:nil];
        
    }
}

#pragma mark - Any Shape Clicked
// Whenevr any shape is clicked this set of function checks whether that was the correct shape in the sequence by using the isEqualToString function
-(void)circleClicked{           //Circle has been tapped
    NSLog(@"circle clicked");
    if([[self.logicalPursuitData.latestPattern objectAtIndex:self.tempCounter2]  isEqualToString: @"circle"]){          //Checks if the correct choice was circle
        NSLog(@"correct");
        [self.logicalPursuitData calculatePoints];          // Increments the users points
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d",self.logicalPursuitData.currentPoints];          //Updates the users score label with their new score
        [self checkLenghtOfArray];          //Checks if this should be the last shape from the pattern that was displayed at the start of the round
        
    }
    else {
        NSLog(@"WRONG");
        NSLog(@"Correct Shape was : %@", [self.logicalPursuitData.latestPattern objectAtIndex:self.tempCounter2]);
        [self.logicalPursuitData removeLive];           // User loses one of their lives
        self.livesRemainingLabel.text = [NSString stringWithFormat:@"Lives Remaining: %d", self.logicalPursuitData.currentLives];            // Lives remaining label is updated to reflect the lsot lofe
        [self.logicalPursuitData checkLives];           // Checls to see if the user has no lives left and whether it needs to end the game
        if ([self.logicalPursuitData checkLives] == true){          // If the user has no lives left
            [self saveScoreAndExit];            // Saves the game score if needed and exits the game
        }
        [self reset];           // If the user still has lvies it will reset the counters and the array and generate a new pattern
        [self generatePattern];         // Generates the next pattern
    
    }
}
-(void)invertedSquareClicked{
    NSLog(@"inverted square clicked");
    if([[self.logicalPursuitData.latestPattern objectAtIndex:self.tempCounter2]  isEqualToString: @"invertedSquare"]){
        NSLog(@"correct");
        [self.logicalPursuitData calculatePoints];
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d",self.logicalPursuitData.currentPoints];
        [self checkLenghtOfArray];
    }
    else {
        NSLog(@"WRONG");
        NSLog(@"Correct Shape was : %@", [self.logicalPursuitData.latestPattern objectAtIndex:self.tempCounter2]);
        [self.logicalPursuitData removeLive];
        self.livesRemainingLabel.text = [NSString stringWithFormat:@"Lives Remaining: %d", self.logicalPursuitData.currentLives];
        [self.logicalPursuitData checkLives];
        if ([self.logicalPursuitData checkLives] == true){
            [self saveScoreAndExit];
        }
        [self reset];
        [self generatePattern];
    
    }
}
-(void)rhombusClicked{
    NSLog(@"rhombus clicked");
    if([[self.logicalPursuitData.latestPattern objectAtIndex:self.tempCounter2]  isEqualToString: @"rhombus"]){
        NSLog(@"correct");
        [self.logicalPursuitData calculatePoints];
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d",self.logicalPursuitData.currentPoints];
        [self checkLenghtOfArray];
    }
    else {
        NSLog(@"WRONG");
        NSLog(@"Correct Shape was : %@", [self.logicalPursuitData.latestPattern objectAtIndex:self.tempCounter2]);
        [self.logicalPursuitData removeLive];
        self.livesRemainingLabel.text = [NSString stringWithFormat:@"Lives Remaining: %d", self.logicalPursuitData.currentLives];
        [self.logicalPursuitData checkLives];
        if ([self.logicalPursuitData checkLives] == true){
            [self saveScoreAndExit];
        }
        [self reset];
        [self generatePattern];
    
    }
}
-(void)squareClicked{
    NSLog(@"square clicked");
    if([[self.logicalPursuitData.latestPattern objectAtIndex:self.tempCounter2]  isEqualToString: @"square"]){
        NSLog(@"correct");
        [self.logicalPursuitData calculatePoints];
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d",self.logicalPursuitData.currentPoints];
        [self checkLenghtOfArray];
    }
    else {
        NSLog(@"WRONG");
        NSLog(@"Correct Shape was : %@", [self.logicalPursuitData.latestPattern objectAtIndex:self.tempCounter2]);
        [self.logicalPursuitData removeLive];
        self.livesRemainingLabel.text = [NSString stringWithFormat:@"Lives Remaining: %d", self.logicalPursuitData.currentLives];
        [self.logicalPursuitData checkLives];
        if ([self.logicalPursuitData checkLives] == true){
            [self saveScoreAndExit];
        }
        [self reset];
        [self generatePattern];
    
    }
}
-(void)diamondClicked{
    NSLog(@"diamond clicked");
    if([[self.logicalPursuitData.latestPattern objectAtIndex:self.tempCounter2]  isEqualToString: @"diamond"]){
        NSLog(@"correct");
        [self.logicalPursuitData calculatePoints];
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d",self.logicalPursuitData.currentPoints];
        [self checkLenghtOfArray];
    }
    else {
        NSLog(@"WRONG");
        NSLog(@"Correct Shape was : %@", [self.logicalPursuitData.latestPattern objectAtIndex:self.tempCounter2]);
        [self.logicalPursuitData removeLive];
        self.livesRemainingLabel.text = [NSString stringWithFormat:@"Lives Remaining: %d", self.logicalPursuitData.currentLives];
        [self.logicalPursuitData checkLives];
        if ([self.logicalPursuitData checkLives] == true){
            [self saveScoreAndExit];
        }
        [self reset];
        [self generatePattern];
    
    }
}
-(void)triangleClicked{
    NSLog(@"triangle clicked");
    if([[self.logicalPursuitData.latestPattern objectAtIndex:self.tempCounter2]  isEqualToString: @"triangle"]){
        NSLog(@"correct");
        [self.logicalPursuitData calculatePoints];
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d",self.logicalPursuitData.currentPoints];
        [self checkLenghtOfArray];
    }
    else {
        NSLog(@"WRONG");
        NSLog(@"Correct Shape was : %@", [self.logicalPursuitData.latestPattern objectAtIndex:self.tempCounter2]);
        [self.logicalPursuitData removeLive];
        self.livesRemainingLabel.text = [NSString stringWithFormat:@"Lives Remaining: %d", self.logicalPursuitData.currentLives];
        [self.logicalPursuitData checkLives];
        if ([self.logicalPursuitData checkLives] == true){
            [self saveScoreAndExit];
        }
        [self reset];
        [self generatePattern];
     
    }
}

#pragma mark - Light Up Shape
//
-(void)lightCircle{
    [self.redCircleImage setImage:[UIImage imageNamed:@"redCircleOnImage"]];
    self.whenToPlayLabel.text = [NSString stringWithFormat:(@"%d"),self.tempCounter+1];         //Displays a helpful number to the user to show when the next shape has been lit up
    self.tempCounter ++;            //Increments the counter, this is so that the game knows when it has lit up the corrct number of shapes
    
}
-(void)lightInvertedSquare{
    [self.pinkInvertedSquareImage setImage:[UIImage imageNamed:@"pinkInvertedSquareOnImage"]];
    self.whenToPlayLabel.text = [NSString stringWithFormat:(@"%d"),self.tempCounter+1];
    self.tempCounter ++;
    
}
-(void)lightRhombus{
    [self.blueRhombusImage setImage:[UIImage imageNamed:@"blueRhombusOnImage"]];
    self.whenToPlayLabel.text = [NSString stringWithFormat:(@"%d"),self.tempCounter+1];
    self.tempCounter ++;
    
}
-(void)lightSquare{
    [self.cyanSquareImage setImage:[UIImage imageNamed:@"cyanSquareOnImage"]];
    self.whenToPlayLabel.text = [NSString stringWithFormat:(@"%d"),self.tempCounter+1];
    self.tempCounter ++;
    
}
-(void)lightDiamond{
    [self.purpleDiamondImage setImage:[UIImage imageNamed:@"purpleDiamondOnImage"]];
    self.whenToPlayLabel.text = [NSString stringWithFormat:(@"%d"),self.tempCounter+1];
    self.tempCounter ++;
    
}
-(void)lightTriangle{
    [self.greenTriangleImage setImage:[UIImage imageNamed:@"greenTriangleOnImage"]];
    self.whenToPlayLabel.text = [NSString stringWithFormat:(@"%d"),self.tempCounter+1];
    self.tempCounter ++;
    
}

#pragma mark - Reset
// Reset the two temporary counters and clears the array for the latest pattern so a new pattern can be generated
-(int)reset{
    self.tempCounter = 0;
    self.tempCounter2 = 0;
    [self.logicalPursuitData clearArray];
    return self.tempCounter;
    return self.tempCounter2;
}

#pragma mark - Generate Pattern
// This function works with flashPattern to randomly generate the shapes that will be flashed and then to flash them to the user
-(void)generatePattern{
    
    if(self.tempCounter < self.logicalPursuitData.roundCounter){
        
        [self.view setUserInteractionEnabled:NO];            // Makes it so that the user cant interact with the screen whilst the pattern is being flashed
        
        NSLog(@"roundCounter is %d",self.logicalPursuitData.roundCounter);
        NSLog(@"roundCounter is %d",self.tempCounter);
        // Turs last shape that was on off
        [self.redCircleImage setImage:[UIImage imageNamed:@"redCircleOffImage"]];
        [self.pinkInvertedSquareImage setImage:[UIImage imageNamed:@"pinkInvertedSquareOffImage"]];
        [self.blueRhombusImage setImage:[UIImage imageNamed:@"blueRhombusOffImage"]];
        [self.cyanSquareImage setImage:[UIImage imageNamed:@"cyanSquareOffImage"]];
        [self.purpleDiamondImage setImage:[UIImage imageNamed:@"purpleDiamondOffImage"]];
        [self.greenTriangleImage setImage:[UIImage imageNamed:@"greenTriangleOffImage"]];
        
        [self.logicalPursuitData pickNextShape];
        [self.logicalPursuitData shapeSelector];
        [self flashPattern];
        NSLog(@"random number is: %d", self.logicalPursuitData.randomOne);
        NSLog(@"Next shape has been picked");
        NSLog(@"pattern has been generated");
    }
    else {
        [self.redCircleImage setImage:[UIImage imageNamed:@"redCircleOffImage"]];
        [self.pinkInvertedSquareImage setImage:[UIImage imageNamed:@"pinkInvertedSquareOffImage"]];
        [self.blueRhombusImage setImage:[UIImage imageNamed:@"blueRhombusOffImage"]];
        [self.cyanSquareImage setImage:[UIImage imageNamed:@"cyanSquareOffImage"]];
        [self.purpleDiamondImage setImage:[UIImage imageNamed:@"purpleDiamondOffImage"]];
        [self.greenTriangleImage setImage:[UIImage imageNamed:@"greenTriangleOffImage"]];
        NSLog(@"pattern has been flashed");
        [self.view setUserInteractionEnabled:YES];
        self.whenToPlayLabel.text = (@"Play Now");          // Sets the label to say "Play Now" when it is the users turn to play
        
    }
    
    
}

#pragma mark - Flash Pattern
// This function takes the random numbers generated from the earlier function generatePattern and then makes it correspond to the correct shape to light up
-(void)flashPattern {
            NSLog(@"shape from the index is: %@", [self.logicalPursuitData.latestPattern objectAtIndex:self.tempCounter]);
    
        if ([[self.logicalPursuitData.latestPattern objectAtIndex:self.tempCounter]  isEqualToString: @"circle"]){
            NSLog(@"light up red circle");
            [self lightCircle];
            [self.logicalPursuitData calculateFlashTime];
            [NSTimer scheduledTimerWithTimeInterval:self.logicalPursuitData.flashTime target:self selector:@selector(generatePattern) userInfo:nil repeats:NO];         // Delays the next function from running so that the shape is lit up for a period of times
            
        }
        else if ([[self.logicalPursuitData.latestPattern objectAtIndex:self.tempCounter]  isEqualToString: @"invertedSquare"]){
            NSLog(@"light up pink inverted square");
            [self lightInvertedSquare];
            [self.logicalPursuitData calculateFlashTime];
            [NSTimer scheduledTimerWithTimeInterval:self.logicalPursuitData.flashTime target:self selector:@selector(generatePattern) userInfo:nil repeats:NO];
            
        }
        else if ([[self.logicalPursuitData.latestPattern objectAtIndex:self.tempCounter]  isEqualToString: @"rhombus"]){
            NSLog(@"light up blue rhombus");
            [self lightRhombus];
            [self.logicalPursuitData calculateFlashTime];
            [NSTimer scheduledTimerWithTimeInterval:self.logicalPursuitData.flashTime target:self selector:@selector(generatePattern) userInfo:nil repeats:NO];
            
        }
        else if ([[self.logicalPursuitData.latestPattern objectAtIndex:self.tempCounter]  isEqualToString: @"square"]){
            NSLog(@"light up cyan square");
            [self lightSquare];
            [self.logicalPursuitData calculateFlashTime];
            [NSTimer scheduledTimerWithTimeInterval:self.logicalPursuitData.flashTime target:self selector:@selector(generatePattern) userInfo:nil repeats:NO];
            
        }
        else if ([[self.logicalPursuitData.latestPattern objectAtIndex:self.tempCounter]  isEqualToString: @"diamond"]){
            NSLog(@"light up purple diamond");
            [self lightDiamond];
            [self.logicalPursuitData calculateFlashTime];
            [NSTimer scheduledTimerWithTimeInterval:self.logicalPursuitData.flashTime target:self selector:@selector(generatePattern) userInfo:nil repeats:NO];
            
        }
        else if ([[self.logicalPursuitData.latestPattern objectAtIndex:self.tempCounter]  isEqualToString: @"triangle"]){
            NSLog(@"light up green triangle");
            [self lightTriangle];
            [self.logicalPursuitData calculateFlashTime];
            [NSTimer scheduledTimerWithTimeInterval:self.logicalPursuitData.flashTime target:self selector:@selector(generatePattern) userInfo:nil repeats:NO];
            
        }
}

#pragma mark - Back Button Pressed
// This is a button that takes the user back to the home screen if they do not wish to finish playing the game for any reason
- (IBAction)mainMenuButtonPressed:(UIButton *)sender {
    
    UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UINavigationController *nc = [mainStoryBoard instantiateViewControllerWithIdentifier:@"HomePage"];
    [self presentViewController:nc animated:YES completion:nil];
}
@end
