//
//  Homepage.m
//  Axon Evolution
//
//  Created by David Russell [el16dmcr] on 21/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "Homepage.h"

@implementation Homepage
// Function to make customizing colour easier

UIColor *RGB1(float r, float g, float b)
{
    return [UIColor colorWithRed:r/255.0f
                           green:g/255.0f
                            blue:b/255.0f
                           alpha:1.0];
}
void drawLinearGradient(CGContextRef context, CGRect rect, CGColorRef startColor, CGColorRef endColor)
{
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGFloat locations[] = { 0.0, 1.0 };
    
    NSArray *colors = @[(__bridge id) startColor, (__bridge id) endColor];
    
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef) colors, locations);
    
    // More coming...
    CGPoint startPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMinY(rect));
    CGPoint endPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMaxY(rect));
    
    CGContextSaveGState(context);
    CGContextAddRect(context, rect);
    CGContextClip(context);
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
    CGContextRestoreGState(context);
    
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    // Setting the colour of the background  for the screen
    CGColorRef lightblue = [RGB1(0, 256, 242) CGColor];
    CGColorRef darkBlue = [RGB1(66, 134, 244) CGColor];
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width; //Gets screen width
    CGFloat height = [UIScreen mainScreen].bounds.size.height; //Gets screen height
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextClearRect(context, self.bounds);
    
    CGContextSetFillColorWithColor(context, lightblue);
    CGContextFillRect(context, CGRectMake(0, 0, width, height));
    
    CGRect niceEdges = CGRectMake(0, 0, width/6, height);
    drawLinearGradient(context, niceEdges, darkBlue, lightblue);
    
    
    
    
   
}


@end
