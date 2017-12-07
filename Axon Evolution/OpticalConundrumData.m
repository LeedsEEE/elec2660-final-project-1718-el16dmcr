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

//Initialises the variables as what they should be after the user has edited the sliders or buttons in settings
-(id)init{
    self = [super init];
    SettingsData *data = [SettingsData sharedInstance];
    self.startPoints = [data opticalConundrumStartPoints];
    self.pointsPlus = [data opticalConundrumPointsPlus];
    self.pointsMinus = [data opticalConundrumPointsMinus];
    return self;
}
// Makes the current points equal to the start points at the start of the game
-(int)getInitialScore {
    self.currentScore = self.startPoints;
    return self.currentScore;
}
// subtracts points from current score if the user gets it wrong
-(int)wrongSelection {
    self.currentScore = self.currentScore - self.pointsMinus;
    return self.currentScore;
}
// Adds points to the current score if the user makes the right choice
-(int)correctSelection {
    self.currentScore = self.currentScore + self.pointsPlus;
    return self.currentScore;
}

@end
