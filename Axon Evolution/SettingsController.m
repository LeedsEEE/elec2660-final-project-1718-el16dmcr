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

- (void)viewDidLoad {
    [super viewDidLoad];
    SettingsData *data = [SettingsData sharedInstance];
    self.opticalConundrumTimeLimitLabel.text = [NSString stringWithFormat:@"%d", [data opticalConundrumTimeAvailable]];
    self.flipRetentionTimeLimitLabel.text = [NSString stringWithFormat:@"%d", [data flipRetentionTimeAvailable]];
    self.logicalPursuitLivesLabel.text = [NSString stringWithFormat:@"%d", [data logicalPursuitStartLives]];

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
    data.opticalConundrumStartPoints = (300*sender.value) + 100;
    data.opticalConundrumPointsMinus = (25*sender.value) + 25;
    data.opticalConundrumPointsPlus = (-50*sender.value) + 100;
    data.opticalConundrumTimeAvailable = (120*sender.value) + 30;
    self.opticalConundrumTimeLimitLabel.text = [NSString stringWithFormat:@"%d", [data opticalConundrumTimeAvailable]];
    
    
}

- (IBAction)flipRetentionSliderMoved:(UISlider *)sender {
    SettingsData *data = [SettingsData sharedInstance];
    NSLog(@"Slider is being moved");
    data.flipRetentionStartPoints = (300*sender.value) + 100;
    data.flipRetentionPointsMinus = (25*sender.value) + 25;
    data.flipRetentionPointsPlus = (-50*sender.value) + 100;
    data.flipRetentionTimeAvailable = (120*sender.value) + 30;
    self.flipRetentionTimeLimitLabel.text = [NSString stringWithFormat:@"%d", [data flipRetentionTimeAvailable]];
    
    
}
@end
