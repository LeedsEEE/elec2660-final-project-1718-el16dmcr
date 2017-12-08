//
//  OpticalConundrumInstructionController.m
//  Axon Evolution
//
//  Created by David Russell [el16dmcr] on 05/12/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "OpticalConundrumInstructionController.h"

@interface OpticalConundrumInstructionController ()

@end

@implementation OpticalConundrumInstructionController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// This function allows the user to tap anywhere on the screen so it will take them to the game
// adapted from https://www.youtube.com/watch?v=QhNdvCE9jVg
- (IBAction)continueToGame:(UIButton *)sender {
    UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *vc = [mainStoryBoard instantiateViewControllerWithIdentifier:@"OpticalConundrum"];
    [self presentViewController:vc animated:YES completion:nil];
}
@end
