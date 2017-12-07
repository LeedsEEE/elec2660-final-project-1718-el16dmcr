//
//  OpticalConundrumController.m
//  Axon Evolution
//
//  Created by David Russell [el16dmcr] on 24/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "OpticalConundrumController.h"
#import "ViewController.h"


@interface OpticalConundrumController ()

@end

@implementation OpticalConundrumController

#pragma mark - Initialisation of App
// All the initial setup for this screen when it loads
- (void)viewDidLoad {
    [super viewDidLoad];
    self.opticalConundrumData = [[OpticalConundrumData alloc] init];
    SettingsData *data = [SettingsData sharedInstance]; // Allows this game to read the data from the settings page and give the user the correct amount of time and points awarded depending on what the user set
  
    self.tempArray = [[NSMutableArray alloc] init]; // Allocates memory for my array, this array is for duplicating my stored array and then removing objects for each round of the game
    self.colourArray = [[NSMutableArray alloc] init]; // Allocates memory for my main array the colour array
    self.colourArray = [NSMutableArray arrayWithObjects: [UIColor greenColor], //Setting what colours are to be used for my game, this array will not be altered in any way it will just get copied over and over again
                        [UIColor blueColor],
                        [UIColor redColor],
                        [UIColor magentaColor],
                        [UIColor blackColor],
                        [UIColor cyanColor],
                        [UIColor orangeColor],
                        [UIColor brownColor], nil];
    
    [self randomWordColourChosen]; //initial word chosen
    [self randomFontColourChosen];  //initial font colour chosen
    [self randomCorrectButtonChosen]; // Generates the random number that will then go on to define which button will have the correct answer on it
    [self randomThirdButtonChosen];  // Generates random number to select which colour will go on the third button
    [self randomFourthButtonChosen]; //Generates a random colour to select which colour will go on the fourth button
    [self wordDefiner]; // From the random variable previously generated it will find the correct word and display it on the label
    [self colourDefiner]; // From a previously selected random number it will generate the font colour fo the displayed word
    [self correctButtonSelector];  // From a previosuly geenrated random number generator it will choose which button holds the right answer
    // Updates the label
    self.shownColourWordLabel.text = self.shownColourWord;
    self.shownColourWordLabel.textColor = self.wrongColour;
    
    // Updates score label
    self.scoreLabel.text = [NSString stringWithFormat: @"Score : %d",self.opticalConundrumData.startPoints];
    [self.opticalConundrumData getInitialScore]; // Pulls in the correct data from my data file
    
    NSLog(@"%@",self.shownColourWord);
    // This segment of code was referenced and slightly changed from , it is used to tick down a timer and diplay it on a label
    self.timeTick = [data opticalConundrumTimeAvailable];
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(tick) userInfo:nil repeats:YES];
    self.timerLabel.text = [NSString stringWithFormat:@"%d", [data opticalConundrumTimeAvailable]];
    [self setupLooks];
    NSLog(@"start points: %d", self.opticalConundrumData.startPoints);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
// Function to make defining colours easier
UIColor *RGB8(float r, float g, float b)
{
    return [UIColor colorWithRed:r/255.0f
                           green:g/255.0f
                            blue:b/255.0f
                           alpha:1.0];
}

#pragma mark - Colours of Labels and Buttons
// This is what defines how my screen looks for the most part, see the draw view for the rest of the screen 
-(void)setupLooks{
    self.shownColourWordLabel.layer.borderColor = RGB8(190, 0, 255).CGColor;
    self.shownColourWordLabel.layer.borderWidth = 3.0;
    self.shownColourWordLabel.layer.cornerRadius = 8.0;
    self.timerLabel.textColor = [UIColor whiteColor];
    self.timerLabel.layer.borderWidth = 3.0;
    self.timerLabel.layer.borderColor = RGB8(190, 0, 255).CGColor;
    self.timerLabel.layer.cornerRadius = 8;
    self.scoreLabel.textColor = [UIColor whiteColor];
    self.scoreLabel.layer.borderColor = RGB8(190, 0, 255).CGColor;
    self.scoreLabel.layer.borderWidth = 3.0;
    self.scoreLabel.layer.cornerRadius = 8.0;
    self.backButton.tintColor = [UIColor whiteColor];
    self.backButton.layer.borderWidth = 3.0;
    self.backButton.layer.borderColor = RGB8(190, 0, 255).CGColor;
    self.backButton.layer.cornerRadius = 8;
}

