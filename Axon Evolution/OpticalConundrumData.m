//
//  OpticalConundrumData.m
//  Axon Evolution
//
//  Created by David Russell [el16dmcr] on 24/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "OpticalConundrumData.h"
#import <stdlib.h>

@implementation OpticalConundrumData


-(id)init{
    self = [super init];
    self.startPoints = 1000;
    self.pointsPlus = 50;
    self.pointsMinus = 50;
    return self;
}
-(int)getInitialScore {
    self.currentScore = self.startPoints;
    return self.currentScore;
}
-(int)wrongSelection {
    self.currentScore = self.currentScore - self.pointsMinus;
    return self.currentScore;
}
-(int)correctSelection {
    self.currentScore =self.currentScore + self.pointsPlus;
    return self.currentScore;
}

@end
