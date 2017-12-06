//
//  SettingsData.m
//  Axon Evolution
//
//  Created by David Russell [el16dmcr] on 06/12/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "SettingsData.h"

@implementation SettingsData
@synthesize opticalConundrumStartPoints;
@synthesize opticalConundrumPointsPlus;
@synthesize opticalConundrumPointsMinus;
@synthesize opticalConundrumTimeAvailable;

@synthesize flipRetentionStartPoints;
@synthesize flipRetentionPointsPlus;
@synthesize flipRetentionPointsMinus;
@synthesize flipRetentionTimeAvailable;

@synthesize logicalPursuitStartLives;
@synthesize logicalPursuitPointsPlus;

static SettingsData*_sharedInstance;

-(id)init{
    self = [super init];
    self.opticalConundrumStartPoints = 250;
    self.opticalConundrumPointsPlus = 75;
    self.opticalConundrumPointsMinus = 38;
    self.opticalConundrumTimeAvailable = 90;
    
    self.flipRetentionStartPoints = 250;
    self.flipRetentionPointsPlus = 75;
    self.flipRetentionPointsMinus = 38;
    self.flipRetentionTimeAvailable =90;
    
    self.logicalPursuitStartLives = 3;
    self.logicalPursuitPointsPlus = 100;
    return self;
}
+ (SettingsData *) sharedInstance{
    if(!_sharedInstance){
        _sharedInstance = [[SettingsData alloc] init];
    }
    return _sharedInstance;
}

@end
