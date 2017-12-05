//
//  FlipRetentionInstructionLooks.m
//  Axon Evolution
//
//  Created by David Russell [el16dmcr] on 04/12/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "FlipRetentionInstructionLooks.h"

@implementation FlipRetentionInstructionLooks

UIColor *RGB2(float r, float g, float b)
{
    return [UIColor colorWithRed:r/255.0f
                           green:g/255.0f
                            blue:b/255.0f
                           alpha:1.0];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGColorRef mistyGreen = [RGB2(3, 196, 132) CGColor];
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextClearRect(context, self.bounds);
    
    CGContextSetFillColorWithColor(context, mistyGreen);
    CGContextFillRect(context, CGRectMake(0, 0, width, height));
    
}


@end
