//
//  SettingsController.m
//  Axon Evolution
//
//  Created by David Russell [el16dmcr] on 06/12/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "SettingsController.h"

@interface SettingsController ()

@end

@implementation SettingsController

#pragma mark - Initilisation of Screen
- (void)viewDidLoad {
    [super viewDidLoad];
    SettingsData *data = [SettingsData sharedInstance];     //sharing the data from before to keep evrything updata in this view
    self.opticalConundrumTimeLimitLabel.text = [NSString stringWithFormat:@"%d", [data opticalConundrumTimeAvailable]];
    self.flipRetentionTimeLimitLabel.text = [NSString stringWithFormat:@"%d", [data flipRetentionTimeAvailable]];
    self.logicalPursuitLivesLabel.text = [NSString stringWithFormat:@"%d", [data logicalPursuitStartLives]];
    [self setupLooks];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

UIColor *RGB19(float r, float g, float b)
{
    return [UIColor colorWithRed:r/255.0f
                           green:g/255.0f
                            blue:b/255.0f
                           alpha:1.0];
}

#pragma mark - Colours of Labels and Buttons
//Seting the style of the settings page for the most part, for the rest see the drawview
-(void)setupLooks{
    self.mainMenuButton.tintColor = [UIColor blackColor];
    self.mainMenuButton.layer.borderWidth = 2.0;
    self.mainMenuButton.layer.borderColor = RGB19(66, 125, 244).CGColor;
    self.mainMenuButton.layer.cornerRadius = 8.0;
    self.opticalConundrumTimeLimitLabel.textColor = [UIColor blackColor];
    self.opticalConundrumTimeLimitLabel.layer.borderWidth = 2.0;
    self.opticalConundrumTimeLimitLabel.layer.borderColor = RGB19(66, 125, 244).CGColor;
    self.opticalConundrumTimeLimitLabel.layer.cornerRadius = 8.0;
    self.settingsOpticalConundrumLabel.textColor = [UIColor blackColor];
    self.settingsOpticalConundrumLabel.layer.borderWidth = 2.0;
    self.settingsOpticalConundrumLabel.layer.borderColor = RGB19(66, 125, 244).CGColor;
    self.settingsOpticalConundrumLabel.layer.cornerRadius = 8.0;
    self.settingsFlipRetentionLabel.textColor = [UIColor blackColor];
    self.settingsFlipRetentionLabel.layer.borderWidth = 2.0;
    self.settingsFlipRetentionLabel.layer.borderColor = RGB19(66, 125, 244).CGColor;
    self.settingsFlipRetentionLabel.layer.cornerRadius = 8.0;
    self.settingsLogicalPursuitLivesLabel.textColor = [UIColor blackColor];
    self.settingsLogicalPursuitLivesLabel.layer.borderWidth = 2.0;
    self.settingsLogicalPursuitLivesLabel.layer.borderColor = RGB19(66, 125, 244).CGColor;
    self.settingsLogicalPursuitLivesLabel.layer.cornerRadius = 8.0;
    self.settingsOpticalConundrumTimeLimitLabel.textColor = [UIColor blackColor];
    self.settingsOpticalConundrumTimeLimitLabel.layer.borderWidth = 2.0;
    self.settingsOpticalConundrumTimeLimitLabel.layer.borderColor = RGB19(66, 125, 244).CGColor;
    self.settingsOpticalConundrumTimeLimitLabel.layer.cornerRadius = 8.0;
    self.flipRetentionTimeLimitLabel.textColor = [UIColor blackColor];
    self.flipRetentionTimeLimitLabel.layer.borderWidth = 2.0;
    self.flipRetentionTimeLimitLabel.layer.borderColor = RGB19(66, 125, 244).CGColor;
    self.flipRetentionTimeLimitLabel.layer.cornerRadius = 8.0;
    self.settingsFlipRetentionTimeLimitLabel.textColor = [UIColor blackColor];
    self.settingsFlipRetentionTimeLimitLabel.layer.borderWidth = 2.0;
    self.settingsFlipRetentionTimeLimitLabel.layer.borderColor = RGB19(66, 125, 244).CGColor;
    self.settingsFlipRetentionTimeLimitLabel.layer.cornerRadius = 8.0;
    self.settingsLogicalPursuitLabel.textColor = [UIColor blackColor];
    self.settingsLogicalPursuitLabel.layer.borderWidth = 2.0;
    self.settingsLogicalPursuitLabel.layer.borderColor = RGB19(66, 125, 244).CGColor;
    self.settingsLogicalPursuitLabel.layer.cornerRadius = 8.0;
    self.settingsFlipRetentionTimeLimitLabel.textColor = [UIColor blackColor];
    self.settingsFlipRetentionTimeLimitLabel.layer.borderWidth = 2.0;
    self.settingsFlipRetentionTimeLimitLabel.layer.borderColor = RGB19(66, 125, 244).CGColor;
    self.settingsFlipRetentionTimeLimitLabel.layer.cornerRadius = 8.0;
    
}

#pragma mark - User Interacts With Any Objects

- (IBAction)backButtonPressed:(UIButton *)sender {
    
    UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UINavigationController *nc = [mainStoryBoard instantiateViewControllerWithIdentifier:@"HomePage"];
    [self presentViewController:nc animated:YES completion:nil];
}

- (IBAction)livesSubtractedPressed:(UIButton *)sender {
    SettingsData *data = [SettingsData sharedInstance];
    if (data.logicalPursuitStartLives == 1){
        
    }
    else {
        data.logicalPursuitStartLives --;
        self.logicalPursuitLivesLabel.text = [NSString stringWithFormat:@"%d", [data logicalPursuitStartLives]];
        data.logicalPursuitPointsPlus = (-20*[data logicalPursuitStartLives]) + 160;
    }
    
}

- (IBAction)livesAddedPressed:(UIButton *)sender {
    SettingsData *data = [SettingsData sharedInstance];
    if (data.logicalPursuitStartLives == 5){
        
    }
    else {
        data.logicalPursuitStartLives ++;
        self.logicalPursuitLivesLabel.text = [NSString stringWithFormat:@"%d", [data logicalPursuitStartLives]];
        data.logicalPursuitPointsPlus = (-20*[data logicalPursuitStartLives]) + 160;
    }
    
}

- (IBAction)opticalConundrumSliderMoved:(UISlider *)sender {
    SettingsData *data = [SettingsData sharedInstance];
    NSLog(@"Slider is being moved");
    data.opticalConundrumStartPoints = (-300*sender.value) + 400;
    data.opticalConundrumPointsMinus = (25*sender.value) + 25;
    data.opticalConundrumPointsPlus = (-50*sender.value) + 100;
    data.opticalConundrumTimeAvailable = (120*sender.value) + 30;
    self.opticalConundrumTimeLimitLabel.text = [NSString stringWithFormat:@"%d", [data opticalConundrumTimeAvailable]];
    
    
}

- (IBAction)flipRetentionSliderMoved:(UISlider *)sender {
    SettingsData *data = [SettingsData sharedInstance];
    NSLog(@"Slider is being moved");
    data.flipRetentionStartPoints = (-300*sender.value) + 400;
    data.flipRetentionPointsMinus = (25*sender.value) + 25;
    data.flipRetentionPointsPlus = (-50*sender.value) + 100;
    data.flipRetentionTimeAvailable = (120*sender.value) + 30;
    self.flipRetentionTimeLimitLabel.text = [NSString stringWithFormat:@"%d", [data flipRetentionTimeAvailable]];
    
    
}
@end
