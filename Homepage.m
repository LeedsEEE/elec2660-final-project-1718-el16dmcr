//
//  Homepage.m
//  Axon Evolution
//
//  Created by David Russell [el16dmcr] on 21/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "Homepage.h"

@implementation Homepage


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGColorRef lightBlueHomeScreen = [[UIColor blueColor] CGColor];
    
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextClearRect(context, self.bounds);
    
    
    CGContextSetFillColorWithColor(context, lightBlueHomeScreen);
    CGContextFillRect(context, CGRectMake(10, 10, 100, 100));
    
    
}


@end
