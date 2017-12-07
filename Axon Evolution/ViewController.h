//
//  ViewController.h
//  Axon Evolution
//
//  Created by David Russell [el16dmcr] on 14/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OpticalConundrumController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *opticalConundrumGame;
@property (weak, nonatomic) IBOutlet UIImageView *logicalPursuitGame;
@property (weak, nonatomic) IBOutlet UIImageView *flipRetentionGame;
@property (weak, nonatomic) IBOutlet UIImageView *brainBannerImage;
@property (weak, nonatomic) IBOutlet UIImageView *resetImage;
@property (weak, nonatomic) IBOutlet UIImageView *playerDataImage;

@property (weak, nonatomic) IBOutlet UILabel *highScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *opticalConundrumLabel;
@property (weak, nonatomic) IBOutlet UILabel *logicalPursuitLabel;
@property (weak, nonatomic) IBOutlet UILabel *flipRetentionLabel;
@property (weak, nonatomic) IBOutlet UIImageView *axonEvolutionLabel;

- (IBAction)settingsButtonPressed:(UIButton *)sender;


@property OpticalConundrumData* opticalConundrumData;

@property NSDictionary* userData;
@property int totalHighcore;
@end

