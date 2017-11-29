//
//  LogicalPursuit.m
//  Axon Evolution
//
//  Created by David Russell [el16dmcr] on 28/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "LogicalPursuit.h"

@implementation LogicalPursuit


-(int)pickNextShape{
    self.randomOne = arc4random_uniform(5);
    return self.randomOne;
}
-(int)roundCounterPlus {
    self.roundCounter ++;
    return self.roundCounter;
}
-(int)setStartLives{
    self.currentLives = self.startLives;
    return self.currentLives;
}
-(int)removeLive{
    self.currentLives --;
    return self.currentLives;
}
-(BOOL)checkLives {
    if (self.currentLives == 0){
        return YES;
        
    }
    else {
        return NO;
    }
}
-(id)init{
    self = [super init];
    self.startLives = 3;
    self.pointsPlus = 50;
    return self;
}

@end
