//
//  LogicalPursuit.m
//  Axon Evolution
//
//  Created by David Russell [el16dmcr] on 28/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "LogicalPursuit.h"

@implementation LogicalPursuit

-(NSString *)shapeSelector{
    if (self.randomOne == 0){
        self.shape = @"circle";
    }
    else if (self.randomOne == 1){
        self.shape = @"invertedSquare";
    }
    else if (self.randomOne == 1){
        self.shape = @"rhombus";
    }
    else if (self.randomOne == 1){
        self.shape = @"square";
    }
    else if (self.randomOne == 1){
        self.shape = @"diamond";
    }
    else if (self.randomOne == 1){
        self.shape = @"triangle";
    }
    return self.shape;
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
-(id)init{
    self = [super init];
    self.startLives = 3;
    self.pointsPlus = 50;
    self.roundCounter = 5;
    return self;
}

@end
