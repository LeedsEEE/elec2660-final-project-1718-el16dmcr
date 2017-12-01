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
    self.randomTwo =arc4random_uniform(15-self.counterOne);
    return self.randomTwo;
}
-(BOOL)picturesMatch{
    return YES;
}
-(int)gameTwoScoreCumulative{
    self.currentScore = self.currentScore + self.pointsPlus;
    return self.currentScore;
}
-(int)incrementCounter{
    self.counterOne ++;
    return self.counterOne;
}
-(id)init{
    self = [super init];
    self.startPoints = 200;
    self.currentScore = self.startPoints;
    self.firstEightPlaces = [NSMutableArray arrayWithObjects: @"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7", nil];
    self.sixteenPositionTiles = [NSMutableArray arrayWithObjects: @"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"11", @"12", @"13", @"14", @"15", nil];
    return self;
}


@end
