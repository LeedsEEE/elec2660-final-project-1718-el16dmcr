//
//  Homepage.m
//  Axon Evolution
//
//  Created by David Russell [el16dmcr] on 21/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "Homepage.h"

@implementation Homepage
// Function to make customizing olour easier
UIColor* RGB(float r, float g, float b)
{
    return [UIColor colorWithRed:r/255.0f
                           green:g/255.0f
                            blue:b/255.0f
                           alpha:1.0];
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    // Define the height and width of the scren so it works for all screens
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    
    // Making the colours i am going to use in the homepage
    CGColorRef lightBlueHomeScreen = [RGB(0.0, 191.0, 255.0) CGColor];
    CGColorRef yellow = [[UIColor yellowColor] CGColor];
    
    // Clears the screen
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextClearRect(context, self.bounds);
    
    // Where the shapes are made
    // Homepage background
    CGContextSetFillColorWithColor(context, lightBlueHomeScreen);
    CGContextFillRect(context, CGRectMake(0, 0, 20, 50));
    
    CGContextSetFillColorWithColor(context, yellow);
    CGPathRef CGPathCreateWithRoundedRect(rect, 20, 20, const CGAffineTransform *transform);
    
    
    /*CGContextSetFillColorWithColor(context, yellow);
    CGContextFillRect(context, CGRectMake(0, 0, 20, height)); */
}


@end
