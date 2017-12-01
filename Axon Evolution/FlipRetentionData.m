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
    self.randomOne = arc4random_uniform(7-self.counterOne);
    return self.randomOne;
}
-(int)generatePairPositions{
    self.randomTwo =arc4random_uniform(15-self.counterTwo);
    return self.randomTwo;
}
-(BOOL)picturesMatch{
    return YES;
}
-(int)gameTwoScoreCumulative{
    self.currentScore = self.currentScore + self.pointsPlus;
    return self.currentScore;
}
-(int)incrementCounterOne{
    self.counterOne ++;
    return self.counterOne;
}
-(int)incrementCounterTwo{
    self.counterTwo ++;
    return self.counterTwo;
}
-(id)init{
    self = [super init];
    self.counterOne =0;
    self.counterTwo = 0;
    self.startPoints = 200;
    self.currentScore = self.startPoints;
    self.firstEightPlaces = [[NSMutableArray alloc] init];
    self.sixteenPositionTiles = [[NSMutableArray alloc] init];
    self.firstEightPlaces = [[NSMutableArray alloc] initWithObjects:@1,@2,@3,@4,@5,@6,@7,@8, nil];
    self.sixteenPositionTiles = [[NSMutableArray alloc] initWithObjects:@1,@2,@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13,@14,@15,@16, nil];
    return self;
}


@end
