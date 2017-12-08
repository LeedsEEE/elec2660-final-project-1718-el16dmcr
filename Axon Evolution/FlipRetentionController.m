//
//  FlipRetentionController.m
//  Axon Evolution
//
//  Created by David Russell [el16dmcr] on 30/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "FlipRetentionController.h"

@interface FlipRetentionController ()

@end

@implementation FlipRetentionController

#pragma mark - Initialisation Of App

- (void)viewDidLoad {
    [super viewDidLoad];
    self.flipRetentionData = [[FlipRetentionData alloc] init];          // Initialising the data from my data model
    SettingsData *data = [SettingsData sharedInstance];             // Creating a shared instace of my settings page so that the gameplay will be affected by what the user set on the slider
    [self setupLooks];
    [self quickreset];
    [self initialiseImages];
    self.pairCounter = 0;           // Sets this value to zero, when this counter equals 8 the game will regenrate the grid again
    self.scoreLabel.text = [NSString stringWithFormat:@"Score : %d",self.flipRetentionData.currentScore]; // Sets the initial start score on the label for the game
    [self generateRandomImages];            // Generates the randomly allocated pairs and positions for all the tiles
    self.timeTick = [data flipRetentionTimeAvailable];;             //Lets the timer as was set on the slider in the settings page
    self.timerLabel.text = [NSString stringWithFormat:@"TimeRemaining : %d", self.timeTick];            // Initially updates the label for the time at the start of the game
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(tick) userInfo:nil repeats:YES];            // This timer repeatedly contoles my count down timer functin that gets displayed on the label
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

UIColor *RGB13(float r, float g, float b)            //adapted from https://stackoverflow.com/questions/13224206/how-do-i-create-a-uicolor-from-rgba
{
    return [UIColor colorWithRed:r/255.0f
                           green:g/255.0f
                            blue:b/255.0f
                           alpha:1.0];
}

#pragma mark - Colours of Labels and Buttons
// This is what defines how my screen looks like for the most part, see the draw view for some other details
-(void)setupLooks{
    
    self.timerLabel.textColor = [UIColor whiteColor];
    self.timerLabel.layer.borderWidth = 3.0;
    self.timerLabel.layer.borderColor = RGB13(0, 255, 42).CGColor;
    self.timerLabel.layer.cornerRadius = 8.0;
    self.scoreLabel.textColor = [UIColor whiteColor];
    self.scoreLabel.layer.borderWidth = 3.0;
    self.scoreLabel.layer.borderColor = RGB13(0, 255, 42).CGColor;
    self.scoreLabel.layer.cornerRadius = 8.0;
    self.mainMenuButton.tintColor = [UIColor whiteColor];
    self.mainMenuButton.layer.borderWidth = 3.0;
    self.mainMenuButton.layer.borderColor = RGB13(0, 255, 42).CGColor;
    self.mainMenuButton.layer.cornerRadius = 8.0;
}
#pragma mark - Initialise Images
// This is called as view did Load to initialsise all my images (16 of them need to be allowed to accept user interaction) the other 16 need to be set as cover images so they obscure what lies beneath them
-(void)initialiseImages{
    
    [self.a11Image setUserInteractionEnabled:YES];
    UITapGestureRecognizer *a11Tapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(a11Tapped)];
    [a11Tapped setNumberOfTapsRequired:1];
    [self.a11Image addGestureRecognizer:a11Tapped];
    [self.a12Image setUserInteractionEnabled:YES];
    UITapGestureRecognizer *a12Tapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(a12Tapped)];
    [a12Tapped setNumberOfTapsRequired:1];
    [self.a12Image addGestureRecognizer:a12Tapped];
    [self.a13Image setUserInteractionEnabled:YES];
    UITapGestureRecognizer *a13Tapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(a13Tapped)];
    [a13Tapped setNumberOfTapsRequired:1];
    [self.a13Image addGestureRecognizer:a13Tapped];
    [self.a14Image setUserInteractionEnabled:YES];
    UITapGestureRecognizer *a14Tapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(a14Tapped)];
    [a14Tapped setNumberOfTapsRequired:1];
    [self.a14Image addGestureRecognizer:a14Tapped];
    
    [self.a21Image setUserInteractionEnabled:YES];
    UITapGestureRecognizer *a21Tapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(a21Tapped)];
    [a21Tapped setNumberOfTapsRequired:1];
    [self.a21Image addGestureRecognizer:a21Tapped];
    [self.a22Image setUserInteractionEnabled:YES];
    UITapGestureRecognizer *a22Tapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(a22Tapped)];
    [a22Tapped setNumberOfTapsRequired:1];
    [self.a22Image addGestureRecognizer:a22Tapped];
    [self.a23Image setUserInteractionEnabled:YES];
    UITapGestureRecognizer *a23Tapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(a23Tapped)];
    [a23Tapped setNumberOfTapsRequired:1];
    [self.a23Image addGestureRecognizer:a23Tapped];
    [self.a24Image setUserInteractionEnabled:YES];
    UITapGestureRecognizer *a24Tapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(a24Tapped)];
    [a24Tapped setNumberOfTapsRequired:1];
    [self.a24Image addGestureRecognizer:a24Tapped];
    
    [self.a31Image setUserInteractionEnabled:YES];
    UITapGestureRecognizer *a31Tapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(a31Tapped)];
    [a31Tapped setNumberOfTapsRequired:1];
    [self.a31Image addGestureRecognizer:a31Tapped];
    [self.a32Image setUserInteractionEnabled:YES];
    UITapGestureRecognizer *a32Tapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(a32Tapped)];
    [a32Tapped setNumberOfTapsRequired:1];
    [self.a32Image addGestureRecognizer:a32Tapped];
    [self.a33Image setUserInteractionEnabled:YES];
    UITapGestureRecognizer *a33Tapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(a33Tapped)];
    [a33Tapped setNumberOfTapsRequired:1];
    [self.a33Image addGestureRecognizer:a33Tapped];
    [self.a34Image setUserInteractionEnabled:YES];
    UITapGestureRecognizer *a34Tapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(a34Tapped)];
    [a34Tapped setNumberOfTapsRequired:1];
    [self.a34Image addGestureRecognizer:a34Tapped];
    
    [self.a41Image setUserInteractionEnabled:YES];
    UITapGestureRecognizer *a41Tapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(a41Tapped)];
    [a41Tapped setNumberOfTapsRequired:1];
    [self.a41Image addGestureRecognizer:a41Tapped];
    [self.a42Image setUserInteractionEnabled:YES];
    UITapGestureRecognizer *a42Tapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(a42Tapped)];
    [a42Tapped setNumberOfTapsRequired:1];
    [self.a42Image addGestureRecognizer:a42Tapped];
    [self.a43Image setUserInteractionEnabled:YES];
    UITapGestureRecognizer *a43Tapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(a43Tapped)];
    [a43Tapped setNumberOfTapsRequired:1];
    [self.a43Image addGestureRecognizer:a43Tapped];
    [self.a44Image setUserInteractionEnabled:YES];
    UITapGestureRecognizer *a44Tapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(a44Tapped)];
    [a44Tapped setNumberOfTapsRequired:1];
    [self.a44Image addGestureRecognizer:a44Tapped];
    
    [self.a11Cover setImage:[UIImage imageNamed:@"coverImage"]];
    [self.a12Cover setImage:[UIImage imageNamed:@"coverImage"]];
    [self.a13Cover setImage:[UIImage imageNamed:@"coverImage"]];
    [self.a14Cover setImage:[UIImage imageNamed:@"coverImage"]];
    [self.a21Cover setImage:[UIImage imageNamed:@"coverImage"]];
    [self.a22Cover setImage:[UIImage imageNamed:@"coverImage"]];
    [self.a23Cover setImage:[UIImage imageNamed:@"coverImage"]];
    [self.a24Cover setImage:[UIImage imageNamed:@"coverImage"]];
    [self.a31Cover setImage:[UIImage imageNamed:@"coverImage"]];
    [self.a32Cover setImage:[UIImage imageNamed:@"coverImage"]];
    [self.a33Cover setImage:[UIImage imageNamed:@"coverImage"]];
    [self.a34Cover setImage:[UIImage imageNamed:@"coverImage"]];
    [self.a41Cover setImage:[UIImage imageNamed:@"coverImage"]];
    [self.a42Cover setImage:[UIImage imageNamed:@"coverImage"]];
    [self.a43Cover setImage:[UIImage imageNamed:@"coverImage"]];
    [self.a44Cover setImage:[UIImage imageNamed:@"coverImage"]];
    
}
#pragma mark - Timer CountDown
// Countdown timer that goes down every second until reaching zero where it will force you to either the win or lose screen depending on whether your highscore was better than last time
// adapted from https://stackoverflow.com/questions/10663184/implementing-a-countdown-timer-in-objective-c
-(void)tick{
    if ( self.timeTick == 0){
        self.timerLabel.text = [NSString stringWithFormat:@"Time Remaining : %d", self.timeTick];
        // defines how to get to the text file that has been stored
        // adapted from https://stackoverflow.com/questions/1820204/objective-c-creating-a-text-file-with-a-string
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *filePath = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"save.txt"];
        NSMutableDictionary *userData = [NSMutableDictionary dictionaryWithContentsOfFile:filePath];
        int currentHighScore = [[userData valueForKey:@"FlipRetentionHighScore"] intValue]; // creates a temp value of currentHighScore from the permanatly stored data text file
        if (self.flipRetentionData.currentScore > currentHighScore){            // This if statement checks whether you beat yiur kast highscore for this game or not
            // This stores the new highscore in a text file that will be read on the home screen
            int newHighScore = self.flipRetentionData.currentScore;
            NSNumber *newHighScoreNSN = [[NSNumber alloc] initWithInt:newHighScore];
            [userData setValue:newHighScoreNSN forKey:@"FlipRetentionHighScore"];
            [userData writeToFile:filePath atomically:YES];
            // Moves you to the Win Screen
            // adapted from https://www.youtube.com/watch?v=QhNdvCE9jVg 
            UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            ViewController *vc = [mainStoryBoard instantiateViewControllerWithIdentifier:@"FlipRetentionWinScreen"];
            [self presentViewController:vc animated:YES completion:nil];
            
        }
        else {
            // Takes you to the Lose screen
            UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            ViewController *vc = [mainStoryBoard instantiateViewControllerWithIdentifier:@"FlipRetentionLoseScreen"];
            [self presentViewController:vc animated:YES completion:nil];
            
        }
    }
    else {
        // If timer doenst equal zero yet it will decrease the counter by ine again and didplay the output on the time rlabel
        self.timeTick--;
        self.timerLabel.text = [NSString stringWithFormat:@"Time Remaining : %d", self.timeTick];
    }
}

