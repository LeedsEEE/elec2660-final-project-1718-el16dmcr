//
//  FlipRetentionController.h
//  Axon Evolution
//
//  Created by David Russell [el16dmcr] on 30/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "ViewController.h"
#import "FlipRetentionData.h"

@interface FlipRetentionController : ViewController

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *timerLabel;

@property (weak, nonatomic) IBOutlet UIImageView *a11Image;
@property (weak, nonatomic) IBOutlet UIImageView *a12Image;
@property (weak, nonatomic) IBOutlet UIImageView *a13Image;
@property (weak, nonatomic) IBOutlet UIImageView *a14Image;

@property (weak, nonatomic) IBOutlet UIImageView *a21Image;
@property (weak, nonatomic) IBOutlet UIImageView *a22Image;
@property (weak, nonatomic) IBOutlet UIImageView *a23Image;
@property (weak, nonatomic) IBOutlet UIImageView *a24Image;

@property (weak, nonatomic) IBOutlet UIImageView *a31Image;
@property (weak, nonatomic) IBOutlet UIImageView *a32Image;
@property (weak, nonatomic) IBOutlet UIImageView *a33Image;
@property (weak, nonatomic) IBOutlet UIImageView *a34Image;


@property (weak, nonatomic) IBOutlet UIImageView *a41Image;
@property (weak, nonatomic) IBOutlet UIImageView *a42Image;
@property (weak, nonatomic) IBOutlet UIImageView *a43Image;
@property (weak, nonatomic) IBOutlet UIImageView *a44Image;

@property (weak, nonatomic) IBOutlet UIButton *mainMenuButton;


@property FlipRetentionData *flipRetentionData;
@property UIImage *PairOne;
@property UIImage *PairTwo;
@property UIImage *PairThree;
@property UIImage *PairFour;
@property UIImage *PairFive;
@property UIImage *PairSix;
@property UIImage *PairSeven;
@property UIImage *PairEight;

@end
