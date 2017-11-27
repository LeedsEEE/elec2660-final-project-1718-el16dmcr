//
//  OpticalConundrumController.m
//  Axon Evolution
//
//  Created by David Russell [el16dmcr] on 24/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "OpticalConundrumController.h"
#import "OpticalConundrumData.h"

@interface OpticalConundrumController ()

@end

@implementation OpticalConundrumController

// All the initial setup for this screen when it loads
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.hidesBackButton = YES;   // Hides the back button that is there by default, I want to make my own
    [self randomWordColourChosen]; //initial word chosen
    [self randomFontColourChosen];  //initial font colour chosen
    [self randomCorrectButtonChosen];
    [self correctButtonSelector];
    [self colourDefiner];
    [self wordDefiner];
    self.shownColourWordLabel.text = self.shownColourWord;
    self.shownColourWordLabel.textColor = self.shownFontColour;
    //self.shownColourWordLabel.backgroundColor = [UIColor blackColor];
    self.topRightButton.backgroundColor = self.correctColour;
    NSLog(@"%@",self.shownColourWord);
    
    
    
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
// Generates randomly the colour word that will be chosen
-(int) randomWordColourChosen  {
    self.randomTwo = arc4random_uniform(7);
    return(self.randomTwo);
}
// Generates randomly the font colour that will be chosen
-(int) randomFontColourChosen {
    self.randomOne = arc4random_uniform(7);
    return(self.randomOne);
}
-(int) randomCorrectButtonChosen {
    self.randomThree = arc4random_uniform(3);
    return self.randomThree;
}
// Function that holds the colour of the font beign displayed
-(UIColor *) colourDefiner {
    if ( self.randomOne == 0) {
        self.shownFontColour = [UIColor yellowColor];
        self.wrongColour = [UIColor yellowColor];
    }
    else if ( self.randomOne == 1) {
        self.shownFontColour = [UIColor blueColor];
        self.wrongColour = [UIColor blueColor];
    }
    else if ( self.randomOne == 2) {
        self.shownFontColour = [UIColor redColor];
        self.wrongColour = [UIColor redColor];
    }
    else if ( self.randomOne == 3) {
        self.shownFontColour = [UIColor greenColor];
        self.wrongColour = [UIColor greenColor];
    }
    else if ( self.randomOne == 4) {
        self.shownFontColour = [UIColor purpleColor];
        self.wrongColour = [UIColor purpleColor];
    }
    else if ( self.randomOne == 5) {
        self.shownFontColour = [UIColor brownColor];
        self.wrongColour = [UIColor brownColor];
    }
    else if ( self.randomOne == 6) {
        self.shownFontColour = [UIColor orangeColor];
        self.wrongColour = [UIColor orangeColor];
    }
    else if ( self.randomOne == 7) {
        self.shownFontColour = [UIColor cyanColor];
        self.wrongColour = [UIColor cyanColor];
    }
    return self.shownFontColour;
}
// Function that holds what word is currently displayed in the game
-(NSString *) wordDefiner {
    if ( self.randomTwo == 0) {
        self.shownColourWord = @"yellow";
        self.correctColour = [UIColor yellowColor];
    }
    else if ( self.randomTwo == 1) {
        self.shownColourWord = @"blue";
        self.correctColour = [UIColor blueColor];
    }
    else if ( self.randomTwo == 2) {
        self.shownColourWord = @"red";
        self.correctColour = [UIColor redColor];
    }
    else if ( self.randomTwo == 3) {
        self.shownColourWord = @"green";
        self.correctColour = [UIColor greenColor];
    }
    else if ( self.randomTwo == 4) {
        self.shownColourWord = @"purple";
        self.correctColour = [UIColor purpleColor];
    }
    else if ( self.randomTwo == 5) {
        self.shownColourWord = @"brown";
        self.correctColour = [UIColor brownColor];
    }
    else if ( self.randomTwo == 6) {
        self.shownColourWord = @"orange";
        self.correctColour = [UIColor orangeColor];
    }
    else if ( self.randomTwo == 7) {
        self.shownColourWord = @"cyan";
        self.correctColour = [UIColor cyanColor];
    }
    return self.shownColourWord;
}
-(int) correctButtonSelector {
    if (self.randomThree == 0){
        /*self.a = 1;
        self.b = 0;
        self.c = 0;
        self.d = 0; */
        self.topLeftButton.backgroundColor = self.correctColour;
        int secondStage = arc4random_uniform(2);
        if (secondStage == 0){
            self.topRightButton.backgroundColor = self.wrongColour;
            self.bottomRightButton.backgroundColor = [UIColor magentaColor];
            self.bottomLeftButton.backgroundColor = [UIColor lightGrayColor];
        }
        else if (secondStage ==1){
            self.bottomRightButton.backgroundColor = self.wrongColour;
            self.topRightButton.backgroundColor = [UIColor magentaColor];
            self.bottomLeftButton.backgroundColor = [UIColor lightGrayColor];
        }
        else {
            self.bottomLeftButton.backgroundColor = self.wrongColour;
            self.topRightButton.backgroundColor = [UIColor magentaColor];
            self.bottomRightButton.backgroundColor = [UIColor lightGrayColor];
        }
        
    }
    else if (self.randomThree == 1){
       /* self.a = 0;
        self.b = 1;
        self.c = 0;
        self.d = 0;*/
        self.topRightButton.backgroundColor = self.correctColour;
        int secondStage = arc4random_uniform(2);
        if (secondStage == 0){
            self.topLeftButton.backgroundColor = self.wrongColour;
            self.bottomRightButton.backgroundColor = [UIColor magentaColor];
            self.bottomLeftButton.backgroundColor = [UIColor lightGrayColor];
        }
        else if (secondStage ==1){
            self.bottomRightButton.backgroundColor = self.wrongColour;
            self.topLeftButton.backgroundColor = [UIColor magentaColor];
            self.bottomLeftButton.backgroundColor = [UIColor lightGrayColor];
        }
        else {
            self.bottomLeftButton.backgroundColor = self.wrongColour;
            self.topLeftButton.backgroundColor = [UIColor magentaColor];
            self.bottomRightButton.backgroundColor = [UIColor lightGrayColor];
        
    }
    }
    else if (self.randomThree == 2){
       /* self.a = 0;
        self.b = 0;
        self.c = 1;
        self.d = 0;*/
        self.bottomLeftButton.backgroundColor = self.correctColour;
        int secondStage = arc4random_uniform(2);
        if (secondStage == 0){
            self.topRightButton.backgroundColor = self.wrongColour;
            self.bottomRightButton.backgroundColor = [UIColor magentaColor];
            self.topLeftButton.backgroundColor = [UIColor lightGrayColor];
        }
        else if (secondStage ==1){
            self.bottomRightButton.backgroundColor = self.wrongColour;
            self.topRightButton.backgroundColor = [UIColor magentaColor];
            self.topLeftButton.backgroundColor = [UIColor lightGrayColor];
        }
        else {
            self.topLeftButton.backgroundColor = self.wrongColour;
            self.topRightButton.backgroundColor = [UIColor magentaColor];
            self.bottomRightButton.backgroundColor = [UIColor lightGrayColor];
    }
    }
    else if (self.randomThree == 3){
        /*self.a = 0;
        self.b = 0;
        self.c = 0;
        self.d = 1;*/
        self.bottomRightButton.backgroundColor = self.correctColour;
        int secondStage = arc4random_uniform(2);
        if (secondStage == 0){
            self.topRightButton.backgroundColor = self.wrongColour;
            self.topLeftButton.backgroundColor = [UIColor magentaColor];
            self.bottomLeftButton.backgroundColor = [UIColor lightGrayColor];
        }
        else if (secondStage ==1){
            self.topLeftButton.backgroundColor = self.wrongColour;
            self.topRightButton.backgroundColor = [UIColor magentaColor];
            self.bottomLeftButton.backgroundColor = [UIColor lightGrayColor];
        }
        else {
            self.bottomLeftButton.backgroundColor = self.wrongColour;
            self.topRightButton.backgroundColor = [UIColor magentaColor];
            self.topLeftButton.backgroundColor = [UIColor lightGrayColor];
    }
    }
    return (self.a,self.b,self.c,self.d);
}