#pragma mark - Full Reset Regenrate Grid
// BigReset is used once the user clear all 16 tiles from the grid, it reset the pair counter that goes from 0 to 8, reset the first Input and user counter that check whether each click is a first or second click, finally it regenrates the grid.
-(void)bigReset{
    self.pairCounter = 0;
    self.userCounter = 0;
    self.firstInput = 0;
    [self generateRandomImages];
    [self imagesBack];
}

#pragma mark - Small Reset For Each Pair
// After every match whether wrong or right it resets the userCounter so that the app can keep telling which is the first image selected and which is the second image selected
-(void)quickreset{
    self.userCounter = 0;
    self.firstInput = 0;
}

#pragma mark - Resetting the Grid
// This function resets all the cover and hidden images as well as their interactions, this is called once a big Reset happens
-(void)imagesBack{
    // Making all the covers back to being visible again, meaning we cant see the images or their pairs
    self.a11Cover.hidden = NO;
    self.a12Cover.hidden = NO;
    self.a13Cover.hidden = NO;
    self.a14Cover.hidden = NO;
    
    self.a21Cover.hidden = NO;
    self.a22Cover.hidden = NO;
    self.a23Cover.hidden = NO;
    self.a24Cover.hidden = NO;
    
    self.a31Cover.hidden = NO;
    self.a32Cover.hidden = NO;
    self.a33Cover.hidden = NO;
    self.a34Cover.hidden = NO;
    
    self.a41Cover.hidden = NO;
    self.a42Cover.hidden = NO;
    self.a43Cover.hidden = NO;
    self.a44Cover.hidden = NO;
    
    // Makes all the images visible again, so once we remove a cover we can see what image is beneath it
    self.a11Image.hidden = NO;
    self.a12Image.hidden = NO;
    self.a13Image.hidden = NO;
    self.a14Image.hidden = NO;
    
    self.a21Image.hidden = NO;
    self.a22Image.hidden = NO;
    self.a23Image.hidden = NO;
    self.a24Image.hidden = NO;
    
    self.a31Image.hidden = NO;
    self.a32Image.hidden = NO;
    self.a33Image.hidden = NO;
    self.a34Image.hidden = NO;
    
    self.a41Image.hidden = NO;
    self.a42Image.hidden = NO;
    self.a43Image.hidden = NO;
    self.a44Image.hidden = NO;
    
    // Makes the user back to being able to interact with the tiles again so they can play the game
    [self.a11Image setUserInteractionEnabled:YES];
    [self.a12Image setUserInteractionEnabled:YES];
    [self.a13Image setUserInteractionEnabled:YES];
    [self.a14Image setUserInteractionEnabled:YES];
    
    [self.a21Image setUserInteractionEnabled:YES];
    [self.a22Image setUserInteractionEnabled:YES];
    [self.a23Image setUserInteractionEnabled:YES];
    [self.a24Image setUserInteractionEnabled:YES];
    
    [self.a31Image setUserInteractionEnabled:YES];
    [self.a32Image setUserInteractionEnabled:YES];
    [self.a33Image setUserInteractionEnabled:YES];
    [self.a34Image setUserInteractionEnabled:YES];
    
    [self.a41Image setUserInteractionEnabled:YES];
    [self.a42Image setUserInteractionEnabled:YES];
    [self.a43Image setUserInteractionEnabled:YES];
    [self.a44Image setUserInteractionEnabled:YES];
}

#pragma mark - Reenable Pair Images
// This function is used when the user gets the selection of the two cards wrong and we need to cover them up again
-(void)reenablePairImage{
    NSLog(@"reenablePairImage working");
    if(self.firstInput == 1){
        self.a11Cover.hidden = NO;
        [self.a11Image setUserInteractionEnabled:YES];
    }
    else if (self.firstInput == 2){
        self.a12Cover.hidden = NO;
        [self.a12Image setUserInteractionEnabled:YES];
        
    }
    else if (self.firstInput == 3){
        self.a13Cover.hidden = NO;
        [self.a13Image setUserInteractionEnabled:YES];
        
    }
    else if (self.firstInput == 4){
        self.a14Cover.hidden = NO;
        [self.a14Image setUserInteractionEnabled:YES];
        
    }
    else if (self.firstInput == 5){
        self.a21Cover.hidden = NO;
        [self.a21Image setUserInteractionEnabled:YES];
        
    }
    else if (self.firstInput == 6){
        self.a22Cover.hidden = NO;
        [self.a22Image setUserInteractionEnabled:YES];
        
    }
    else if (self.firstInput == 7){
        self.a23Cover.hidden = NO;
        [self.a23Image setUserInteractionEnabled:YES];
        
    }
    else if (self.firstInput == 8){
        self.a24Cover.hidden = NO;
        [self.a24Image setUserInteractionEnabled:YES];
        
    }
    else if (self.firstInput == 9){
        self.a31Cover.hidden = NO;
        [self.a31Image setUserInteractionEnabled:YES];
        
    }
    else if (self.firstInput == 10){
        self.a32Cover.hidden = NO;
        [self.a32Image setUserInteractionEnabled:YES];
        
    }
    else if (self.firstInput == 11){
        self.a33Cover.hidden = NO;
        [self.a33Image setUserInteractionEnabled:YES];
        
    }
    else if (self.firstInput == 12){
        self.a34Cover.hidden = NO;
        [self.a34Image setUserInteractionEnabled:YES];
        
    }
    else if (self.firstInput == 13){
        self.a41Cover.hidden = NO;
        [self.a41Image setUserInteractionEnabled:YES];
        
    }
    else if (self.firstInput == 14){
        self.a42Cover.hidden = NO;
        [self.a42Image setUserInteractionEnabled:YES];
        
    }
    else if (self.firstInput == 15){
        self.a43Cover.hidden = NO;
        [self.a43Image setUserInteractionEnabled:YES];
        
    }
    else if (self.firstInput == 16){
        self.a44Cover.hidden = NO;
        [self.a44Image setUserInteractionEnabled:YES];
        
    }
}

