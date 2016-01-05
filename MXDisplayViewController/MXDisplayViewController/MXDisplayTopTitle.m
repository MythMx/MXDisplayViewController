//
//  MXDisplayTopTitle.m
//  MXDisplayViewController
//
//  Created by liu on 15/12/15.
//  Copyright © 2015年 vizz. All rights reserved.
//

#import "MXDisplayTopTitle.h"

#define MXUnderLineH 2

@implementation MXDisplayTopTitle

- (instancetype)init
{
    if (self = [super init]) {
        self.titleLabel.font = [UIFont systemFontOfSize:MXTitleFont];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
    }
    return self;
}

- (void)addTarget:(id)target action:(SEL)action
{
    [self addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
}

- (void)setShowUnderLine:(BOOL)showUnderLine
{
    _showUnderLine = showUnderLine;
    
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    
    if (self.showUnderLine) {
        
        CGContextRef contextRef = UIGraphicsGetCurrentContext();
        
        [[UIColor orangeColor] set];
        
        CGContextFillRect(contextRef, CGRectMake(0, rect.size.height - MXUnderLineH, rect.size.width, MXUnderLineH));
        
        CGContextStrokePath(contextRef);
    }
    
    
}

@end
