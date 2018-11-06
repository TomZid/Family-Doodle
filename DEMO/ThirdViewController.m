
//
//  ThirdViewController.m
//  DEMO
//
//  Created by tom on 2018/9/23.
//  Copyright © 2018年 tom. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()
@property (nonatomic, strong) UIViewController *vc;
@property (nonatomic, strong) UIViewController *vc_;
@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _vc = [UIViewController new];
    _vc.view.backgroundColor = [UIColor yellowColor];
    [self addChildViewController:_vc];
    [self.view addSubview:_vc.view];
    UIButton *button = [UIButton new];
    [button setTitle:@"PUSH" forState:UIControlStateNormal];
    [button setCenter:_vc.view.center];
    [button sizeToFit];
    [_vc.view addSubview:button];
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
}

- (IBAction)buttonClicked:(UIButton *)sender {
    UIViewController *vc_ = [UIViewController new];
    vc_.view.backgroundColor = [UIColor redColor];
    [self addChildViewController:vc_];
    [self.view addSubview:vc_.view];
    [self transitionFromViewController:self.vc toViewController:vc_ duration:1 options:UIViewAnimationOptionTransitionFlipFromLeft | UIViewAnimationOptionShowHideTransitionViews animations:nil completion:nil];
}

@end