- (IBAction)topRightButtonPressed:(UIButton *)sender {
    if (self.randomThree == 1){
        NSLog(@"Correct");
        [self randomWordColourChosen];
        [self randomFontColourChosen];
        [self randomCorrectButtonChosen];
        [self colourDefiner];
        [self wordDefiner];
        [self correctButtonSelector];
        self.shownColourWordLabel.text = self.shownColourWord;
        self.shownColourWordLabel.textColor = self.shownFontColour;
        
    }
    else  {
        NSLog(@"wrong");
        [self randomWordColourChosen];
        [self randomFontColourChosen];
        [self randomCorrectButtonChosen];
        [self colourDefiner];
        [self wordDefiner];
        [self correctButtonSelector];
        self.shownColourWordLabel.text = self.shownColourWord;
        self.shownColourWordLabel.textColor = self.shownFontColour;
    }
}

- (IBAction)bottomRightButtonPressed:(UIButton *)sender {
    if (self.randomThree == 3){
        NSLog(@"Correct");
        [self randomWordColourChosen];
        [self randomFontColourChosen];
        [self randomCorrectButtonChosen];
        [self colourDefiner];
        [self wordDefiner];
        [self correctButtonSelector];
        self.shownColourWordLabel.text = self.shownColourWord;
        self.shownColourWordLabel.textColor = self.shownFontColour;
        
    }
    else  {
        NSLog(@"wrong");
        [self randomWordColourChosen];
        [self randomFontColourChosen];
        [self randomCorrectButtonChosen];
        [self colourDefiner];
        [self wordDefiner];
        [self correctButtonSelector];
        self.shownColourWordLabel.text = self.shownColourWord;
        self.shownColourWordLabel.textColor = self.shownFontColour;
    }
}