#pragma mark - Hide Pair Images
// This is for when the user gets the selection of the two cards correct, we dont reinitialise the covers, we hode the images and then we make it so that the user cant interaact with that segment until a big Reset happens.
-(void)hidePairImage{
    NSLog(@"hide Pair Image is working");
    if(self.firstInput == 1){
        self.a11Image.hidden = YES;
        [self.a11Image setUserInteractionEnabled:NO];
    }
    else if (self.firstInput == 2){
        self.a12Image.hidden = YES;
        [self.a12Image setUserInteractionEnabled:NO];
        
    }
    else if (self.firstInput == 3){
        self.a13Image.hidden = YES;
        [self.a13Image setUserInteractionEnabled:NO];
        
    }
    else if (self.firstInput == 4){
        self.a14Image.hidden = YES;
        [self.a14Image setUserInteractionEnabled:NO];
        
    }
    else if (self.firstInput == 5){
        self.a21Image.hidden = YES;
        [self.a21Image setUserInteractionEnabled:NO];
        
    }
    else if (self.firstInput == 6){
        self.a22Image.hidden = YES;
        [self.a22Image setUserInteractionEnabled:NO];
        
    }
    else if (self.firstInput == 7){
        self.a23Image.hidden = YES;
        [self.a23Image setUserInteractionEnabled:NO];
        
    }
    else if (self.firstInput == 8){
        self.a24Image.hidden = YES;
        [self.a24Image setUserInteractionEnabled:NO];
        
    }
    else if (self.firstInput == 9){
        self.a31Image.hidden = YES;
        [self.a31Image setUserInteractionEnabled:NO];
        
    }
    else if (self.firstInput == 10){
        self.a32Image.hidden = YES;
        [self.a32Image setUserInteractionEnabled:NO];
        
    }
    else if (self.firstInput == 11){
        self.a33Image.hidden = YES;
        [self.a33Image setUserInteractionEnabled:NO];
        
    }
    else if (self.firstInput == 12){
        self.a34Image.hidden = YES;
        [self.a34Image setUserInteractionEnabled:NO];
        
    }
    else if (self.firstInput == 13){
        self.a41Image.hidden = YES;
        [self.a41Image setUserInteractionEnabled:NO];
        
    }
    else if (self.firstInput == 14){
        self.a42Image.hidden = YES;
        [self.a42Image setUserInteractionEnabled:NO];
        
    }
    else if (self.firstInput == 15){
        self.a43Image.hidden = YES;
        [self.a43Image setUserInteractionEnabled:NO];
        
    }
    else if (self.firstInput == 16){
        self.a44Image.hidden = YES;
        [self.a44Image setUserInteractionEnabled:NO];
        
    }
}

#pragma mark - Correct Match Was Chosen
// This functions adds points to the users score, also hides the pair that were chosen and makes them be uninteractive now with the user, esentially making them disappear.
-(void)CorrectMatch{
    [self.flipRetentionData correctAnswer];
    self.scoreLabel.text = [NSString stringWithFormat:@"Score : %d", self.flipRetentionData.currentScore];
    [self hidePairImage];
    [self quickreset];
    self.pairCounter ++;  // Increments pair counter until it reaches 8 which means all the tiles are gone, triggering a big reset
    if(self.pairCounter == 8){
        [self bigReset];
    }
}

#pragma mark - Wrong Match Was Chosen
// This function subtracts points from the users score and makes the images be covered back up again, they can still be interacted with as they are still in play
-(void)incorrectMatch{
    [self.flipRetentionData wrongAnswer];  // Subtract Points
    [self reenablePairImage];
    [self quickreset];
    self.scoreLabel.text = [NSString stringWithFormat:@"Score : %d", self.flipRetentionData.currentScore];
    [self.view setUserInteractionEnabled:NO];
}

#pragma mark - Delay Function
// This fucntion delays the user from being able to click an image after selecting a previous pair, this is to allow the user to see what card was chosen at the second half of the pair so as to prevent confusion
-(void)a11Delay{
    self.a11Cover.hidden = NO;
    [self.view setUserInteractionEnabled:YES];
}
-(void)a12Delay{
    self.a12Cover.hidden = NO;
    [self.view setUserInteractionEnabled:YES];
}
-(void)a13Delay{
    self.a13Cover.hidden = NO;
    [self.view setUserInteractionEnabled:YES];
}
-(void)a14Delay{
    self.a14Cover.hidden = NO;
    [self.view setUserInteractionEnabled:YES];
}
-(void)a21Delay{
    self.a21Cover.hidden = NO;
    [self.view setUserInteractionEnabled:YES];
}
-(void)a22Delay{
    self.a22Cover.hidden = NO;
    [self.view setUserInteractionEnabled:YES];
}
-(void)a23Delay{
    self.a23Cover.hidden = NO;
    [self.view setUserInteractionEnabled:YES];
}
-(void)a24Delay{
    self.a24Cover.hidden = NO;
    [self.view setUserInteractionEnabled:YES];
}
-(void)a31Delay{
    self.a31Cover.hidden = NO;
    [self.view setUserInteractionEnabled:YES];
}
-(void)a32Delay{
    self.a32Cover.hidden = NO;
    [self.view setUserInteractionEnabled:YES];
}
-(void)a33Delay{
    self.a33Cover.hidden = NO;
    [self.view setUserInteractionEnabled:YES];
}
-(void)a34Delay{
    self.a34Cover.hidden = NO;
    [self.view setUserInteractionEnabled:YES];
}
-(void)a41Delay{
    self.a41Cover.hidden = NO;
    [self.view setUserInteractionEnabled:YES];
}
-(void)a42Delay{
    self.a42Cover.hidden = NO;
    [self.view setUserInteractionEnabled:YES];
}
-(void)a43Delay{
    self.a43Cover.hidden = NO;
    [self.view setUserInteractionEnabled:YES];
}
-(void)a44Delay{
    self.a44Cover.hidden = NO;
    [self.view setUserInteractionEnabled:YES];
}

#pragma mark - Any Image Tapped
// All this code below goes through the permuations of whether the shape is the first or second one pressed, and will store a temporary variable if it is the first selection so on the second choice the code can work out whether a pair was found
-(void)a11Tapped{
    NSLog(@"a11 Tapped");
    self.a11Cover.hidden = YES;             // Since a11 is tapped it hides a11Cover to reveal the image in a11
    if(self.userCounter == 0){          // if this is the first half of the pair the user has clicked
        self.pairChecker = self.a11Image.tag;           // Sets the temporary variable to be the tag that refers to that image
        NSLog(@"pair checker is: %d",self.pairChecker);
        self.userCounter ++;            // Increments the user counter so that the app knows the next click will be trying to match it to this one
        self.firstInput = 1;            // Sets the firstInput as 1 since tile a11 was pressed, this is used to hide or recover it later depending on a correct or wrong selection
        [self.a11Image setUserInteractionEnabled:NO];           // makes it so thatthe user cant select the same tile twice in one selection
    }
    else{           // If this image is the second half of the selection
        if ( self.a11Image.tag == self.pairChecker){            // If the first tile and this tile match do this
            NSLog(@"detected second tap");          // If the second tile is a match
            NSLog(@"firstInput was : %d", self.firstInput);
            self.a11Cover.hidden = YES;             // Hide this tile and its cover
            self.a11Image.hidden = YES;
            [self.a11Image setUserInteractionEnabled:NO];           // make it so that the user can no longer interact with this tile until a big reset hapens
            [self CorrectMatch];            // triggers the correct match function this will hide the tile that was selected in the first half of this pair selection using the varibale first input
        }
        else {  // User got the selection wrong
            NSLog(@"detected second tap");
            NSLog(@"firstInput was : %d", self.firstInput);
            [self incorrectMatch];                  // triggers incorrect match  function, which will rehide the two images selected and make them able to be interacted with again
            [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(a11Delay) userInfo:nil repeats:NO]; // has a timer before the user can continue playong, this is so you can see what you clicked on the second half of the pair selection
            
        }
        
    }
    
}

