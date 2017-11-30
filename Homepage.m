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
UIColor* RGB(float r, float g, float b)
{
    return [UIColor colorWithRed:r/255.0f
                           green:g/255.0f
                            blue:b/255.0f
                           alpha:1.0];
}
-(void) drawRoundedRect:(float) startx: (float) starty: (float) widthRect: (float) heightRect: (float) radius
{
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.1].CGColor);
    CGContextMoveToPoint(context, startx + radius, starty);
    CGContextAddLineToPoint(context, startx + widthRect - radius, starty);
    //CGContextAddArcToPoint(context,  startx + widthRect - radius, starty, startx + widthRect, starty - radius, radius);
    CGContextAddLineToPoint(context, startx + widthRect, starty - heightRect + radius);
    //CGContextAddArcToPoint(context,  startx + widthRect, starty - heightRect + radius, startx + widthRect - radius, starty - heightRect, radius);
    CGContextAddLineToPoint(context, startx + radius, starty - heightRect );
    //CGContextAddArcToPoint(context,  startx + radius, starty - heightRect, startx, starty - heightRect + radius, radius);
    CGContextAddLineToPoint(context, startx, starty - radius );
    //CGContextAddArcToPoint(context,  startx, starty - radius, startx + radius, starty, radius);
    CGContextFillPath(context);
    
}



// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    NSLog(@"Commit Check");
    
    
    // Define the height and width of the scren so it works for all screens
    //CGFloat width = [UIScreen mainScreen].bounds.size.width;
    //CGFloat height = [UIScreen mainScreen].bounds.size.height;
    
    // Making the colours i am going to use in the homepage
    //CGColorRef lightBlueHomeScreen = [RGB(0.0, 191.0, 255.0) CGColor];
    //CGColorRef yellow = [[UIColor yellowColor] CGColor];
    
    // Clears the screen
    //CGContextRef context = UIGraphicsGetCurrentContext();
    //CGContextClearRect(context, self.bounds);
    
    // Where the shapes are made
    // Homepage background
    //CGContextSetFillColorWithColor(context, lightBlueHomeScreen);
    //CGContextFillRect(context, CGRectMake(0, 0, width, height));
    
    //[self drawRoundedRect:100 :100 :100 :100 :10];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.1].CGColor);
    
    
    CGContextMoveToPoint(context, 100, 100);
    CGContextAddArcToPoint(context,190,100,200,110,10);
    CGContextAddArcToPoint(context,200,190,190,200,10);
    CGContextAddArcToPoint(context,100,200,90,190,10);
    CGContextAddArcToPoint(context,90,110,100,100,10);
    CGContextFillPath(context);
    
   /* CGContextSetFillColorWithColor(context, [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.1].CGColor);
    CGContextMoveToPoint(context, 10, 0);
    CGContextAddLineToPoint(context, 95, 0);
    CGContextAddArcToPoint(context, 100, 0, 100, 0, 10);
    CGContextAddLineToPoint(context, 100, 95);
    CGContextAddArcToPoint(context, 100, 100, 95, 100, 10);
    CGContextAddLineToPoint(context, 5, 100);
    CGContextAddArcToPoint(context, 0, 100, 0, 95, 10);
    CGContextAddLineToPoint(context, 0, 5);
    CGContextAddArcToPoint(context, 0, 0, 5, 0, 10);
    CGContextFillPath(context); */
    
    //CGContextSetFillColorWithColor(context, yellow);
    //CGPathRef CGPathCreateWithRoundedRect(rect, 20, 20, const CGAffineTransform *transform);
    
    
    /*CGContextSetFillColorWithColor(context, yellow);
    CGContextFillRect(context, CGRectMake(0, 0, 20, height)); */
}


@end
