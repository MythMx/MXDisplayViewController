//
//  MXDisplayTopTitle.h
//  MXDisplayViewController
//
//  Created by liu on 15/12/15.
//  Copyright © 2015年 vizz. All rights reserved.
//

#import <UIKit/UIKit.h>

#define MXTitleMargin 10
#define MXTitleFont 15.0f

@interface MXDisplayTopTitle : UIButton

- (void)addTarget:(id)target action:(SEL)action;

@property (nonatomic, assign) BOOL showUnderLine;

@end
