//
//  FlipRetentionData.h
//  Axon Evolution
//
//  Created by David Russell [el16dmcr] on 30/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SettingsData.h"

@interface FlipRetentionData : NSObject

@property int pointsPlus;
@property int pointsMinus;
@property int startPoints;
@property int firstPicture;
@property int secondPicture;
@property int randomOne;
@property int randomTwo;
@property int currentScore;
@property NSString *pairOne;
@property NSString *pairTwo;
@property NSString *pairThree;
@property NSString *pairFour;
@property NSString *pairFive;
@property NSString *pairSix;
@property NSString *pairSeven;
@property NSString *pairEight;
@property NSMutableArray *firstEightPlaces;
@property NSMutableArray *sixteenPositionTiles;
@property int counterOne;
@property int counterTwo;


-(BOOL)picturesMatch;
-(int)gameTwoScoreCumulative;
-(int)generatePairPositions;
-(int)generatePairImages;
-(int)incrementCounterOne;
-(int)incrementCounterTwo;
-(int)wrongAnswer;
-(int)correctAnswer;

@end
