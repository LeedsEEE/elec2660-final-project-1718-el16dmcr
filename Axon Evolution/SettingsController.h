//
//  SettingsController.h
//  Axon Evolution
//
//  Created by David Russell [el16dmcr] on 06/12/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "ViewController.h"
#import "SettingsData.h"

@interface SettingsController : ViewController

- (IBAction)backButtonPressed:(UIButton *)sender;
- (IBAction)livesSubtractedPressed:(UIButton *)sender;
- (IBAction)livesAddedPressed:(UIButton *)sender;

- (IBAction)opticalConundrumSliderMoved:(UISlider *)sender;
- (IBAction)flipRetentionSliderMoved:(UISlider *)sender;

@property (weak, nonatomic) IBOutlet UILabel *opticalConundrumTimeLimitLabel;
@property (weak, nonatomic) IBOutlet UILabel *flipRetentionTimeLimitLabel;
@property (weak, nonatomic) IBOutlet UILabel *logicalPursuitLivesLabel;


@end