-(void)a12Tapped{
    NSLog(@"a12 Tapped");
    self.a12Cover.hidden = YES;
    if(self.userCounter == 0){
        self.pairChecker = self.a12Image.tag;
        self.userCounter ++;
        self.firstInput = 2;
        [self.a12Image setUserInteractionEnabled:NO];
    }
    else{
        if ( self.a12Image.tag == self.pairChecker){            // If the second tile is a match
            self.a12Cover.hidden = YES;
            self.a12Image.hidden = YES;
            [self.a12Image setUserInteractionEnabled:NO];
            [self CorrectMatch];
        }
        else {
            [self incorrectMatch];
            [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(a12Delay) userInfo:nil repeats:NO];
        }
        
    }
}
-(void)a13Tapped{
    self.a13Cover.hidden = YES;
    if(self.userCounter == 0){
        self.pairChecker = self.a13Image.tag;
        self.userCounter ++;
        self.firstInput = 3;
        [self.a13Image setUserInteractionEnabled:NO];
    }
    else{
        if ( self.a13Image.tag == self.pairChecker){            // If the second tile is a match
            
            self.a13Cover.hidden = YES;
            self.a13Image.hidden = YES;
            [self.a13Image setUserInteractionEnabled:NO];
            [self CorrectMatch];
            
        }
        else {
            [self incorrectMatch];
            [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(a13Delay) userInfo:nil repeats:NO];
            
            
        }
        
    }
}
-(void)a14Tapped{
    self.a14Cover.hidden = YES;
    if(self.userCounter == 0){
        self.pairChecker = self.a14Image.tag;
        self.userCounter ++;
        self.firstInput = 4;
        [self.a14Image setUserInteractionEnabled:NO];
    }
    else{
        if ( self.a14Image.tag == self.pairChecker){            // If the second tile is a match
            
            self.a14Cover.hidden = YES;
            self.a14Image.hidden = YES;
            [self.a14Image setUserInteractionEnabled:NO];
            [self CorrectMatch];
        }
        else {
            [self incorrectMatch];
            [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(a14Delay) userInfo:nil repeats:NO];
            
        }
        
    }
}
-(void)a21Tapped{
    self.a21Cover.hidden = YES;
    if(self.userCounter == 0){
        self.pairChecker = self.a21Image.tag;
        self.userCounter ++;
        self.firstInput = 5;
        [self.a21Image setUserInteractionEnabled:NO];
    }
    else{
        if ( self.a21Image.tag == self.pairChecker){            // If the second tile is a match
            
            self.a21Cover.hidden = YES;
            self.a21Image.hidden = YES;
            [self.a21Image setUserInteractionEnabled:NO];
            [self CorrectMatch];
            
        }
        else {
            [self incorrectMatch];
            [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(a21Delay) userInfo:nil repeats:NO];
            
        }
        
    }
}
-(void)a22Tapped{
    self.a22Cover.hidden = YES;
    if(self.userCounter == 0){
        self.pairChecker = self.a22Image.tag;
        self.userCounter ++;
        self.firstInput = 6;
        [self.a22Image setUserInteractionEnabled:NO];
    }
    else{
        if ( self.a22Image.tag == self.pairChecker){            // If the second tile is a match
            
            self.a22Cover.hidden = YES;
            self.a22Image.hidden = YES;
            [self.a22Image setUserInteractionEnabled:NO];
            [self CorrectMatch];
            
        }
        else {
            [self incorrectMatch];
            [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(a22Delay) userInfo:nil repeats:NO];
            
        }
        
    }
}
-(void)a23Tapped{
    self.a23Cover.hidden = YES;
    if(self.userCounter == 0){
        self.pairChecker = self.a23Image.tag;
        self.userCounter ++;
        self.firstInput = 7;
        [self.a23Image setUserInteractionEnabled:NO];
    }
    else{
        if ( self.a23Image.tag == self.pairChecker){            // If the second tile is a match
            
            self.a23Cover.hidden = YES;
            self.a23Image.hidden = YES;
            [self.a23Image setUserInteractionEnabled:NO];
            [self CorrectMatch];
            
        }
        else {
            [self incorrectMatch];
            [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(a23Delay) userInfo:nil repeats:NO];
            
        }
        
    }
}
-(void)a24Tapped{
    self.a24Cover.hidden = YES;
    if(self.userCounter == 0){
        self.pairChecker = self.a24Image.tag;
        self.userCounter ++;
        self.firstInput = 8;
        [self.a24Image setUserInteractionEnabled:NO];
    }
    else{
        if ( self.a24Image.tag == self.pairChecker){            // If the second tile is a match
            
            self.a24Cover.hidden = YES;
            self.a24Image.hidden = YES;
            [self.a24Image setUserInteractionEnabled:NO];
            [self CorrectMatch];
            
        }
        else {
            [self incorrectMatch];
            [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(a24Delay) userInfo:nil repeats:NO];
            
        }
        
    }
}
-(void)a31Tapped{
    self.a31Cover.hidden = YES;
    if(self.userCounter == 0){
        self.pairChecker = self.a31Image.tag;
        self.userCounter ++;
        self.firstInput = 9;
        [self.a31Image setUserInteractionEnabled:NO];
    }
    else{
        if ( self.a31Image.tag == self.pairChecker){            // If the second tile is a match
            
            self.a31Cover.hidden = YES;
            self.a31Image.hidden = YES;
            [self.a31Image setUserInteractionEnabled:NO];
            [self CorrectMatch];
        }
        else {
            [self incorrectMatch];
            [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(a31Delay) userInfo:nil repeats:NO];
            
        }
        
    }
}
-(void)a32Tapped{
    self.a32Cover.hidden = YES;
    if(self.userCounter == 0){
        self.pairChecker = self.a32Image.tag;
        self.userCounter ++;
        self.firstInput = 10;
        [self.a32Image setUserInteractionEnabled:NO];
    }
    else{
        if ( self.a32Image.tag == self.pairChecker){            // If the second tile is a match
            
            self.a32Cover.hidden = YES;
            self.a32Image.hidden = YES;
            [self.a32Image setUserInteractionEnabled:NO];
            [self CorrectMatch];
            
        }
        else {
            [self incorrectMatch];
            [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(a32Delay) userInfo:nil repeats:NO];
            
        }
        
    }
}
-(void)a33Tapped{
    self.a33Cover.hidden = YES;
    if(self.userCounter == 0){
        self.pairChecker = self.a33Image.tag;
        self.userCounter ++;
        self.firstInput = 11;
        [self.a33Image setUserInteractionEnabled:NO];
    }
    else{
        if ( self.a33Image.tag == self.pairChecker){            // If the second tile is a match
            
            self.a33Cover.hidden = YES;
            self.a33Image.hidden = YES;
            [self.a33Image setUserInteractionEnabled:NO];
            [self CorrectMatch];
            
        }
        else {
            [self incorrectMatch];
            [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(a33Delay) userInfo:nil repeats:NO];
            
        }
        
    }
}
-(void)a34Tapped{
    self.a34Cover.hidden = YES;
    if(self.userCounter == 0){
        self.pairChecker = self.a34Image.tag;
        self.userCounter ++;
        self.firstInput = 12;
        [self.a34Image setUserInteractionEnabled:NO];
    }
    else{
        if ( self.a34Image.tag == self.pairChecker){            // If the second tile is a match
            
            self.a34Cover.hidden = YES;
            self.a34Image.hidden = YES;
            [self.a34Image setUserInteractionEnabled:NO];
            [self CorrectMatch];
            
        }
        else {
            [self incorrectMatch];
            [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(a34Delay) userInfo:nil repeats:NO];
            
        }
        
    }
}
-(void)a41Tapped{
    self.a41Cover.hidden = YES;
    if(self.userCounter == 0){
        self.pairChecker = self.a41Image.tag;
        self.userCounter ++;
        self.firstInput = 13;
        [self.a41Image setUserInteractionEnabled:NO];
    }
    else{
        if ( self.a41Image.tag == self.pairChecker){            // If the second tile is a match
            
            self.a41Cover.hidden = YES;
            self.a41Image.hidden = YES;
            [self.a41Image setUserInteractionEnabled:NO];
            [self CorrectMatch];
            
        }
        else {
            [self incorrectMatch];
            [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(a41Delay) userInfo:nil repeats:NO];
            
        }
        
    }
}
-(void)a42Tapped{
    self.a42Cover.hidden = YES;
    if(self.userCounter == 0){
        self.pairChecker = self.a42Image.tag;
        self.userCounter ++;
        self.firstInput = 14;
        [self.a42Image setUserInteractionEnabled:NO];
    }
    else{
        if ( self.a42Image.tag == self.pairChecker){            // If the second tile is a match
            
            self.a42Cover.hidden = YES;
            self.a42Image.hidden = YES;
            [self.a42Image setUserInteractionEnabled:NO];
            [self CorrectMatch];
            
        }
        else {
            [self incorrectMatch];
            [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(a42Delay) userInfo:nil repeats:NO];
            
        }
        
    }
}
-(void)a43Tapped{
    self.a43Cover.hidden = YES;
    if(self.userCounter == 0){
        self.pairChecker = self.a43Image.tag;
        self.userCounter ++;
        self.firstInput = 15;
        [self.a43Image setUserInteractionEnabled:NO];
    }
    else{
        if ( self.a43Image.tag == self.pairChecker){            // If the second tile is a match
            
            self.a43Cover.hidden = YES;
            self.a43Image.hidden = YES;
            [self.a43Image setUserInteractionEnabled:NO];
            [self CorrectMatch];
            
        }
        else {
            [self incorrectMatch];
            [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(a43Delay) userInfo:nil repeats:NO];
            
        }
        
    }
}
-(void)a44Tapped{
    self.a44Cover.hidden = YES;
    if(self.userCounter == 0){
        self.pairChecker = self.a44Image.tag;
        self.userCounter ++;
        self.firstInput = 16;
        [self.a44Image setUserInteractionEnabled:NO];
    }
    else{
        if ( self.a44Image.tag == self.pairChecker){            // If the second tile is a match
            
            self.a44Cover.hidden = YES;
            self.a44Image.hidden = YES;
            [self.a44Image setUserInteractionEnabled:NO];
            [self CorrectMatch];
            
        }
        else {
            [self incorrectMatch];
            [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(a44Delay) userInfo:nil repeats:NO];
            
        }
        
    }
}

