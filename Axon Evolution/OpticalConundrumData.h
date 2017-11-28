//
//  OpticalConundrumData.h
//  Axon Evolution
//
//  Created by David Russell [el16dmcr] on 24/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OpticalConundrumData : NSObject

@property (nonatomic, strong) NSString *shownColourWord;

@property int pointsPlus;
@property int pointsMinus;
@property int startPoints;
@property int currentScore;

-(int) getInitialScore: (int)currentScore: (int)startPoints;


@end
