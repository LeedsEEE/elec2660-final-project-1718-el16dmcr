//
//  FlipRetentionInstructionController.m
//  Axon Evolution
//
//  Created by David Russell [el16dmcr] on 05/12/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "FlipRetentionInstructionController.h"

@interface FlipRetentionInstructionController ()

@end

@implementation FlipRetentionInstructionController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

// Allows the user to click anywhere on the screen and take them to the game to begin playing
// adapted from https://www.youtube.com/watch?v=QhNdvCE9jVg 
- (IBAction)continueToGame:(UIButton *)sender {
    
    UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *vc = [mainStoryBoard instantiateViewControllerWithIdentifier:@"FlipRetention"];
    vc.opticalConundrumData = self.opticalConundrumData;
    [self presentViewController:vc animated:YES completion:nil];
    
}
@end
