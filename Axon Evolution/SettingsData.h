//
//  SettingsData.h
//  Axon Evolution
//
//  Created by David Russell [el16dmcr] on 06/12/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SettingsData : NSObject

@property int opticalConundrumStartPoints;
@property int opticalConundrumPointsPlus;
@property int opticalConundrumPointsMinus;
@property int opticalConundrumTimeAvailable;

@property int flipRetentionStartPoints;
@property int flipRetentionPointsPlus;
@property int flipRetentionPointsMinus;
@property int flipRetentionTimeAvailable;

@property int logicalPursuitStartLives;
@property int logicalPursuitPointsPlus;

+ (SettingsData *) sharedInstance;

-(id)init;

@end
