//
//  OpticalConundrumController.h
//  Axon Evolution
//
//  Created by David Russell [el16dmcr] on 24/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OpticalConundrumData.h"

@interface OpticalConundrumController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *shownColourWordLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *timerLabel;


- (IBAction)topRightButtonPressed:(UIButton *)sender;
- (IBAction)bottomRightButtonPressed:(UIButton *)sender;
- (IBAction)topLeftButtonPressed:(UIButton *)sender;
- (IBAction)bottomLeftButtonPressed:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UIButton *topRightButton;
@property (weak, nonatomic) IBOutlet UIButton *bottomRightButton;
@property (weak, nonatomic) IBOutlet UIButton *topLeftButton;
@property (weak, nonatomic) IBOutlet UIButton *bottomLeftButton;

@property (nonatomic, strong) NSString *shownColourWord;
@property (nonatomic, strong) UIColor *shownFontColour;
@property (nonatomic, strong) UIColor *correctColour;
@property (nonatomic, strong) UIColor *wrongColour;
@property (nonatomic, strong) UIColor *otherColour1;
@property (nonatomic, strong) UIColor *otherColour2;
@property int randomOne;
@property int randomTwo;
@property int randomThree;
@property int randomFour;
@property int randomFive;

@property NSTimer* timer;
@property UILabel *progress;
@property int timeTick;
@property NSMutableArray *colourArray;
@end
