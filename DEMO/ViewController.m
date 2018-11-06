//
//  ViewController.m
//  DEMO
//
//  Created by tom on 2018/8/31.
//  Copyright © 2018年 tom. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *gradientView;
@property (strong, nonatomic) CAGradientLayer *layer;
@property (nonatomic,strong) NSArray *colorArray;
@property (nonatomic,assign) NSInteger colorIndex;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.layer = [CAGradientLayer new];
    self.layer.frame = self.gradientView.bounds;
    self.layer.startPoint = CGPointMake(0, 0.5f);
    self.layer.endPoint = CGPointMake(1, 0.5f);
    [self.gradientView.layer addSublayer:self.layer];
    
    self.colorIndex = -1;
    self.colorArray = @[
                        @{
                            @"color1" : (id)[UIColor colorWithRed:(arc4random() % 200 / 255.0f) green:(arc4random() % 200 / 255.0f) blue:(arc4random() % 200 / 255.0f) alpha:1].CGColor,
                            @"color2" : (id)[UIColor colorWithRed:(arc4random() % 200 / 255.0f) green:(arc4random() % 200 / 255.0f) blue:(arc4random() % 200 / 255.0f) alpha:1].CGColor,
                            },
                        @{
                            @"color1" : (id)[UIColor colorWithRed:(arc4random() % 200 / 255.0f) green:(arc4random() % 200 / 255.0f) blue:(arc4random() % 200 / 255.0f) alpha:1].CGColor,
                            @"color2" : (id)[UIColor colorWithRed:(arc4random() % 200 / 255.0f) green:(arc4random() % 200 / 255.0f) blue:(arc4random() % 200 / 255.0f) alpha:1].CGColor,
                            },
                        @{
                            @"color1" : (id)[UIColor colorWithRed:(arc4random() % 200 / 255.0f) green:(arc4random() % 200 / 255.0f) blue:(arc4random() % 200 / 255.0f) alpha:1].CGColor,
                            @"color2" : (id)[UIColor colorWithRed:(arc4random() % 200 / 255.0f) green:(arc4random() % 200 / 255.0f) blue:(arc4random() % 200 / 255.0f) alpha:1].CGColor,
                            },
                        @{
                            @"color1" : (id)[UIColor colorWithRed:(arc4random() % 200 / 255.0f) green:(arc4random() % 200 / 255.0f) blue:(arc4random() % 200 / 255.0f) alpha:1].CGColor,
                            @"color2" : (id)[UIColor colorWithRed:(arc4random() % 200 / 255.0f) green:(arc4random() % 200 / 255.0f) blue:(arc4random() % 200 / 255.0f) alpha:1].CGColor,
                            },
                        @{
                            @"color1" : (id)[UIColor colorWithRed:(arc4random() % 200 / 255.0f) green:(arc4random() % 200 / 255.0f) blue:(arc4random() % 200 / 255.0f) alpha:1].CGColor,
                            @"color2" : (id)[UIColor colorWithRed:(arc4random() % 200 / 255.0f) green:(arc4random() % 200 / 255.0f) blue:(arc4random() % 200 / 255.0f) alpha:1].CGColor,
                            },
                        @{
                            @"color1" : (id)[UIColor colorWithRed:(arc4random() % 200 / 255.0f) green:(arc4random() % 200 / 255.0f) blue:(arc4random() % 200 / 255.0f) alpha:1].CGColor,
                            @"color2" : (id)[UIColor colorWithRed:(arc4random() % 200 / 255.0f) green:(arc4random() % 200 / 255.0f) blue:(arc4random() % 200 / 255.0f) alpha:1].CGColor,
                            },
                        ];
    
    [self gradientAnimationStart];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.layer.frame = self.gradientView.bounds;
}

- (void)gradientAnimationStart {
    self.colorIndex = (self.colorIndex == self.colorArray.count - 1) ? 0 : self.colorIndex + 1;
//    NSLog(@"test self.colorIndex is: %ld", self.colorIndex);
    [UIView transitionWithView:self.gradientView duration:1 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        self.layer.colors = @[
                              self.colorArray[self.colorIndex][@"color1"],
                              self.colorArray[self.colorIndex][@"color2"],
                              ];
    } completion:^(BOOL finished) {
        [self gradientAnimationStart];
    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)unwindToViewController:(UIStoryboardSegue*)segue {}


@end