- (IBAction)topLeftButtonPressed:(UIButton *)sender {
    if (self.randomThree == 0){
        NSLog(@"Correct");
        [self randomWordColourChosen];
        [self randomFontColourChosen];
        [self randomCorrectButtonChosen];
        [self colourDefiner];
        [self wordDefiner];
        [self correctButtonSelector];
        self.shownColourWordLabel.text = self.shownColourWord;
        self.shownColourWordLabel.textColor = self.shownFontColour;
        
    }
    else  {
        NSLog(@"wrong");
        [self randomWordColourChosen];
        [self randomFontColourChosen];
        [self randomCorrectButtonChosen];
        [self colourDefiner];
        [self wordDefiner];
        [self correctButtonSelector];
        self.shownColourWordLabel.text = self.shownColourWord;
        self.shownColourWordLabel.textColor = self.shownFontColour;
    }
}

- (IBAction)bottomLeftButtonPressed:(UIButton *)sender {
    if (self.randomThree == 2){
        NSLog(@"Correct");
        [self randomWordColourChosen];
        [self randomFontColourChosen];
        [self randomCorrectButtonChosen];
        [self colourDefiner];
        [self wordDefiner];
        [self correctButtonSelector];
        self.shownColourWordLabel.text = self.shownColourWord;
        self.shownColourWordLabel.textColor = self.shownFontColour;
        
    }
    else  {
        NSLog(@"wrong");
        [self randomWordColourChosen];
        [self randomFontColourChosen];
        [self randomCorrectButtonChosen];
        [self colourDefiner];
        [self wordDefiner];
        [self correctButtonSelector];
        self.shownColourWordLabel.text = self.shownColourWord;
        self.shownColourWordLabel.textColor = self.shownFontColour;
    }
}


@end
