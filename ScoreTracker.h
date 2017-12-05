//
//  ScoreTracker.h
//  Axon Evolution
//
//  Created by David Russell [el16dmcr] on 20/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OpticalConundrumData.h"
#import "LogicalPursuit.h"
#import "FlipRetentionData.h"

@interface ScoreTracker : NSObject

@property int opticalConundrumScore;
@property int logicalPursuitScore;
@property int flipRetentionScore;
@property int opticalConundrumHighScore;
@property int logicalPursuitHighScore;
@property int flipRetentionHighScore;

@property OpticalConundrumData* opticalConumdrumSave;
@property FlipRetentionData* flipRetentionSave;
@property LogicalPursuit* logicalPursuitSave;

-(int)getOpticalConundrumScore;
-(int)getLogicalPursuitScore;
-(int)getFlipRetentionScore;
-(void)saveDataToFile;

@end
