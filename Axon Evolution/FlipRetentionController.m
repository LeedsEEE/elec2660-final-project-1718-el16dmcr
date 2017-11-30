//
//  FlipRetentionController.m
//  Axon Evolution
//
//  Created by David Russell [el16dmcr] on 30/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "FlipRetentionController.h"

@interface FlipRetentionController ()

@end

@implementation FlipRetentionController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.a11Image setImage:[UIImage imageNamed:@"redCircleOffImage"]]; //Needs to be set
    [self.a11Image setUserInteractionEnabled:YES];
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

@end