#pragma mark - Generate Random Images
// This function is called at the start of the game and every time a big reset happens, it is used to generate what images are selected and where the pairs of images will go, it works in tandem with  generatePlaceForImages as it goes through the for loop
-(void)generateRandomImages{
    self.flipRetentionData.counterOne = 0;          // This ocunter refers to the eight images that exsist tobe put into the game
    self.flipRetentionData.counterTwo = 0;          // This counter refers to the 16 tiles that are availbe for images to be placed in
    self.tempArray1 = [[NSMutableArray alloc] initWithCapacity:self.flipRetentionData.firstEightPlaces.count];              // copying my permanat array from before so i can remove objects and still have repeatabiliy for more rounds later on
    for (NSInteger index = 0; index < 8; index++) {
        [self.tempArray1 addObject:[self.flipRetentionData.firstEightPlaces objectAtIndex:index]];
    }
    self.tempArray2 = [[NSMutableArray alloc] initWithCapacity:self.flipRetentionData.sixteenPositionTiles.count];
    for (NSInteger index = 0; index < 16; index++) {
        [self.tempArray2 addObject:[self.flipRetentionData.sixteenPositionTiles objectAtIndex:index]];
    }
    for(int i = 0; i<8; i++){           // For the eight images in the selection
        
        NSLog(@"i = %d",i);
        NSLog(@"counter one %d", self.flipRetentionData.counterOne);
        
        [self.flipRetentionData generatePairImages];            // random variable is generated that, the possible random number decreases as the images start to be taken out of the array
        NSLog(@"random number one is : %d", self.flipRetentionData.randomOne);
        NSLog(@"number in array: %@", [self.tempArray1 objectAtIndex:self.flipRetentionData.randomOne]);
        [self.flipRetentionData incrementCounterOne];           // counterOne is incremented so we dont try to reach out of the arrayand crash our app
        if ([[self.tempArray1 objectAtIndex:self.flipRetentionData.randomOne] isEqual: @1]){            // if statement referiing to each of the possible eight images to be picked, depending on what number is taken out fo the array a different tag will be set for tagSetter
            self.tagSetter = 1;
            [self.flipRetentionData generatePairPositions];             // Other half of the function that geenrates the grid, the next pragma mark down
            [self generatePlaceForImage];           // sending the value that was chosen to the next function
                        //This next bit happens twice so that each image has exactly two postions it will be in, making th game have its core functiuonality
            [self.flipRetentionData incrementCounterTwo];
            [self.tempArray2 removeObjectAtIndex:self.flipRetentionData.randomTwo];             // remove the tile from the array
            [self.flipRetentionData generatePairPositions];
            [self generatePlaceForImage];
            [self.flipRetentionData incrementCounterTwo];
            [self.tempArray2 removeObjectAtIndex:self.flipRetentionData.randomTwo];             // remove the tie from the array
            [self.tempArray1 removeObjectAtIndex:self.flipRetentionData.randomOne];             // remove the image from the array
            NSLog(@"Number 1 Picked");
        }
        else if ([[self.tempArray1 objectAtIndex:self.flipRetentionData.randomOne]  isEqual: @2]){
            self.tagSetter = 2;
            [self.flipRetentionData generatePairPositions];
            [self generatePlaceForImage];
            [self.flipRetentionData incrementCounterTwo];
            [self.tempArray2 removeObjectAtIndex:self.flipRetentionData.randomTwo];
            [self.flipRetentionData generatePairPositions];
            [self generatePlaceForImage];
            [self.flipRetentionData incrementCounterTwo];
            [self.tempArray2 removeObjectAtIndex:self.flipRetentionData.randomTwo];
            [self.tempArray1 removeObjectAtIndex:self.flipRetentionData.randomOne];
            NSLog(@"Number 2 Picked");
        }
        else if ([[self.tempArray1 objectAtIndex:self.flipRetentionData.randomOne]  isEqual: @3]){
            self.tagSetter = 3;
            [self.flipRetentionData generatePairPositions];
            [self generatePlaceForImage];
            [self.flipRetentionData incrementCounterTwo];
            [self.tempArray2 removeObjectAtIndex:self.flipRetentionData.randomTwo];
            [self.flipRetentionData generatePairPositions];
            [self generatePlaceForImage];
            [self.flipRetentionData incrementCounterTwo];
            [self.tempArray2 removeObjectAtIndex:self.flipRetentionData.randomTwo];
            [self.tempArray1 removeObjectAtIndex:self.flipRetentionData.randomOne];
            NSLog(@"Number 3 picked");
        }
        else if ([[self.tempArray1 objectAtIndex:self.flipRetentionData.randomOne]  isEqual: @4]){
            self.tagSetter = 4;
            [self.flipRetentionData generatePairPositions];
            [self generatePlaceForImage];
            [self.flipRetentionData incrementCounterTwo];
            [self.tempArray2 removeObjectAtIndex:self.flipRetentionData.randomTwo];
            [self.flipRetentionData generatePairPositions];
            [self generatePlaceForImage];
            [self.flipRetentionData incrementCounterTwo];
            [self.tempArray2 removeObjectAtIndex:self.flipRetentionData.randomTwo];
            [self.tempArray1 removeObjectAtIndex:self.flipRetentionData.randomOne];
            NSLog(@"Number 4 Picked");
        }
        else if ([[self.tempArray1 objectAtIndex:self.flipRetentionData.randomOne]  isEqual: @5]){
            self.tagSetter = 5;
            [self.flipRetentionData generatePairPositions];
            [self generatePlaceForImage];
            [self.flipRetentionData incrementCounterTwo];
            [self.tempArray2 removeObjectAtIndex:self.flipRetentionData.randomTwo];
            [self.flipRetentionData generatePairPositions];
            [self generatePlaceForImage];
            [self.flipRetentionData incrementCounterTwo];
            [self.tempArray2 removeObjectAtIndex:self.flipRetentionData.randomTwo];
            [self.tempArray1 removeObjectAtIndex:self.flipRetentionData.randomOne];
            NSLog(@"Number 5 Picked");
        }
        else if ([[self.tempArray1 objectAtIndex:self.flipRetentionData.randomOne]  isEqual: @6]){
            self.tagSetter = 6;
            [self.flipRetentionData generatePairPositions];
            [self generatePlaceForImage];
            [self.flipRetentionData incrementCounterTwo];
            [self.tempArray2 removeObjectAtIndex:self.flipRetentionData.randomTwo];
            [self.flipRetentionData generatePairPositions];
            [self generatePlaceForImage];
            [self.flipRetentionData incrementCounterTwo];
            [self.tempArray2 removeObjectAtIndex:self.flipRetentionData.randomTwo];
            [self.tempArray1 removeObjectAtIndex:self.flipRetentionData.randomOne];
            NSLog(@"Number 6 Picked");
        }
        else if ([[self.tempArray1 objectAtIndex:self.flipRetentionData.randomOne]  isEqual: @7]){
            self.tagSetter = 7;
            [self.flipRetentionData generatePairPositions];
            [self generatePlaceForImage];
            [self.flipRetentionData incrementCounterTwo];
            [self.tempArray2 removeObjectAtIndex:self.flipRetentionData.randomTwo];
            [self.flipRetentionData generatePairPositions];
            [self generatePlaceForImage];
            [self.flipRetentionData incrementCounterTwo];
            [self.tempArray2 removeObjectAtIndex:self.flipRetentionData.randomTwo];
            [self.tempArray1 removeObjectAtIndex:self.flipRetentionData.randomOne];
            NSLog(@"Number 7 Picked");
        }
        else if ([[self.tempArray1 objectAtIndex:self.flipRetentionData.randomOne]  isEqual: @8]){
            self.tagSetter = 8;
            [self.flipRetentionData generatePairPositions];
            [self generatePlaceForImage];
            [self.flipRetentionData incrementCounterTwo];
            [self.tempArray2 removeObjectAtIndex:self.flipRetentionData.randomTwo];
            [self.flipRetentionData generatePairPositions];
            [self generatePlaceForImage];
            [self.flipRetentionData incrementCounterTwo];
            [self.tempArray2 removeObjectAtIndex:self.flipRetentionData.randomTwo];
            [self.tempArray1 removeObjectAtIndex:self.flipRetentionData.randomOne];
            NSLog(@"Number 8 Picked");
        }
        
    }
}