#pragma mark - Timer function Countdown
// This function tics down every seconds shwoing the suer how much time they have left, when it goes to zero it will shove ou to the next screen
-(void)tick{
    if ( self.timeTick == 0){ // checks if time = 0
        NSString *timeRemaining = [[NSString alloc] initWithFormat:@"%d", self.timeTick];
        self.timerLabel.text = timeRemaining;
        NSLog(@"Last highscore was : %d",self.opticalConundrumData.highScore);
        // Checks the stored data for the highscore for this game, if the user beat iut it will take them to the win screen, if not they will go to the lose screen
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *filePath = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"save.txt"];
        NSMutableDictionary *userData = [NSMutableDictionary dictionaryWithContentsOfFile:filePath];
        int currentHighScore = [[userData valueForKey:@"OpticalConundrumHighScore"] intValue];
        if (self.opticalConundrumData.currentScore > currentHighScore){ //checking the highscores
            //Overwrites the file if the user beat the old highscore
            int newHighScore = self.opticalConundrumData.currentScore;
            NSNumber *newHighScoreNSN = [[NSNumber alloc] initWithInt:newHighScore];
            [userData setValue:newHighScoreNSN forKey:@"OpticalConundrumHighScore"];
            [userData writeToFile:filePath atomically:YES];
            // Shves the user to the win screen
            UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            ViewController *vc = [mainStoryBoard instantiateViewControllerWithIdentifier:@"OpticalConundrumWinScreen"];
            [self presentViewController:vc animated:YES completion:nil];
            
        }
        else {
            // Takes the user to the lose screen
            UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            ViewController *vc = [mainStoryBoard instantiateViewControllerWithIdentifier:@"OpticalConundrumLoseScreen"];
            [self presentViewController:vc animated:YES completion:nil];
            
        }
    }
    else {
        // If time isnt zro yet it will decrease the counter by one and update the label
    self.timeTick--;
    NSString *timeRemaining = [[NSString alloc] initWithFormat:@"%d", self.timeTick];
    self.timerLabel.text = timeRemaining;
    }
}

#pragma mark - Five Random Number Generators
// Generates randomly the colour word that will be chosen
-(int) randomWordColourChosen  {
    self.randomTwo = arc4random_uniform(7);
    return(self.randomTwo);
}
// Generates randomly the font colour that will be chosen
-(int) randomFontColourChosen {
    self.randomOne = arc4random_uniform(6);
    return(self.randomOne);
}// Generates the button that will have the right answer
-(int) randomCorrectButtonChosen {
    self.randomThree = arc4random_uniform(3);
    return self.randomThree;
}
//Generates the random number for the third button colour selection
-(int) randomThirdButtonChosen {
    self.randomFour = arc4random_uniform(5);
    return self.randomFour;
}
// Generates the random number for the fourth button colour selection
-(int) randomFourthButtonChosen {
    self.randomFive = arc4random_uniform(4);
    return self.randomFive;
}

#pragma mark - Word Definer
// Function that generates the colour word being shown
-(NSString *) wordDefiner {
    
        // I generate a temporary array and copy my permanant colour array into it, this is so i can remove colours as i go throught the sequcne and make sure no colour gets picked and shown on the screen twice.
        self.tempArray = [[NSMutableArray alloc] initWithCapacity:self.colourArray.count];
        for (NSInteger index = 0; index < 8; index++) {
            [self.tempArray addObject:[self.colourArray objectAtIndex:index]]; // Copying the array using a for loop
        }
        //Sets the correct colour from the array at the ide f the random number that was genrated ealrier
        self.correctColour = [self.tempArray objectAtIndex:self.randomTwo];
        NSLog (@"Number of elements in array = %lu", [self.tempArray count]);
        [self.tempArray removeObjectAtIndex:self.randomTwo];  // removes that colour so we will get no bugs or bad gameplay
        // These if statements are jsut defining what the word will read depening on the colour chosen
        if (self.randomTwo == 0) {
            self.shownColourWord = @"green";
        }
        else if (self.randomTwo == 1) {
            self.shownColourWord = @"blue";
        }
        else if (self.randomTwo == 2) {
            self.shownColourWord = @"red";
        }
        else if (self.randomTwo == 3) {
            self.shownColourWord = @"pink";
        }
        else if (self.randomTwo == 4) {
            self.shownColourWord = @"black";
        }
        else if (self.randomTwo == 5) {
            self.shownColourWord = @"cyan";
        }
        else if (self.randomTwo == 6) {
            self.shownColourWord = @"orange";
        }
        else if (self.randomTwo == 7) {
            self.shownColourWord = @"brown";
        }
    return self.shownColourWord;
}

