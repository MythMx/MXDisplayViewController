//
//  MXDisplayTopMenu.h
//  MXDisplayViewController
//
//  Created by liu on 15/12/10.
//  Copyright © 2015年 vizz. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MXDisplayViewControllerConst.h"
#import "UIView+Frame.h"

@class MXDisplayTopMenu;

@protocol MXDisplayTopMenuDelegate <NSObject>

- (void)displayTopMenu:(MXDisplayTopMenu *)topMenu toIndex:(NSInteger)toIndex fromIndex:(NSInteger)fromIndex;

@end

@interface MXDisplayTopMenu : UIView

@property (nonatomic, strong) NSArray *titles;

@property (nonatomic, weak) id<MXDisplayTopMenuDelegate> delegate;

- (void)setTitleCenter:(NSInteger)index;

@end
