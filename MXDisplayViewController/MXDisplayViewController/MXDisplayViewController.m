//
//  MXDisplayViewController.m
//  MXDisplayViewController
//
//  Created by liu on 15/12/10.
//  Copyright © 2015年 vizz. All rights reserved.
//

#import "MXDisplayViewController.h"
#import "MXDisplayTopMenu.h"

@interface MXDisplayViewController ()<UIScrollViewDelegate, MXDisplayTopMenuDelegate>

@property (weak, nonatomic) MXDisplayTopMenu *topMenu;

@property (weak, nonatomic) UIScrollView *contentScrollView;

@end

@implementation MXDisplayViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    [self setupTopMenu];
    
    [self setupContentScrollView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.topMenu.frame = CGRectMake(0, 0, MXScreenW, MXTopMenuScrollViewH);
    
    CGFloat y = CGRectGetMaxY(self.topMenu.frame);
    self.contentScrollView.frame = CGRectMake(0, y, MXScreenW, self.view.height - y);
    
    NSArray *titles = [self.childViewControllers valueForKeyPath:@"title"];
    
    self.topMenu.titles = titles;
    self.contentScrollView.contentSize = CGSizeMake(MXScreenW * titles.count, 0);
    
    [self setupVc:0];
}


- (void)setupVc:(NSInteger)index
{
    UIViewController *vc = self.childViewControllers[index];
    
    if ([vc viewIfLoaded]) return;

    vc.view.frame = self.contentScrollView.bounds;

    [self.contentScrollView addSubview:vc.view];
    
    
    
}

- (void)setupTopMenu
{
    MXDisplayTopMenu *topMenu = [[MXDisplayTopMenu alloc] init];
    topMenu.delegate = self;
    [self.view addSubview:topMenu];
    self.topMenu = topMenu;
}

- (void)setupContentScrollView
{
    UIScrollView *contentScrollView = [[UIScrollView alloc] init];
    contentScrollView.delegate = self;
    contentScrollView.pagingEnabled = YES;
    contentScrollView.bounces = NO;
    [self.view addSubview:contentScrollView];
    self.contentScrollView = contentScrollView;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger index = scrollView.contentOffset.x / scrollView.width;
    
    [self setupVc:index];
    
    [self.topMenu setTitleCenter:index];
}


- (void)displayTopMenu:(MXDisplayTopMenu *)topMenu toIndex:(NSInteger)toIndex fromIndex:(NSInteger)fromIndex
{
    
    [self.contentScrollView setContentOffset:CGPointMake(MXScreenW * toIndex, 0) animated:NO];
    
    
    [self setupVc:toIndex];
    
    
    
}

@end
