//
//  FlipRetentionData.m
//  Axon Evolution
//
//  Created by David Russell [el16dmcr] on 30/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "FlipRetentionData.h"

@implementation FlipRetentionData

-(int)generatePairImages{
    self.randomOne = arc4random_uniform(7);
    return self.randomOne;
}
-(int)generatePairPositions{
    self.randomTwo =arc4random_uniform(15);
    return self.randomTwo;
}
-(BOOL)picturesMatch{
    return YES;
}
-(int)gameTwoScoreCumulative{
    self.currentScore = self.currentScore + self.pointsPlus;
    return self.currentScore;
}
@end
