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

- (void)viewDidLoad: (NSString *) shownFontColour {
    // All the initial setup for this screen when it loads
    [super viewDidLoad];
    self.navigationItem.hidesBackButton = YES;   // Hides the back button that is there by default, i want to make my own
    self.shownColourWordLabel.text = shownFontColour;
    OpticalConundrumData *OpticalConundrumData
    [OpticalConundrumData randomFontColourChosen];
    [OpticalConundrumData randomWordColourChosen];
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
-(void) colourDefiner: (int) randomOne: (UIColor *) shownFontColor {
    if ( randomOne == 1) {
        UIColor *Colour = [UIColor yellowColor];
    }
    else if ( randomOne == 2) {
        UIColor *shownFontColour = [UIColor blueColor];
    }
    else if ( randomOne == 3) {
        UIColor *shownFontColour = [UIColor redColor];
    }
    else if ( randomOne == 4) {
        UIColor *shownFontColour = [UIColor greenColor];
    }
    else if ( randomOne == 5) {
        UIColor *shownFontColour = [UIColor purpleColor];
    }
    else if ( randomOne == 6) {
        UIColor *shownFontColour = [UIColor brownColor];
    }
    else if ( randomOne == 7) {
        UIColor *shownFontColour = [UIColor orangeColor];
    }
    else if ( randomOne == 8) {
        UIColor *shownFontColour = [UIColor cyanColor];
    }
}
-(void) wordDefiner: (int) randomTwo: (NSString *) shownColourWord: (UIColor *) correctColour {
    if ( randomTwo == 1) {
        shownColourWord = @"yellow";
        correctColour = [UIColor yellowColor];
    }
    else if ( randomTwo == 2) {
        shownColourWord = @"blue";
        correctColour = [UIColor blueColor];
    }
    else if ( randomTwo == 3) {
        shownColourWord = @"red";
        correctColour = [UIColor redColor];
    }
    else if ( randomTwo == 4) {
        shownColourWord = @"green";
        correctColour = [UIColor greenColor];
    }
    else if ( randomTwo == 5) {
        shownColourWord = @"purple";
        correctColour = [UIColor purpleColor];
    }
    else if ( randomTwo == 6) {
        shownColourWord = @"brown";
        correctColour = [UIColor brownColor];
    }
    else if ( randomTwo == 7) {
        shownColourWord = @"orange";
        correctColour = [UIColor orangeColor];
    }
    else if ( randomTwo == 8) {
        shownColourWord = @"cyan";
        correctColour = [UIColor cyanColor];
    }
}



- (IBAction)topRightButtonPressed:(UIButton *)sender {
}

- (IBAction)bottomRightButtonPressed:(UIButton *)sender {
}

- (IBAction)topLeftButtonPressed:(UIButton *)sender {
}

- (IBAction)bottomLeftButtonPressed:(UIButton *)sender {
}


@end
