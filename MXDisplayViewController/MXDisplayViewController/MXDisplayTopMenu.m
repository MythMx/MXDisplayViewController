//
//  MXDisplayTopMenu.m
//  MXDisplayViewController
//
//  Created by liu on 15/12/10.
//  Copyright © 2015年 vizz. All rights reserved.
//

#import "MXDisplayTopMenu.h"
#import "MXDisplayTopTitle.h"

@interface MXDisplayTopMenu()

@property (nonatomic, weak) UIScrollView *menuScrollView;

@property (nonatomic, weak) UIButton *switchButton;

@property (nonatomic, strong) NSMutableArray *titleWidths;

@end

@implementation MXDisplayTopMenu

- (NSMutableArray *)titleWidths
{
    if (!_titleWidths) {
        _titleWidths = [NSMutableArray array];
    }
    return _titleWidths;
}

- (instancetype)init
{
    if (self = [super init]) {
        
        [self setupMenuScrollView];
        
//        [self setupSwitchButton];
    }
    return self;
}

- (void)setupMenuScrollView
{
    UIScrollView *menuScrollView = [[UIScrollView alloc] init];
    menuScrollView.showsVerticalScrollIndicator = NO;
    menuScrollView.showsHorizontalScrollIndicator = NO;
    [self addSubview: menuScrollView];
    self.menuScrollView = menuScrollView;
}

- (void)setupSwitchButton
{
    UIButton *switchButton = [[UIButton alloc] init];
    switchButton.backgroundColor = [UIColor grayColor];
    [self addSubview:switchButton];
    self.switchButton = switchButton;
}

- (void)setTitles:(NSArray *)titles
{
    _titles = titles;
    
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:MXTitleFont];
    
    for (int i = 0; i < titles.count; i++) {
        
        NSString *title = titles[i];
        
        MXDisplayTopTitle *titleButton = [[MXDisplayTopTitle alloc] init];
        titleButton.tag = i;
        [titleButton setTitle:title forState:UIControlStateNormal];
        [self.menuScrollView addSubview:titleButton];
        
        [titleButton addTarget:self action:@selector(titleButtonClick:)];
        
        CGFloat width = [title boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, MXTopMenuScrollViewH) options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size.width;
        
        [self.titleWidths addObject:@(width)];
        
        
        if (i == 0) {
            titleButton.showUnderLine = YES;
        }
    }
}


- (void)titleButtonClick:(MXDisplayTopTitle *)titleButton
{
    [self setTitleCenter:titleButton.tag];
    
    if ([self.delegate respondsToSelector:@selector(displayTopMenu:toIndex:fromIndex:)]) {
        [self.delegate displayTopMenu:self toIndex:titleButton.tag fromIndex:0];
    }
}

- (void)setTitleCenter:(NSInteger)index
{
    // 设置标题滚动区域的偏移量
    MXDisplayTopTitle *titleButton = self.menuScrollView.subviews[index];
    
    CGFloat offsetX = titleButton.center.x - MXScreenW * 0.5;
    
    
    if (offsetX < 0) {
        offsetX = 0;
    }
    
    // 计算下最大的标题视图滚动区域
    CGFloat maxOffsetX = self.menuScrollView.contentSize.width - MXScreenW;
    
    
    if (offsetX > maxOffsetX) {
        offsetX = maxOffsetX + self.switchButton.width;
    }
    
    
    // 滚动区域
    [self.menuScrollView setContentOffset:CGPointMake(offsetX, 0) animated:YES];
    
    
    for (int i = 0; i < self.menuScrollView.subviews.count; i++) {
        MXDisplayTopTitle *titleButton = self.menuScrollView.subviews[i];
        titleButton.showUnderLine = i == index;
    }

}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.switchButton.x = self.width - self.height;
    self.switchButton.width = self.height;
    self.switchButton.height = self.height;

    self.menuScrollView.height = self.height;
    self.menuScrollView.width = self.width;
    
    NSUInteger count = self.menuScrollView.subviews.count;
    
    UIView *lastTitleButton = nil;
    
    for (int i = 0; i < count; i++) {
        
        MXDisplayTopTitle *titleButton = self.menuScrollView.subviews[i];
        
        titleButton.width = [self.titleWidths[i] floatValue];
        titleButton.height = MXTopMenuScrollViewH;
        titleButton.x = lastTitleButton ? CGRectGetMaxX(lastTitleButton.frame) + MXTitleMargin : MXTitleMargin;
        
        lastTitleButton = titleButton;
    }
    
    self.menuScrollView.contentSize = CGSizeMake(CGRectGetMaxX(lastTitleButton.frame) + MXTitleMargin, 0);
    
}

@end
