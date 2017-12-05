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

@property (weak, nonatomic) IBOutlet UIImageView *a11Cover;
@property (weak, nonatomic) IBOutlet UIImageView *a12Cover;
@property (weak, nonatomic) IBOutlet UIImageView *a13Cover;
@property (weak, nonatomic) IBOutlet UIImageView *a14Cover;

@property (weak, nonatomic) IBOutlet UIImageView *a21Cover;
@property (weak, nonatomic) IBOutlet UIImageView *a22Cover;
@property (weak, nonatomic) IBOutlet UIImageView *a23Cover;
@property (weak, nonatomic) IBOutlet UIImageView *a24Cover;

@property (weak, nonatomic) IBOutlet UIImageView *a31Cover;
@property (weak, nonatomic) IBOutlet UIImageView *a32Cover;
@property (weak, nonatomic) IBOutlet UIImageView *a33Cover;
@property (weak, nonatomic) IBOutlet UIImageView *a34Cover;

@property (weak, nonatomic) IBOutlet UIImageView *a41Cover;
@property (weak, nonatomic) IBOutlet UIImageView *a42Cover;
@property (weak, nonatomic) IBOutlet UIImageView *a43Cover;
@property (weak, nonatomic) IBOutlet UIImageView *a44Cover;


@property (weak, nonatomic) IBOutlet UIButton *mainMenuButton;


@property FlipRetentionData *flipRetentionData;



@property int tagSetter;
@property int userCounter;
@property int pairChecker;
@property int firstInput;
@property NSTimer* timer;
@property int timeTick;
@property int pairCounter;
@property NSMutableArray *tempArray1;
@property NSMutableArray *tempArray2;

@end
