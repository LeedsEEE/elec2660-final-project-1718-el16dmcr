//
//  FlipRetentionData.h
//  Axon Evolution
//
//  Created by David Russell [el16dmcr] on 30/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FlipRetentionData : NSObject

@property int pointsPlus;
@property int pointsMinus;
@property int startPoints;
@property int firstPicture;
@property int secondPicture;
@property int randomOne;
@property int randomTwo;

-(BOOL)picturesMatch;
-(int)GameTwoScoreCumulative;

@end
