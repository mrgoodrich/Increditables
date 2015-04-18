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
@property (strong, nonatomic) CAShapeLayer *shapeLayer;
@property (strong, nonatomic) NSString *grade;
@property int creditScore;
@property (strong, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *greetingMessage;
@property (weak, nonatomic) IBOutlet UILabel *encouragementMessage;
@property (strong, nonatomic) UIFont *IntroRegular;
@property (weak, nonatomic) IBOutlet UILabel *summaryLabel;
@property (weak, nonatomic) IBOutlet UILabel *navigationBarTitle;

@end

@implementation DashboardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _IntroRegular = [UIFont fontWithName:@"IntroRegular" size:16.0];
    
    [_navigationBarTitle setFont:[UIFont fontWithName:@"IntroRegularCaps" size:24.0]];
    [_navigationBarTitle setTextColor:[UIColor whiteColor]];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.font = [UIFont fontWithName:@"IntroRegularCaps" size:16.0];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    self.navigationItem.titleView = label;
    label.text = @"Dashboard";
    [label sizeToFit];
    
    _scoreLabel.font = [UIFont fontWithName:@"IntroRegular" size:64.0];
    _scoreLabel.textColor = [UIColor greenColor];
    
//    _GradeLabel.font = [UIFont fontWithName:@"IntroSemiBoldCaps" size:88.0];
//    _GradeLabel.text = @"B";
    
    _summaryLabel.font = [UIFont fontWithName:@"IntroRegular" size:32.0];
    
    
}

- (void)viewDidAppear:(BOOL)animated{
    _creditScore = 700; //990 is max, 490 is min
    
    _summaryLabel.text = @"Good";
    
    _scoreLabel.text = [NSString stringWithFormat:@"%d",_creditScore];
    
    _encouragementMessage.font = _IntroRegular;
    _encouragementMessage.text = @"You're doing well! Stay strong!";
    
    _greetingMessage.font = _IntroRegular;
    _greetingMessage.text = [NSString stringWithFormat:@"Hello %@, your current credit score is:", @"Alfredo"]; //Set name
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.bounds = CGRectMake(0, 0,(_boxOne.frame.size.width/2) -50, (_boxOne.frame.size.width/2) - 50);
    shapeLayer.position = CGPointMake(_boxOne.frame.origin.x+_boxOne.frame.size.width/4 + 20,_boxOne.frame.origin.y+_boxOne.frame.size.height/2 + 60);
    shapeLayer.path = [[UIBezierPath bezierPathWithOvalInRect:shapeLayer.bounds] CGPath];
    shapeLayer.lineWidth = 30.0;
    shapeLayer.strokeColor = [[UIColor greenColor] CGColor];
    shapeLayer.fillColor = [[UIColor clearColor] CGColor];
    shapeLayer.strokeStart = 0.0f;
    shapeLayer.strokeEnd = (float)((_creditScore-490.0)/500.0)*(.85);
    shapeLayer.transform = CATransform3DMakeRotation(90 * M_PI/180, 0.0, 0.0, 1.0);
    
    [self.view.layer addSublayer:shapeLayer];
    
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration = 2.0f;
    pathAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
    pathAnimation.toValue = [NSNumber numberWithFloat:(float)((_creditScore-490)/500.0)*(.85)];
    pathAnimation.repeatCount = 0;
    pathAnimation.autoreverses = NO;
    [shapeLayer addAnimation:pathAnimation forKey:@"strokeEnd"];
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
