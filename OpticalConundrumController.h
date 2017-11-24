//
//  OpticalConundrumController.h
//  Axon Evolution
//
//  Created by David Russell [el16dmcr] on 24/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OpticalConundrumController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *shownColourWord;

- (IBAction)topRightButtonPressed:(UIButton *)sender;
- (IBAction)bottomRightButtonPressed:(UIButton *)sender;
- (IBAction)topLeftButtonPressed:(UIButton *)sender;
- (IBAction)bottomLeftButtonPressed:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UIButton *topRightButton;
@property (weak, nonatomic) IBOutlet UIButton *bottomRightButton;
@property (weak, nonatomic) IBOutlet UIButton *topLeftButton;
@property (weak, nonatomic) IBOutlet UIButton *bottomLeftButton;


@end
