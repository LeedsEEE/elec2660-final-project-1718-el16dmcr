//
//  OpticalConundrumWinController.m
//  Axon Evolution
//
//  Created by David Russell [el16dmcr] on 05/12/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "OpticalConundrumWinController.h"

@interface OpticalConundrumWinController ()

@end

@implementation OpticalConundrumWinController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



// Allows the user to click anywhere on the screen to return to the main menu
// adapted from https://www.youtube.com/watch?v=QhNdvCE9jVg 
- (IBAction)contineToHome:(UIButton *)sender {
    UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UINavigationController *nc = [mainStoryBoard instantiateViewControllerWithIdentifier:@"HomePage"];
    [self presentViewController:nc animated:YES completion:nil];
}
@end
