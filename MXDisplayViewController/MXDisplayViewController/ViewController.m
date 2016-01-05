//
//  ViewController.m
//  MXDisplayViewController
//
//  Created by liu on 15/12/10.
//  Copyright © 2015年 vizz. All rights reserved.
//

#import "ViewController.h"
#import "MXTableViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupAllChildViewControllers];
    
}


- (void)setupAllChildViewControllers
{
    MXTableViewController *v1 = [[MXTableViewController alloc] init];
    v1.title = @"Exp1";
    [self addChildViewController:v1];
    
    MXTableViewController *v2 = [[MXTableViewController alloc] init];
    v2.title = @"Exp22";
    [self addChildViewController:v2];
    
    MXTableViewController *v3 = [[MXTableViewController alloc] init];
    v3.title = @"Exp333";
    [self addChildViewController:v3];
    
    MXTableViewController *v4 = [[MXTableViewController alloc] init];
    v4.title = @"Exp4444";
    [self addChildViewController:v4];
    
    MXTableViewController *v5 = [[MXTableViewController alloc] init];
    v5.title = @"Exp55555";
    [self addChildViewController:v5];
    
    MXTableViewController *v6 = [[MXTableViewController alloc] init];
    v6.title = @"Exp666666";
    [self addChildViewController:v6];
    
    MXTableViewController *v7 = [[MXTableViewController alloc] init];
    v7.title = @"Exp7777777";
    [self addChildViewController:v7];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
