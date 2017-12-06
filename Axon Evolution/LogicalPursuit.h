//
//  LogicalPursuit.h
//  Axon Evolution
//
//  Created by David Russell [el16dmcr] on 28/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SettingsData.h"

@interface LogicalPursuit : NSObject



@property int currentLives;
@property int startLives;
@property NSMutableArray *latestPattern;
@property NSMutableArray *userInputtedPattern;
@property int pointsPlus;
@property int randomOne;
@property int roundCounter;
@property NSString *shape;
@property int currentPoints;


-(int)calculatePoints;
-(int)pickNextShape;
-(int)roundCounterPlus;
-(int)setStartLives;
-(int)removeLive;
-(BOOL)checkLives;
-(id)init;
-(NSMutableArray *)shapeSelector;
-(NSMutableArray *)clearArray;

@end
