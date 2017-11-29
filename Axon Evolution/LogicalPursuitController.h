//
//  LogicalPursuitController.h
//  Axon Evolution
//
//  Created by David Russell [el16dmcr] on 28/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "ViewController.h"
#import "LogicalPursuit.h"

@interface LogicalPursuitController : ViewController

@property (weak, nonatomic) IBOutlet UIImageView *redCircleImage;
@property (weak, nonatomic) IBOutlet UIImageView *pinkInvertedSquareImage;
@property (weak, nonatomic) IBOutlet UIImageView *blueRhombusImage;
@property (weak, nonatomic) IBOutlet UIImageView *cyanSquareImage;
@property (weak, nonatomic) IBOutlet UIImageView *purpleDiamondImage;
@property (weak, nonatomic) IBOutlet UIImageView *greenTriangleImage;

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *livesRemainingLabel;
@property (weak, nonatomic) IBOutlet UILabel *whenToPlayLabel;

@property (weak, nonatomic) IBOutlet UIButton *mainMenuButton;
- (IBAction)mainMenuButtonPressed:(UIButton *)sender;

@property LogicalPursuit* logicalPursuitData;

@end