#pragma mark - ColourDefiner
// Function that generates the font colour being shown
-(UIColor *) colourDefiner {
    NSLog (@"Number of elements in array = %lu", [self.tempArray count]);
    self.shownFontColour = [self.tempArray objectAtIndex:self.randomOne]; //Definines the shown font colour that will be displayed
    [self.tempArray removeObjectAtIndex:self.randomOne];
    self.wrongColour = self.shownFontColour;  //Setting the wrong colour variable so that when the user presses the button we can check
    NSLog (@"Number of elements in array = %lu", [self.tempArray count]);
    self.otherColour1 = [self.tempArray objectAtIndex:self.randomFour]; //Defining one of the other buttons colour
    [self.tempArray removeObjectAtIndex:self.randomFour];
    NSLog (@"Number of elements in array = %lu", [self.tempArray count]);
    self.otherColour2 = [self.tempArray objectAtIndex:self.randomFive]; // Defining the last coloured button, the other red herring just there to be a distraction
    [self.tempArray removeObjectAtIndex:self.randomFive];
    
    //Returns all my variables
    return self.shownFontColour;
    return self.otherColour1;
    return self.otherColour2;
    return self.wrongColour;
}

#pragma mark - Correct Button Selector
// Function that selects the correct button
-(void) correctButtonSelector {
    // Depending on the random number generated from randomCorrectButtonChosen it will set which button is correct and then also randomly allocate the other buttons one of the three other colours already chosen
    if (self.randomThree == 0){
        
        self.topLeftButton.backgroundColor = self.correctColour;
        int secondStage = arc4random_uniform(2);
        if (secondStage == 0){
            self.topRightButton.backgroundColor = self.wrongColour;
            self.bottomRightButton.backgroundColor = self.otherColour1;
            self.bottomLeftButton.backgroundColor = self.otherColour2;
        }
        else if (secondStage ==1){
            self.bottomRightButton.backgroundColor = self.wrongColour;
            self.topRightButton.backgroundColor = self.otherColour1;
            self.bottomLeftButton.backgroundColor = self.otherColour2;
        }
        else {
            self.bottomLeftButton.backgroundColor = self.wrongColour;
            self.topRightButton.backgroundColor = self.otherColour1;
            self.bottomRightButton.backgroundColor = self.otherColour2;
        }
        
    }
    else if (self.randomThree == 1){
       
        self.topRightButton.backgroundColor = self.correctColour;
        int secondStage = arc4random_uniform(2);
        if (secondStage == 0){
            self.topLeftButton.backgroundColor = self.wrongColour;
            self.bottomRightButton.backgroundColor = self.otherColour1;
            self.bottomLeftButton.backgroundColor = self.otherColour2;
        }
        else if (secondStage ==1){
            self.bottomRightButton.backgroundColor = self.wrongColour;
            self.topLeftButton.backgroundColor = self.otherColour1;
            self.bottomLeftButton.backgroundColor = self.otherColour2;
        }
        else {
            self.bottomLeftButton.backgroundColor = self.wrongColour;
            self.topLeftButton.backgroundColor = self.otherColour1;
            self.bottomRightButton.backgroundColor = self.otherColour2;
        }
    }
    else if (self.randomThree == 2){
       
        self.bottomLeftButton.backgroundColor = self.correctColour;
        int secondStage = arc4random_uniform(2);
        if (secondStage == 0){
            self.topRightButton.backgroundColor = self.wrongColour;
            self.bottomRightButton.backgroundColor = self.otherColour1;
            self.topLeftButton.backgroundColor = self.otherColour2;
        }
        else if (secondStage ==1){
            self.bottomRightButton.backgroundColor = self.wrongColour;
            self.topRightButton.backgroundColor = self.otherColour1;
            self.topLeftButton.backgroundColor = self.otherColour2;
        }
        else {
            self.topLeftButton.backgroundColor = self.wrongColour;
            self.topRightButton.backgroundColor = self.otherColour1;
            self.bottomRightButton.backgroundColor = self.otherColour2;
        }
    }
    else if (self.randomThree == 3){
        
        self.bottomRightButton.backgroundColor = self.correctColour;
        int secondStage = arc4random_uniform(2);
        if (secondStage == 0){
            self.topRightButton.backgroundColor = self.wrongColour;
            self.topLeftButton.backgroundColor = self.otherColour1;
            self.bottomLeftButton.backgroundColor = self.otherColour2;
        }
        else if (secondStage ==1){
            self.topLeftButton.backgroundColor = self.wrongColour;
            self.topRightButton.backgroundColor = self.otherColour1;
            self.bottomLeftButton.backgroundColor = self.otherColour2;
        }
        else {
            self.bottomLeftButton.backgroundColor = self.wrongColour;
            self.topRightButton.backgroundColor = self.otherColour1;
            self.topLeftButton.backgroundColor = self.otherColour2;
        }
    }
}

