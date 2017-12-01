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
    //[self.flipRetentionData ]
    
    [self.a11Image setImage:[UIImage imageNamed:@"setOnePairOne"]]; //Needs to be set
    [self.a11Image setUserInteractionEnabled:YES];
    
    [self generateRandomImages];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)generateRandomImages{
    for(int i = 0; i<8; i++){
        [self.flipRetentionData generatePairImages];
        if ([[self.flipRetentionData.firstEightPlaces objectAtIndex:self.flipRetentionData.randomOne]  isEqualToString: @"0"]){
            [self.flipRetentionData.firstEightPlaces removeObjectAtIndex:self.flipRetentionData.randomOne];
            [self.a11Image setImage:[UIImage imageNamed:@"setOnePairOne"]];
            [self generatePlaceForImage];
        }
        
    }
}
-(void)generatePlaceForImage{
    if([[self.flipRetentionData.sixteenPositionTiles objectAtIndex:self.flipRetentionData.randomOne]  isEqualToString: @"0"]){
        
        
    }
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
