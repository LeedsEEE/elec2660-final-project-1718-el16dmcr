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
    self.shownColourWordLabel.backgroundColor = [UIColor whiteColor];
    // pdates score label
    self.scoreLabel.text = [NSString stringWithFormat: @"Score : %d",self.opticalConundrumData.startPoints];
    [self.opticalConundrumData getInitialScore]; // Pulls in the correct data from my data file
    
    NSLog(@"%@",self.shownColourWord);
    // This segment of code was referenced and slightly changed from , it is used to tick down a timer and siplay it on a label
    self.timeTick = [data opticalConundrumTimeAvailable];
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(tick) userInfo:nil repeats:YES];
    self.timerLabel.text = [NSString stringWithFormat:@"Time left: %d", [data opticalConundrumTimeAvailable]];
    self.timerLabel.backgroundColor = [UIColor blackColor];
    self.timerLabel.textColor = [UIColor whiteColor];
    NSLog(@"start points: %d", self.opticalConundrumData.startPoints);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)tick{
    if ( self.timeTick == 0){
        self.timeTick--;
        NSString *timeRemaining = [[NSString alloc] initWithFormat:@"%d", self.timeTick];
        self.timerLabel.text = timeRemaining;
        NSLog(@"Last highscore was : %d",self.opticalConundrumData.highScore);
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *filePath = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"save.txt"];
        NSMutableDictionary *userData = [NSMutableDictionary dictionaryWithContentsOfFile:filePath];
        int currentHighScore = [[userData valueForKey:@"OpticalConundrumHighScore"] intValue];
        if (self.opticalConundrumData.currentScore > currentHighScore){
            
            int newHighScore = self.opticalConundrumData.currentScore;
            NSNumber *newHighScoreNSN = [[NSNumber alloc] initWithInt:newHighScore];
            [userData setValue:newHighScoreNSN forKey:@"OpticalConundrumHighScore"];
            [userData writeToFile:filePath atomically:YES];
            UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            ViewController *vc = [mainStoryBoard instantiateViewControllerWithIdentifier:@"OpticalConundrumWinScreen"];
            [self presentViewController:vc animated:YES completion:nil];
            
        }
        else {
        
            UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            ViewController *vc = [mainStoryBoard instantiateViewControllerWithIdentifier:@"OpticalConundrumLoseScreen"];
            [self presentViewController:vc animated:YES completion:nil];
            
        }
    }
    else {
    self.timeTick--;
    NSString *timeRemaining = [[NSString alloc] initWithFormat:@"%d", self.timeTick];
    self.timerLabel.text = timeRemaining;
    }
}


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
-(int) randomThirdButtonChosen {
    self.randomFour = arc4random_uniform(5);
    return self.randomFour;
}
-(int) randomFourthButtonChosen {
    self.randomFive = arc4random_uniform(4);
    return self.randomFive;
}

// Function that generates the colour word being shown
-(NSString *) wordDefiner {
    
    
        self.tempArray = [[NSMutableArray alloc] initWithCapacity:self.colourArray.count];
        for (NSInteger index = 0; index < 8; index++) {
            [self.tempArray addObject:[self.colourArray objectAtIndex:index]];
        }
        
        self.correctColour = [self.tempArray objectAtIndex:self.randomTwo];
        NSLog (@"Number of elements in array = %lu", [self.tempArray count]);
        [self.tempArray removeObjectAtIndex:self.randomTwo];
    
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
// Function that generates the font colour being shown
-(UIColor *) colourDefiner {
    NSLog (@"Number of elements in array = %lu", [self.tempArray count]);
    self.shownFontColour = [self.tempArray objectAtIndex:self.randomOne];
    [self.tempArray removeObjectAtIndex:self.randomOne];
    self.wrongColour = self.shownFontColour;
    NSLog (@"Number of elements in array = %lu", [self.tempArray count]);
    self.otherColour1 = [self.tempArray objectAtIndex:self.randomFour];
    [self.tempArray removeObjectAtIndex:self.randomFour];
    NSLog (@"Number of elements in array = %lu", [self.tempArray count]);
    self.otherColour2 = [self.tempArray objectAtIndex:self.randomFive];
    [self.tempArray removeObjectAtIndex:self.randomFive];
    
    return self.shownFontColour;
    return self.otherColour1;
    return self.otherColour2;
    return self.wrongColour;
}

// Function that selects the correct button
-(void) correctButtonSelector {
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

- (IBAction)backToMainMenuPressed:(UIButton *)sender {
    
    UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UINavigationController *nc = [mainStoryBoard instantiateViewControllerWithIdentifier:@"HomePage"];
    [self presentViewController:nc animated:YES completion:nil];
}


@end