#pragma mark - Any Button Pressed Regenerate
// Whenever any button is pressed, whether right or wrong the app must now rerandomly select all the variavles and display them on the buttons and labels, this is what this functin does.
-(void) anyButtonPressed {
    [self randomWordColourChosen]; //initial word chosen
    [self randomFontColourChosen];  //initial font colour chosen
    [self randomCorrectButtonChosen];
    [self randomThirdButtonChosen];
    [self randomFourthButtonChosen];
    [self wordDefiner];
    [self colourDefiner];
    [self correctButtonSelector];
    self.shownColourWordLabel.text = self.shownColourWord;
    self.shownColourWordLabel.textColor = self.wrongColour;
}

#pragma mark - Any Button Pressed
// All the buttons below are for when the user click on one of the colours, it is to check whether they made the correct choice and how many points to add or subtract, it knows if it is correct as it uses the random number from the third random number generator to check.
- (IBAction)topRightButtonPressed:(UIButton *)sender {
    if (self.randomThree == 1){
        NSLog(@"Correct");
        [self.opticalConundrumData correctSelection];
        self.scoreLabel.text = [NSString stringWithFormat:@"Score : %d",self.opticalConundrumData.currentScore];
        [self anyButtonPressed];
    }
    else  {
        NSLog(@"wrong");
        [self.opticalConundrumData wrongSelection];
        self.scoreLabel.text = [NSString stringWithFormat:@"Score : %d",self.opticalConundrumData.currentScore];
        [self anyButtonPressed];
    }
}

- (IBAction)bottomRightButtonPressed:(UIButton *)sender {
    if (self.randomThree == 3){
        NSLog(@"Correct");
        [self.opticalConundrumData correctSelection];
        self.scoreLabel.text = [NSString stringWithFormat:@"Score : %d",self.opticalConundrumData.currentScore];
        [self anyButtonPressed];
    }
    else  {
        NSLog(@"wrong");
        [self.opticalConundrumData wrongSelection];
        self.scoreLabel.text = [NSString stringWithFormat:@"Score : %d",self.opticalConundrumData.currentScore];
        [self anyButtonPressed];
    }
}

- (IBAction)topLeftButtonPressed:(UIButton *)sender {
    if (self.randomThree == 0){
        NSLog(@"Correct");
        [self.opticalConundrumData correctSelection];
        self.scoreLabel.text = [NSString stringWithFormat:@"Score : %d",self.opticalConundrumData.currentScore];
        [self anyButtonPressed];
    }
    else  {
        NSLog(@"wrong");
        [self.opticalConundrumData wrongSelection];
        self.scoreLabel.text = [NSString stringWithFormat:@"Score : %d",self.opticalConundrumData.currentScore];
        [self anyButtonPressed];
    }
}

- (IBAction)bottomLeftButtonPressed:(UIButton *)sender {
    if (self.randomThree == 2){
        NSLog(@"Correct");
        [self.opticalConundrumData correctSelection];
        self.scoreLabel.text = [NSString stringWithFormat:@"Score : %d",self.opticalConundrumData.currentScore];
        [self anyButtonPressed];
    }
    else  {
        NSLog(@"wrong");
        [self.opticalConundrumData wrongSelection];
        self.scoreLabel.text = [NSString stringWithFormat:@"Score : %d",self.opticalConundrumData.currentScore];
        [self anyButtonPressed];
    }
}

#pragma mark - Back Button Pressed
// This is a button that takes the user back to the home screen if they dont want to finish playing the game for any reason
- (IBAction)backToMainMenuPressed:(UIButton *)sender {
    
    UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UINavigationController *nc = [mainStoryBoard instantiateViewControllerWithIdentifier:@"HomePage"];
    [self presentViewController:nc animated:YES completion:nil];
}


@end
