//
//  LogicalPursuit.m
//  Axon Evolution
//
//  Created by David Russell [el16dmcr] on 28/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "LogicalPursuit.h"

@implementation LogicalPursuit

-(NSMutableArray *)shapeSelector{
    if (self.randomOne == 0){
        self.shape = @"circle";
        [self.latestPattern addObject: @"circle"];
    }
    else if (self.randomOne == 1){
        self.shape = @"invertedSquare";
        [self.latestPattern addObject: @"invertedSquare"];
    }
    else if (self.randomOne == 2){
        self.shape = @"rhombus";
        [self.latestPattern addObject: @"rhombus"];
    }
    else if (self.randomOne == 3){
        self.shape = @"square";
        [self.latestPattern addObject: @"square"];
    }
    else if (self.randomOne == 4){
        self.shape = @"diamond";
        [self.latestPattern addObject: @"diamond"];
    }
    else if (self.randomOne == 5){
        self.shape = @"triangle";
        [self.latestPattern addObject: @"triangle"];
    }
    return self.latestPattern;
}
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
-(int)calculatePoints{
    self.currentPoints = self.currentPoints + self.pointsPlus;
    return self.currentPoints;
}
-(id)init{
    self = [super init];
    self.startLives = 3;
    self.pointsPlus = 50;
    self.roundCounter = 5;
    self.currentPoints = 0;
    self.latestPattern = [[NSMutableArray alloc] init];
    return self;
}

@end
