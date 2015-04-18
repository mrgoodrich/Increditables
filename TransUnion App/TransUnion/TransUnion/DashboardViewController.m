//
//  DashboardViewController.m
//  TransUnion
//
//  Created by Matt Goodrich on 4/18/15.
//  Copyright (c) 2015 Increditables. All rights reserved.
//

#import "DashboardViewController.h"


@interface DashboardViewController ()
@property (weak, nonatomic) IBOutlet UIView *boxOne;

@end

@implementation DashboardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:1/255.0 green:137/255.0 blue:171/255.0 alpha:1.0]];
    
    [self.navigationController.navigationBar setBackgroundColor:[UIColor colorWithRed:1/255.0 green:137/255.0 blue:171/255.0 alpha:1.0]];
    
    [self.navigationController.navigationBar setTranslucent:NO];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.font = [UIFont fontWithName:@"IntroRegularCaps" size:24.0];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    self.navigationItem.titleView = label;
    label.text = @"Dashboard";
    [label sizeToFit];
    
}

- (void)viewDidAppear:(BOOL)animated{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.bounds = CGRectMake(_boxOne.frame.origin.x+50, (_boxOne.frame.size.width/2) - (_boxOne.frame.origin.x+50), 50.f, 50.0f);
    shapeLayer.position = CGPointMake(50.f, 50.f);
    shapeLayer.fillColor = [[UIColor redColor] CGColor];
    shapeLayer.path = [[UIBezierPath bezierPathWithOvalInRect:shapeLayer.bounds] CGPath];
    
    [self.view.layer addSublayer:shapeLayer];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"path"];
    animation.fromValue = (__bridge id) [[UIBezierPath bezierPathWithOvalInRect:shapeLayer.bounds] CGPath];
    animation.toValue = (__bridge id) [[UIBezierPath bezierPathWithRect:shapeLayer.bounds] CGPath];
    animation.duration = 2.0;
    animation.autoreverses = YES;
    
    [shapeLayer addAnimation:animation forKey:@"shapeAnimation"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
