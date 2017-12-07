//
//  SettingsController.h
//  Axon Evolution
//
//  Created by David Russell [el16dmcr] on 06/12/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "ViewController.h"
#import "SettingsData.h"
#import <QuartzCore/QuartzCore.h>

@interface SettingsController : ViewController

- (IBAction)backButtonPressed:(UIButton *)sender;
- (IBAction)livesSubtractedPressed:(UIButton *)sender;
- (IBAction)livesAddedPressed:(UIButton *)sender;

- (IBAction)opticalConundrumSliderMoved:(UISlider *)sender;
- (IBAction)flipRetentionSliderMoved:(UISlider *)sender;
@property (weak, nonatomic) IBOutlet UISlider *opticalConundrumSlider;
@property (weak, nonatomic) IBOutlet UISlider *flipRetentionSlider;

@property (weak, nonatomic) IBOutlet UIButton *mainMenuButton;
@property (weak, nonatomic) IBOutlet UILabel *opticalConundrumTimeLimitLabel;
@property (weak, nonatomic) IBOutlet UILabel *flipRetentionTimeLimitLabel;
@property (weak, nonatomic) IBOutlet UILabel *logicalPursuitLivesLabel;
@property (weak, nonatomic) IBOutlet UILabel *settingsOpticalConundrumLabel;
@property (weak, nonatomic) IBOutlet UILabel *settingsOpticalConundrumTimeLimitLabel;
@property (weak, nonatomic) IBOutlet UILabel *settingsFlipRetentionLabel;
@property (weak, nonatomic) IBOutlet UILabel *settingsFlipRetentionTimeLimitLabel;
@property (weak, nonatomic) IBOutlet UILabel *settingsLogicalPursuitLabel;
@property (weak, nonatomic) IBOutlet UILabel *settingsLogicalPursuitLivesLabel;
@property (weak, nonatomic) IBOutlet UIImageView *noteImage;



@end
