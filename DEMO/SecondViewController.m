//
//  SecondViewController.m
//  DEMO
//
//  Created by tom on 2018/9/9.
//  Copyright © 2018年 tom. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textFieldWidthConstraint;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@property (strong, nonatomic) CAGradientLayer *layerGradient;

@property (strong, nonatomic) NSArray *arrayColor;

@property (strong, nonatomic) CABasicAnimation *locationAnimation;

@property (weak, nonatomic) IBOutlet UIView *maskView;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.textField.layer.cornerRadius = 22;
    self.textField.backgroundColor = [[UIColor blueColor] colorWithAlphaComponent:0.2];
    
    self.arrayColor = @[
                        (id)[UIColor brownColor].CGColor,
                        (id)[UIColor redColor].CGColor,
                        (id)[UIColor brownColor].CGColor,
                        ];

    self.layerGradient = [CAGradientLayer layer];
    self.layerGradient.frame = self.view.frame;
    [self.view.layer addSublayer:self.layerGradient];
    
    self.layerGradient.colors = self.arrayColor;
    self.layerGradient.locations = @[@0.0, @0.2, @0.4];
    self.layerGradient.startPoint = CGPointMake(0, 0.5f);
    self.layerGradient.endPoint = CGPointMake(1, 0.5f);
    
    self.locationAnimation = [CABasicAnimation animationWithKeyPath:@"locations"];
    self.locationAnimation.fromValue = @[@-0.2, @-0.1, @0.0];
    self.locationAnimation.toValue = @[@1.0, @1.1, @1.2];
    self.locationAnimation.repeatCount = HUGE;
    self.locationAnimation.duration = 2.0f;
//    self.locationAnimation.autoreverses = true;
    
    self.layerGradient.mask = self.maskView.layer;
    
    [self animationStart];
}

- (void)viewDidLayoutSubviews {
    self.layerGradient.frame = self.view.frame;
}

- (void)animationStart {
    [self.layerGradient addAnimation:self.locationAnimation forKey:@"locations"];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.textField resignFirstResponder];
}

- (IBAction)buttonClicked:(id)sender {
    [UIView animateWithDuration:0.2f animations:^{
        self.textFieldWidthConstraint.constant = self.textFieldWidthConstraint.constant == 44 ? 100 : 44;
        [self.view layoutIfNeeded];
    }];
}

@end
