//
//  LogicalPursuit.m
//  Axon Evolution
//
//  Created by David Russell [el16dmcr] on 28/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "LogicalPursuit.h"

@implementation LogicalPursuit

// Depending on the random number generated it will add the correct string which refers to one of the shapes
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

// Clears away the last pattern that was used
-(NSMutableArray *)clearArray{
    [self.latestPattern removeAllObjects];
    NSLog (@"Number of elements in array = %lu", [self.latestPattern count]);
    return self.latestPattern;
}

// Generates a random number that will refernce a various shape to be lit up
-(int)pickNextShape{
    self.randomOne = arc4random_uniform(5);
    return self.randomOne;
}

// Increments the round counter every time the user completes a round
-(int)roundCounterPlus {
    self.roundCounter ++;
    return self.roundCounter;
}

// Sets the start lives depending on what the user selected in the settings screen
-(int)setStartLives{
    self.currentLives = self.startLives;
    return self.currentLives;
}

// Renmoves a life
-(int)removeLive{
    self.currentLives --;
    return self.currentLives;
}

// Checks if the user has any lives left when they get an incorrect answer
-(BOOL)checkLives {
    if (self.currentLives == 0){
        return true;
        
    }
    else {
        return false;
    }
}

// Calculates the points for the user after a correct shape was tapped
-(int)calculatePoints{
    self.currentPoints = self.currentPoints + self.pointsPlus;
    return self.currentPoints;
}

// Initialisation of the variables for this game
-(id)init{
    SettingsData *data = [SettingsData sharedInstance];
    self = [super init];
    self.startLives = [data logicalPursuitStartLives];
    self.pointsPlus = [data logicalPursuitPointsPlus];
    self.roundCounter = 5;
    self.currentPoints = 0;
    self.latestPattern = [[NSMutableArray alloc] init];
    return self;
}

@end
