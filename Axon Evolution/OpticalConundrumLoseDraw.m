//
//  OpticalConundrumLoseDraw.m
//  Axon Evolution
//
//  Created by David Russell [el16dmcr] on 05/12/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "OpticalConundrumLoseDraw.h"

@implementation OpticalConundrumLoseDraw
UIColor *RGB5(float r, float g, float b)            //adapted from https://stackoverflow.com/questions/13224206/how-do-i-create-a-uicolor-from-rgba
{
    return [UIColor colorWithRed:r/255.0f
                           green:g/255.0f
                            blue:b/255.0f
                           alpha:1.0];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Sets the background color for the lose screen
    CGColorRef opticalConundrumPurple = [RGB5(161, 0, 255) CGColor];
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;            //adapted from https://stackoverflow.com/questions/3655104/iphone-ipad-how-to-get-screen-width-programmatically
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextClearRect(context, self.bounds);
    
    CGContextSetFillColorWithColor(context, opticalConundrumPurple);
    CGContextFillRect(context, CGRectMake(0, 0, width, height));
    
}


@end
