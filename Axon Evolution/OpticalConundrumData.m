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

-(int) randomFontColourChosen: (int) shownFontColour {
    shownFontColour = arc4random_uniform(8);
    return(shownFontColour);
}


@end