#pragma mark - Generate Place For Image
// This fuction is called from generateRandomImages it takes two position tiles and allocates an image to them in turn until it runs out of both imagetiles and images simaltaneously
-(void)generatePlaceForImage{
    NSLog(@"Random Place selector number is %d", self.flipRetentionData.randomTwo);
    if([[self.tempArray2 objectAtIndex:self.flipRetentionData.randomTwo]  isEqual: @1]){ // Depending on the first if statment value we are generating which tile we are going to first
        NSLog(@" picture a11");
        if (self.tagSetter == 1){           // then all the indented if staemnts are just seeing what image was chosen in the previous function and we are now storing that imaage in that tile , this happens twice for each image
            [self.a11Image setImage:[UIImage imageNamed:@"setOnePairOne"]];
            [self.a11Image setTag:1];
        }
        else if(self.tagSetter == 2){
            [self.a11Image setImage:[UIImage imageNamed:@"setOnePairTwo"]];
            [self.a11Image setTag:2];
        }
        else if(self.tagSetter == 3){
            [self.a11Image setImage:[UIImage imageNamed:@"setOnePairThree"]];
            [self.a11Image setTag:3];
        }
        else if(self.tagSetter == 4){
            [self.a11Image setImage:[UIImage imageNamed:@"setOnePairFour"]];
            [self.a11Image setTag:4];
        }
        else if(self.tagSetter == 5){
            [self.a11Image setImage:[UIImage imageNamed:@"setOnePairFive"]];
            [self.a11Image setTag:5];
        }
        else if(self.tagSetter == 6){
            [self.a11Image setImage:[UIImage imageNamed:@"setOnePairSix"]];
            [self.a11Image setTag:6];
        }
        else if(self.tagSetter == 7){
            [self.a11Image setImage:[UIImage imageNamed:@"setOnePairSeven"]];
            [self.a11Image setTag:7];
        }
        else if(self.tagSetter == 8){
            [self.a11Image setImage:[UIImage imageNamed:@"setOnePairEight"]];
            [self.a11Image setTag:8];
        }
        
    }
    if([[self.tempArray2 objectAtIndex:self.flipRetentionData.randomTwo]  isEqual: @2]){
        NSLog(@" picture a12");
        if (self.tagSetter == 1){
            [self.a12Image setImage:[UIImage imageNamed:@"setOnePairOne"]];
            [self.a12Image setTag:1];
        }
        else if(self.tagSetter == 2){
            [self.a12Image setImage:[UIImage imageNamed:@"setOnePairTwo"]];
            [self.a12Image setTag:2];
        }
        else if(self.tagSetter == 3){
            [self.a12Image setImage:[UIImage imageNamed:@"setOnePairThree"]];
            [self.a12Image setTag:3];
        }
        else if(self.tagSetter == 4){
            [self.a12Image setImage:[UIImage imageNamed:@"setOnePairFour"]];
            [self.a12Image setTag:4];
        }
        else if(self.tagSetter == 5){
            [self.a12Image setImage:[UIImage imageNamed:@"setOnePairFive"]];
            [self.a12Image setTag:5];
        }
        else if(self.tagSetter == 6){
            [self.a12Image setImage:[UIImage imageNamed:@"setOnePairSix"]];
            [self.a12Image setTag:6];
        }
        else if(self.tagSetter == 7){
            [self.a12Image setImage:[UIImage imageNamed:@"setOnePairSeven"]];
            [self.a12Image setTag:7];
        }
        else if(self.tagSetter == 8){
            [self.a12Image setImage:[UIImage imageNamed:@"setOnePairEight"]];
            [self.a12Image setTag:8];
        }
        
    }
    if([[self.tempArray2 objectAtIndex:self.flipRetentionData.randomTwo]  isEqual: @3]){
        NSLog(@" picture a13");
        if (self.tagSetter == 1){
            [self.a13Image setImage:[UIImage imageNamed:@"setOnePairOne"]];
            [self.a13Image setTag:1];
        }
        else if(self.tagSetter == 2){
            [self.a13Image setImage:[UIImage imageNamed:@"setOnePairTwo"]];
            [self.a13Image setTag:2];
        }
        else if(self.tagSetter == 3){
            [self.a13Image setImage:[UIImage imageNamed:@"setOnePairThree"]];
            [self.a13Image setTag:3];
        }
        else if(self.tagSetter == 4){
            [self.a13Image setImage:[UIImage imageNamed:@"setOnePairFour"]];
            [self.a13Image setTag:4];
        }
        else if(self.tagSetter == 5){
            [self.a13Image setImage:[UIImage imageNamed:@"setOnePairFive"]];
            [self.a13Image setTag:5];
        }
        else if(self.tagSetter == 6){
            [self.a13Image setImage:[UIImage imageNamed:@"setOnePairSix"]];
            [self.a13Image setTag:6];
        }
        else if(self.tagSetter == 7){
            [self.a13Image setImage:[UIImage imageNamed:@"setOnePairSeven"]];
            [self.a13Image setTag:7];
        }
        else if(self.tagSetter == 8){
            [self.a13Image setImage:[UIImage imageNamed:@"setOnePairEight"]];
            [self.a13Image setTag:8];
        }
        
    }
    if([[self.tempArray2 objectAtIndex:self.flipRetentionData.randomTwo]  isEqual: @4]){
        NSLog(@" picture a14");
        if (self.tagSetter == 1){
            [self.a14Image setImage:[UIImage imageNamed:@"setOnePairOne"]];
            [self.a14Image setTag:1];
        }
        else if(self.tagSetter == 2){
            [self.a14Image setImage:[UIImage imageNamed:@"setOnePairTwo"]];
            [self.a14Image setTag:2];
        }
        else if(self.tagSetter == 3){
            [self.a14Image setImage:[UIImage imageNamed:@"setOnePairThree"]];
            [self.a14Image setTag:3];
        }
        else if(self.tagSetter == 4){
            [self.a14Image setImage:[UIImage imageNamed:@"setOnePairFour"]];
            [self.a14Image setTag:4];
        }
        else if(self.tagSetter == 5){
            [self.a14Image setImage:[UIImage imageNamed:@"setOnePairFive"]];
            [self.a14Image setTag:5];
        }
        else if(self.tagSetter == 6){
            [self.a14Image setImage:[UIImage imageNamed:@"setOnePairSix"]];
            [self.a14Image setTag:6];
        }
        else if(self.tagSetter == 7){
            [self.a14Image setImage:[UIImage imageNamed:@"setOnePairSeven"]];
            [self.a14Image setTag:7];
        }
        else if(self.tagSetter == 8){
            [self.a14Image setImage:[UIImage imageNamed:@"setOnePairEight"]];
            [self.a14Image setTag:8];
        }
        
    }
    if([[self.tempArray2 objectAtIndex:self.flipRetentionData.randomTwo]  isEqual: @5]){
        NSLog(@" picture a21");
        if (self.tagSetter == 1){
            [self.a21Image setImage:[UIImage imageNamed:@"setOnePairOne"]];
            [self.a21Image setTag:1];
        }
        else if(self.tagSetter == 2){
            [self.a21Image setImage:[UIImage imageNamed:@"setOnePairTwo"]];
            [self.a21Image setTag:2];
        }
        else if(self.tagSetter == 3){
            [self.a21Image setImage:[UIImage imageNamed:@"setOnePairThree"]];
            [self.a21Image setTag:3];
        }
        else if(self.tagSetter == 4){
            [self.a21Image setImage:[UIImage imageNamed:@"setOnePairFour"]];
            [self.a21Image setTag:4];
        }
        else if(self.tagSetter == 5){
            [self.a21Image setImage:[UIImage imageNamed:@"setOnePairFive"]];
            [self.a21Image setTag:5];
        }
        else if(self.tagSetter == 6){
            [self.a21Image setImage:[UIImage imageNamed:@"setOnePairSix"]];
            [self.a21Image setTag:6];
        }
        else if(self.tagSetter == 7){
            [self.a21Image setImage:[UIImage imageNamed:@"setOnePairSeven"]];
            [self.a21Image setTag:7];
        }
        else if(self.tagSetter == 8){
            [self.a21Image setImage:[UIImage imageNamed:@"setOnePairEight"]];
            [self.a21Image setTag:8];
        }
        
    }
    if([[self.tempArray2 objectAtIndex:self.flipRetentionData.randomTwo]  isEqual: @6]){
        NSLog(@" picture a22");
        if (self.tagSetter == 1){
            [self.a22Image setImage:[UIImage imageNamed:@"setOnePairOne"]];
            [self.a22Image setTag:1];
        }
        else if(self.tagSetter == 2){
            [self.a22Image setImage:[UIImage imageNamed:@"setOnePairTwo"]];
            [self.a22Image setTag:2];
        }
        else if(self.tagSetter == 3){
            [self.a22Image setImage:[UIImage imageNamed:@"setOnePairThree"]];
            [self.a22Image setTag:3];
        }
        else if(self.tagSetter == 4){
            [self.a22Image setImage:[UIImage imageNamed:@"setOnePairFour"]];
            [self.a22Image setTag:4];
        }
        else if(self.tagSetter == 5){
            [self.a22Image setImage:[UIImage imageNamed:@"setOnePairFive"]];
            [self.a22Image setTag:5];
        }
        else if(self.tagSetter == 6){
            [self.a22Image setImage:[UIImage imageNamed:@"setOnePairSix"]];
            [self.a22Image setTag:6];
        }
        else if(self.tagSetter == 7){
            [self.a22Image setImage:[UIImage imageNamed:@"setOnePairSeven"]];
            [self.a22Image setTag:7];
        }
        else if(self.tagSetter == 8){
            [self.a22Image setImage:[UIImage imageNamed:@"setOnePairEight"]];
            [self.a22Image setTag:8];
        }
        
    }
    if([[self.tempArray2 objectAtIndex:self.flipRetentionData.randomTwo]  isEqual: @7]){
        NSLog(@" picture a23");
        if (self.tagSetter == 1){
            [self.a23Image setImage:[UIImage imageNamed:@"setOnePairOne"]];
            [self.a23Image setTag:1];
        }
        else if(self.tagSetter == 2){
            [self.a23Image setImage:[UIImage imageNamed:@"setOnePairTwo"]];
            [self.a23Image setTag:2];
        }
        else if(self.tagSetter == 3){
            [self.a23Image setImage:[UIImage imageNamed:@"setOnePairThree"]];
            [self.a23Image setTag:3];
        }
        else if(self.tagSetter == 4){
            [self.a23Image setImage:[UIImage imageNamed:@"setOnePairFour"]];
            [self.a23Image setTag:4];
        }
        else if(self.tagSetter == 5){
            [self.a23Image setImage:[UIImage imageNamed:@"setOnePairFive"]];
            [self.a23Image setTag:5];
        }
        else if(self.tagSetter == 6){
            [self.a23Image setImage:[UIImage imageNamed:@"setOnePairSix"]];
            [self.a23Image setTag:6];
        }
        else if(self.tagSetter == 7){
            [self.a23Image setImage:[UIImage imageNamed:@"setOnePairSeven"]];
            [self.a23Image setTag:7];
        }
        else if(self.tagSetter == 8){
            [self.a23Image setImage:[UIImage imageNamed:@"setOnePairEight"]];
            [self.a23Image setTag:8];
        }
        
    }
    if([[self.tempArray2 objectAtIndex:self.flipRetentionData.randomTwo]  isEqual: @8]){
        NSLog(@" picture a24");
        if (self.tagSetter == 1){
            [self.a24Image setImage:[UIImage imageNamed:@"setOnePairOne"]];
            [self.a24Image setTag:1];
        }
        else if(self.tagSetter == 2){
            [self.a24Image setImage:[UIImage imageNamed:@"setOnePairTwo"]];
            [self.a24Image setTag:2];
        }
        else if(self.tagSetter == 3){
            [self.a24Image setImage:[UIImage imageNamed:@"setOnePairThree"]];
            [self.a24Image setTag:3];
        }
        else if(self.tagSetter == 4){
            [self.a24Image setImage:[UIImage imageNamed:@"setOnePairFour"]];
            [self.a24Image setTag:4];
        }
        else if(self.tagSetter == 5){
            [self.a24Image setImage:[UIImage imageNamed:@"setOnePairFive"]];
            [self.a24Image setTag:5];
        }
        else if(self.tagSetter == 6){
            [self.a24Image setImage:[UIImage imageNamed:@"setOnePairSix"]];
            [self.a24Image setTag:6];
        }
        else if(self.tagSetter == 7){
            [self.a24Image setImage:[UIImage imageNamed:@"setOnePairSeven"]];
            [self.a24Image setTag:7];
        }
        else if(self.tagSetter == 8){
            [self.a24Image setImage:[UIImage imageNamed:@"setOnePairEight"]];
            [self.a24Image setTag:8];
        }
        
    }
    if([[self.tempArray2 objectAtIndex:self.flipRetentionData.randomTwo]  isEqual: @9]){
        NSLog(@" picture a31");
        if (self.tagSetter == 1){
            [self.a31Image setImage:[UIImage imageNamed:@"setOnePairOne"]];
            [self.a31Image setTag:1];
        }
        else if(self.tagSetter == 2){
            [self.a31Image setImage:[UIImage imageNamed:@"setOnePairTwo"]];
            [self.a31Image setTag:2];
        }
        else if(self.tagSetter == 3){
            [self.a31Image setImage:[UIImage imageNamed:@"setOnePairThree"]];
            [self.a31Image setTag:3];
        }
        else if(self.tagSetter == 4){
            [self.a31Image setImage:[UIImage imageNamed:@"setOnePairFour"]];
            [self.a31Image setTag:4];
        }
        else if(self.tagSetter == 5){
            [self.a31Image setImage:[UIImage imageNamed:@"setOnePairFive"]];
            [self.a31Image setTag:5];
        }
        else if(self.tagSetter == 6){
            [self.a31Image setImage:[UIImage imageNamed:@"setOnePairSix"]];
            [self.a31Image setTag:6];
        }
        else if(self.tagSetter == 7){
            [self.a31Image setImage:[UIImage imageNamed:@"setOnePairSeven"]];
            [self.a31Image setTag:7];
        }
        else if(self.tagSetter == 8){
            [self.a31Image setImage:[UIImage imageNamed:@"setOnePairEight"]];
            [self.a31Image setTag:8];
        }
        
    }
    if([[self.tempArray2 objectAtIndex:self.flipRetentionData.randomTwo]  isEqual: @10]){
        NSLog(@" picture a32");
        if (self.tagSetter == 1){
            [self.a32Image setImage:[UIImage imageNamed:@"setOnePairOne"]];
            [self.a32Image setTag:1];
        }
        else if(self.tagSetter == 2){
            [self.a32Image setImage:[UIImage imageNamed:@"setOnePairTwo"]];
            [self.a32Image setTag:2];
        }
        else if(self.tagSetter== 3){
            [self.a32Image setImage:[UIImage imageNamed:@"setOnePairThree"]];
            [self.a32Image setTag:3];
        }
        else if(self.tagSetter == 4){
            [self.a32Image setImage:[UIImage imageNamed:@"setOnePairFour"]];
            [self.a32Image setTag:4];
        }
        else if(self.tagSetter == 5){
            [self.a32Image setImage:[UIImage imageNamed:@"setOnePairFive"]];
            [self.a32Image setTag:5];
        }
        else if(self.tagSetter == 6){
            [self.a32Image setImage:[UIImage imageNamed:@"setOnePairSix"]];
            [self.a32Image setTag:6];
        }
        else if(self.tagSetter == 7){
            [self.a32Image setImage:[UIImage imageNamed:@"setOnePairSeven"]];
            [self.a32Image setTag:7];
        }
        else if(self.tagSetter == 8){
            [self.a32Image setImage:[UIImage imageNamed:@"setOnePairEight"]];
            [self.a32Image setTag:8];
        }
        
    }
    if([[self.tempArray2 objectAtIndex:self.flipRetentionData.randomTwo]  isEqual: @11]){
        NSLog(@" picture a33");
        if (self.tagSetter == 1){
            [self.a33Image setImage:[UIImage imageNamed:@"setOnePairOne"]];
            [self.a33Image setTag:1];
        }
        else if(self.tagSetter == 2){
            [self.a33Image setImage:[UIImage imageNamed:@"setOnePairTwo"]];
            [self.a33Image setTag:2];
        }
        else if(self.tagSetter == 3){
            [self.a33Image setImage:[UIImage imageNamed:@"setOnePairThree"]];
            [self.a33Image setTag:3];
        }
        else if(self.tagSetter == 4){
            [self.a33Image setImage:[UIImage imageNamed:@"setOnePairFour"]];
            [self.a33Image setTag:4];
        }
        else if(self.tagSetter == 5){
            [self.a33Image setImage:[UIImage imageNamed:@"setOnePairFive"]];
            [self.a33Image setTag:5];
        }
        else if(self.tagSetter == 6){
            [self.a33Image setImage:[UIImage imageNamed:@"setOnePairSix"]];
            [self.a33Image setTag:6];
        }
        else if(self.tagSetter == 7){
            [self.a33Image setImage:[UIImage imageNamed:@"setOnePairSeven"]];
            [self.a33Image setTag:7];
        }
        else if(self.tagSetter == 8){
            [self.a33Image setImage:[UIImage imageNamed:@"setOnePairEight"]];
            [self.a33Image setTag:8];
        }
        
    }
    if([[self.tempArray2 objectAtIndex:self.flipRetentionData.randomTwo]  isEqual: @12]){
        NSLog(@" picture a34");
        if (self.tagSetter == 1){
            [self.a34Image setImage:[UIImage imageNamed:@"setOnePairOne"]];
            [self.a34Image setTag:1];
        }
        else if(self.tagSetter == 2){
            [self.a34Image setImage:[UIImage imageNamed:@"setOnePairTwo"]];
            [self.a34Image setTag:2];
        }
        else if(self.tagSetter == 3){
            [self.a34Image setImage:[UIImage imageNamed:@"setOnePairThree"]];
            [self.a34Image setTag:3];
        }
        else if(self.tagSetter == 4){
            [self.a34Image setImage:[UIImage imageNamed:@"setOnePairFour"]];
            [self.a34Image setTag:4];
        }
        else if(self.tagSetter == 5){
            [self.a34Image setImage:[UIImage imageNamed:@"setOnePairFive"]];
            [self.a34Image setTag:5];
        }
        else if(self.tagSetter == 6){
            [self.a34Image setImage:[UIImage imageNamed:@"setOnePairSix"]];
            [self.a34Image setTag:6];
        }
        else if(self.tagSetter == 7){
            [self.a34Image setImage:[UIImage imageNamed:@"setOnePairSeven"]];
            [self.a34Image setTag:7];
        }
        else if(self.tagSetter == 8){
            [self.a34Image setImage:[UIImage imageNamed:@"setOnePairEight"]];
            [self.a34Image setTag:8];
        }
        
    }
    if([[self.tempArray2 objectAtIndex:self.flipRetentionData.randomTwo]  isEqual: @13]){
        NSLog(@" picture a41");
        if (self.tagSetter == 1){
            [self.a41Image setImage:[UIImage imageNamed:@"setOnePairOne"]];
            [self.a41Image setTag:1];
        }
        else if(self.tagSetter == 2){
            [self.a41Image setImage:[UIImage imageNamed:@"setOnePairTwo"]];
            [self.a41Image setTag:2];
        }
        else if(self.tagSetter== 3){
            [self.a41Image setImage:[UIImage imageNamed:@"setOnePairThree"]];
            [self.a41Image setTag:3];
        }
        else if(self.tagSetter == 4){
            [self.a41Image setImage:[UIImage imageNamed:@"setOnePairFour"]];
            [self.a41Image setTag:4];
        }
        else if(self.tagSetter == 5){
            [self.a41Image setImage:[UIImage imageNamed:@"setOnePairFive"]];
            [self.a41Image setTag:5];
        }
        else if(self.tagSetter == 6){
            [self.a41Image setImage:[UIImage imageNamed:@"setOnePairSix"]];
            [self.a41Image setTag:6];
        }
        else if(self.tagSetter == 7){
            [self.a41Image setImage:[UIImage imageNamed:@"setOnePairSeven"]];
            [self.a41Image setTag:7];
        }
        else if(self.tagSetter == 8){
            [self.a41Image setImage:[UIImage imageNamed:@"setOnePairEight"]];
            [self.a41Image setTag:8];
        }
        
    }
    if([[self.tempArray2 objectAtIndex:self.flipRetentionData.randomTwo]  isEqual: @14]){
        NSLog(@" picture a42");
        if (self.tagSetter == 1){
            [self.a42Image setImage:[UIImage imageNamed:@"setOnePairOne"]];
            [self.a42Image setTag:1];
        }
        else if(self.tagSetter == 2){
            [self.a42Image setImage:[UIImage imageNamed:@"setOnePairTwo"]];
            [self.a42Image setTag:2];
        }
        else if(self.tagSetter == 3){
            [self.a42Image setImage:[UIImage imageNamed:@"setOnePairThree"]];
            [self.a42Image setTag:3];
        }
        else if(self.tagSetter== 4){
            [self.a42Image setImage:[UIImage imageNamed:@"setOnePairFour"]];
            [self.a42Image setTag:4];
        }
        else if(self.tagSetter == 5){
            [self.a42Image setImage:[UIImage imageNamed:@"setOnePairFive"]];
            [self.a42Image setTag:5];
        }
        else if(self.tagSetter == 6){
            [self.a42Image setImage:[UIImage imageNamed:@"setOnePairSix"]];
            [self.a42Image setTag:6];
        }
        else if(self.tagSetter == 7){
            [self.a42Image setImage:[UIImage imageNamed:@"setOnePairSeven"]];
            [self.a42Image setTag:7];
        }
        else if(self.tagSetter == 8){
            [self.a42Image setImage:[UIImage imageNamed:@"setOnePairEight"]];
            [self.a42Image setTag:8];
        }
        
    }
    if([[self.tempArray2 objectAtIndex:self.flipRetentionData.randomTwo]  isEqual: @15]){
        NSLog(@" picture a43");
        if (self.tagSetter == 1){
            [self.a43Image setImage:[UIImage imageNamed:@"setOnePairOne"]];
            [self.a43Image setTag:1];
        }
        else if(self.tagSetter == 2){
            [self.a43Image setImage:[UIImage imageNamed:@"setOnePairTwo"]];
            [self.a43Image setTag:2];
        }
        else if(self.tagSetter == 3){
            [self.a43Image setImage:[UIImage imageNamed:@"setOnePairThree"]];
            [self.a43Image setTag:3];
        }
        else if(self.tagSetter == 4){
            [self.a43Image setImage:[UIImage imageNamed:@"setOnePairFour"]];
            [self.a43Image setTag:4];
        }
        else if(self.tagSetter == 5){
            [self.a43Image setImage:[UIImage imageNamed:@"setOnePairFive"]];
            [self.a43Image setTag:5];
        }
        else if(self.tagSetter == 6){
            [self.a43Image setImage:[UIImage imageNamed:@"setOnePairSix"]];
            [self.a43Image setTag:6];
        }
        else if(self.tagSetter == 7){
            [self.a43Image setImage:[UIImage imageNamed:@"setOnePairSeven"]];
            [self.a43Image setTag:7];
        }
        else if(self.tagSetter == 8){
            [self.a43Image setImage:[UIImage imageNamed:@"setOnePairEight"]];
            [self.a43Image setTag:8];
        }
        
    }
    if([[self.tempArray2 objectAtIndex:self.flipRetentionData.randomTwo]  isEqual: @16]){
        NSLog(@" picture a44");
        if (self.tagSetter == 1){
            [self.a44Image setImage:[UIImage imageNamed:@"setOnePairOne"]];
            [self.a44Image setTag:1];
        }
        else if(self.tagSetter == 2){
            [self.a44Image setImage:[UIImage imageNamed:@"setOnePairTwo"]];
            [self.a44Image setTag:2];
        }
        else if(self.tagSetter == 3){
            [self.a44Image setImage:[UIImage imageNamed:@"setOnePairThree"]];
            [self.a44Image setTag:3];
        }
        else if(self.tagSetter == 4){
            [self.a44Image setImage:[UIImage imageNamed:@"setOnePairFour"]];
            [self.a44Image setTag:4];
        }
        else if(self.tagSetter == 5){
            [self.a44Image setImage:[UIImage imageNamed:@"setOnePairFive"]];
            [self.a44Image setTag:5];
        }
        else if(self.tagSetter == 6){
            [self.a44Image setImage:[UIImage imageNamed:@"setOnePairSix"]];
            [self.a44Image setTag:6];
        }
        else if(self.tagSetter == 7){
            [self.a44Image setImage:[UIImage imageNamed:@"setOnePairSeven"]];
            [self.a44Image setTag:7];
        }
        else if(self.tagSetter == 8){
            [self.a44Image setImage:[UIImage imageNamed:@"setOnePairEight"]];
            [self.a44Image setTag:8];
        }
        
    }
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark - Back To Main Menu
// This allows the user to exit the game ealry if they so wish so they can head back to the main menu
- (IBAction)mainMenuButtonPressed:(UIButton *)sender {
    
    UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UINavigationController *nc = [mainStoryBoard instantiateViewControllerWithIdentifier:@"HomePage"];
    [self presentViewController:nc animated:YES completion:nil];
}
@end
