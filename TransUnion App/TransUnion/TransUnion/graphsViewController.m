//
//  graphsViewController.m
//  TransUnion
//
//  Created by Matt Goodrich on 4/18/15.
//  Copyright (c) 2015 Increditables. All rights reserved.
//

#import "graphsViewController.h"
#import "PaymentGoodTableViewController.h"

@interface graphsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *pointsLabel;
@property (strong,nonatomic) UIFont *IntroRegular;
@property (weak, nonatomic) IBOutlet UILabel *paymentsOnTime;
@property (weak, nonatomic) IBOutlet UILabel *creditUsageGood;
@property (weak, nonatomic) IBOutlet UILabel *creditUsageDesc;
@property (weak, nonatomic) IBOutlet UILabel *lowAccountBalGood;
@property (weak, nonatomic) IBOutlet UILabel *lowAccountBalDesc;
@property (weak, nonatomic) IBOutlet UILabel *accountLengthGood;
@property (weak, nonatomic) IBOutlet UILabel *accountLengthGoodDesc;
@property (weak, nonatomic) IBOutlet UILabel *numInquirBad;
@property (weak, nonatomic) IBOutlet UILabel *numInquirBadDesc;
@property (weak, nonatomic) IBOutlet UILabel *publicRecordsBadData;
@property (weak, nonatomic) IBOutlet UILabel *publicRecordsDesc;
@property (weak, nonatomic) IBOutlet UILabel *balancePaidBadData;
@property (weak, nonatomic) IBOutlet UILabel *balancePaidBadDataDesc;
@property (weak, nonatomic) IBOutlet UIView *topView;


@end

@implementation graphsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self.parentViewController.navigationController.navigationBar setHidden:YES];
    
    
    _IntroRegular = [UIFont fontWithName:@"IntroRegular" size:40.0];
    
    _pointsLabel.font = _IntroRegular;
    _pointsLabel.textColor = [UIColor colorWithRed:169.0/255.0 green:209.0/255.0 blue:97.0/255.0 alpha:1.0];
    _pointsLabel.text = [[_jsonData valueForKey:@"accountPaymentGoodData"] valueForKey:@"value"];
    
    _paymentsOnTime.font = [UIFont fontWithName:@"IntroRegular" size:20.0];
    
    
    _creditUsageGood.text = [[_jsonData valueForKey:@"creditUsageGoodInfoData"] valueForKey:@"value"];
    _creditUsageGood.font = _IntroRegular;
    _creditUsageGood.textColor = [UIColor colorWithRed:169.0/255.0 green:209.0/255.0 blue:97.0/255.0 alpha:1.0];
    
    
    _creditUsageDesc.font = [UIFont fontWithName:@"IntroRegular" size:20.0];
    
    _lowAccountBalGood.text = [[_jsonData valueForKey:@"balancePaidGoodInfoData"] valueForKey:@"value"];
    _lowAccountBalGood.font = _IntroRegular;
    _lowAccountBalGood.textColor = [UIColor colorWithRed:169.0/255.0 green:209.0/255.0 blue:97.0/255.0 alpha:1.0];
    
    _lowAccountBalDesc.font = [UIFont fontWithName:@"IntroRegular" size:20.0];
    
    _accountLengthGood.text = [[_jsonData valueForKey:@"accountLengthGoodData"] valueForKey:@"value"];
    _accountLengthGood.font = _IntroRegular;
    _accountLengthGood.textColor = [UIColor colorWithRed:169.0/255.0 green:209.0/255.0 blue:97.0/255.0 alpha:1.0];
    
    _accountLengthGoodDesc.font = [UIFont fontWithName:@"IntroRegular" size:20.0];
    
    _numInquirBad.text = [[_jsonData valueForKey:@"numOfInquiriesBadData"] valueForKey:@"value"];
    _numInquirBad.font = _IntroRegular;
    _numInquirBad.textColor = [UIColor colorWithRed:224.0/255.0 green:64.0/255.0 blue:37.0/255.0 alpha:1.0];
    
    _numInquirBadDesc.font = [UIFont fontWithName:@"IntroRegular" size:20.0];
    
    _publicRecordsBadData.text = [[_jsonData valueForKey:@"publicRecordsBadData"] valueForKey:@"value"];
    _publicRecordsBadData.font = _IntroRegular;
    _publicRecordsBadData.textColor = [UIColor colorWithRed:224.0/255.0 green:64.0/255.0 blue:37.0/255.0 alpha:1.0];
    
    _publicRecordsDesc.font = [UIFont fontWithName:@"IntroRegular" size:20.0];
    
    _balancePaidBadData.text = [[_jsonData valueForKey:@"balancePaidBadData"] valueForKey:@"value"];
    _balancePaidBadData.font = _IntroRegular;
    _balancePaidBadData.textColor = [UIColor colorWithRed:224.0/255.0 green:64.0/255.0 blue:37.0/255.0 alpha:1.0];
    
    _balancePaidBadDataDesc.font = [UIFont fontWithName:@"IntroRegular" size:20.0];
    
    
    
    //Left green top
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.bounds = CGRectMake(0,0,self.view.frame.size.width/6, self.view.frame.size.width/6);
    shapeLayer.position = CGPointMake(160,140);
    shapeLayer.path = [[UIBezierPath bezierPathWithOvalInRect:shapeLayer.bounds] CGPath];
    shapeLayer.lineWidth = 30.0;
    shapeLayer.strokeColor = [[UIColor colorWithRed:169.0/255.0 green:209.0/255.0 blue:97.0/255.0 alpha:1.0] CGColor];
    shapeLayer.fillColor = [[UIColor clearColor] CGColor];
    shapeLayer.strokeStart = 0.0f;
    shapeLayer.strokeEnd = (float)(([[[_jsonData valueForKey:@"accountPaymentGoodData"] valueForKey:@"percentage"] intValue])/100.0);
    shapeLayer.transform = CATransform3DMakeRotation(90 * M_PI/180, 0.0, 0.0, 1.0);
    
    [self.view.layer addSublayer:shapeLayer];
    
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration = 2.0f;
    pathAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
    pathAnimation.toValue = [NSNumber numberWithFloat:(float)(([[[_jsonData valueForKey:@"accountPaymentGoodData"] valueForKey:@"percentage"] intValue])/100.0)];
    pathAnimation.repeatCount = 0;
    pathAnimation.autoreverses = NO;
    [shapeLayer addAnimation:pathAnimation forKey:@"strokeEnd"];
    
    //down 1 green top
    CAShapeLayer *greenTwo = [CAShapeLayer layer];
    greenTwo.bounds = CGRectMake(0,0,self.view.frame.size.width/6, self.view.frame.size.width/6);
    greenTwo.position = CGPointMake(160,310);
    greenTwo.path = [[UIBezierPath bezierPathWithOvalInRect:shapeLayer.bounds] CGPath];
    greenTwo.lineWidth = 30.0;
    greenTwo.strokeColor = [[UIColor colorWithRed:169.0/255.0 green:209.0/255.0 blue:97.0/255.0 alpha:1.0] CGColor];
    greenTwo.fillColor = [[UIColor clearColor] CGColor];
    greenTwo.strokeStart = 0.0f;
    greenTwo.strokeEnd = (float)(([[[_jsonData valueForKey:@"creditUsageGoodInfoData"] valueForKey:@"percentage"] intValue])/100.0);
    greenTwo.transform = CATransform3DMakeRotation(90 * M_PI/180, 0.0, 0.0, 1.0);
    
    [self.view.layer addSublayer:greenTwo];
    
    CABasicAnimation *greenAnim = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    greenAnim.duration = 2.0f;
    greenAnim.fromValue = [NSNumber numberWithFloat:0.0f];
    greenAnim.toValue = [NSNumber numberWithFloat:(float)(([[[_jsonData valueForKey:@"creditUsageGoodInfoData"] valueForKey:@"percentage"] intValue])/100.0)];
    greenAnim.repeatCount = 0;
    greenAnim.autoreverses = NO;
    [greenTwo addAnimation:greenAnim forKey:@"strokeEnd"];
    
    //down 2 green top
    CAShapeLayer *greenThree = [CAShapeLayer layer];
    greenThree.bounds = CGRectMake(0,0,self.view.frame.size.width/6, self.view.frame.size.width/6);
    greenThree.position = CGPointMake(160,505);
    greenThree.path = [[UIBezierPath bezierPathWithOvalInRect:shapeLayer.bounds] CGPath];
    greenThree.lineWidth = 30.0;
    greenThree.strokeColor = [[UIColor colorWithRed:169.0/255.0 green:209.0/255.0 blue:97.0/255.0 alpha:1.0] CGColor];
    greenThree.fillColor = [[UIColor clearColor] CGColor];
    greenThree.strokeStart = 0.0f;
    greenThree.strokeEnd = (float)(([[[_jsonData valueForKey:@"balancePaidGoodInfoData"] valueForKey:@"percentage"] intValue])/100.0);
    greenThree.transform = CATransform3DMakeRotation(90 * M_PI/180, 0.0, 0.0, 1.0);
    
    [self.view.layer addSublayer:greenThree];
    
    CABasicAnimation *greenAnimTwo = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    greenAnimTwo.duration = 2.0f;
    greenAnimTwo.fromValue = [NSNumber numberWithFloat:0.0f];
    greenAnimTwo.toValue = [NSNumber numberWithFloat:(float)(([[[_jsonData valueForKey:@"balancePaidGoodInfoData"] valueForKey:@"percentage"] intValue])/100.0)];
    greenAnimTwo.repeatCount = 0;
    greenAnimTwo.autoreverses = NO;
    [greenThree addAnimation:greenAnimTwo forKey:@"strokeEnd"];
    
    //down 3 green top
    CAShapeLayer *greenFour = [CAShapeLayer layer];
    greenFour.bounds = CGRectMake(0,0,self.view.frame.size.width/6, self.view.frame.size.width/6);
    greenFour.position = CGPointMake(160,700);
    greenFour.path = [[UIBezierPath bezierPathWithOvalInRect:shapeLayer.bounds] CGPath];
    greenFour.lineWidth = 30.0;
    greenFour.strokeColor = [[UIColor colorWithRed:169.0/255.0 green:209.0/255.0 blue:97.0/255.0 alpha:1.0] CGColor];
    greenFour.fillColor = [[UIColor clearColor] CGColor];
    greenFour.strokeStart = 0.0f;
    greenFour.strokeEnd = (float)(([[[_jsonData valueForKey:@"accountLengthGoodData"] valueForKey:@"percentage"] intValue])/100.0);
    greenFour.transform = CATransform3DMakeRotation(90 * M_PI/180, 0.0, 0.0, 1.0);
    
    [self.view.layer addSublayer:greenFour];
    
    CABasicAnimation *greenAnimThree = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    greenAnimThree.duration = 2.0f;
    greenAnimThree.fromValue = [NSNumber numberWithFloat:0.0f];
    greenAnimThree.toValue = [NSNumber numberWithFloat:(float)(([[[_jsonData valueForKey:@"accountLengthGoodData"] valueForKey:@"percentage"] intValue])/100.0)];
    greenAnimThree.repeatCount = 0;
    greenAnimThree.autoreverses = NO;
    [greenFour addAnimation:greenAnimThree forKey:@"strokeEnd"];
    
    //Right red two
    CAShapeLayer *redTop = [CAShapeLayer layer];
    redTop.bounds = CGRectMake(0,0,self.view.frame.size.width/6, self.view.frame.size.width/6);
    redTop.position = CGPointMake(460,200);
    redTop.path = [[UIBezierPath bezierPathWithOvalInRect:shapeLayer.bounds] CGPath];
    redTop.lineWidth = 30.0;
    redTop.strokeColor = [[UIColor colorWithRed:224.0/255.0 green:64.0/255.0 blue:37.0/255.0 alpha:1.0] CGColor];
    redTop.fillColor = [[UIColor clearColor] CGColor];
    redTop.strokeStart = 0.0f;
    redTop.strokeEnd = (float)(([[[_jsonData valueForKey:@"numOfInquiriesBadData"] valueForKey:@"percentage"] intValue])/100.0);
    redTop.transform = CATransform3DMakeRotation(90 * M_PI/180, 0.0, 0.0, 1.0);
    
    [self.view.layer addSublayer:redTop];
    
    CABasicAnimation *redTopAnim = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    redTopAnim.duration = 2.0f;
    redTopAnim.fromValue = [NSNumber numberWithFloat:0.0f];
    redTopAnim.toValue = [NSNumber numberWithFloat:(float)(([[[_jsonData valueForKey:@"numOfInquiriesBadData"] valueForKey:@"percentage"] intValue])/100.0)];
    redTopAnim.repeatCount = 0;
    redTopAnim.autoreverses = NO;
    [redTop addAnimation:redTopAnim forKey:@"strokeEnd"];
    
    
    CAShapeLayer *redTopTwo = [CAShapeLayer layer];
    redTopTwo.bounds = CGRectMake(0,0,self.view.frame.size.width/6, self.view.frame.size.width/6);
    redTopTwo.position = CGPointMake(460,400);
    redTopTwo.path = [[UIBezierPath bezierPathWithOvalInRect:shapeLayer.bounds] CGPath];
    redTopTwo.lineWidth = 30.0;
    redTopTwo.strokeColor = [[UIColor colorWithRed:224.0/255.0 green:64.0/255.0 blue:37.0/255.0 alpha:1.0] CGColor];
    redTopTwo.fillColor = [[UIColor clearColor] CGColor];
    redTopTwo.strokeStart = 0.0f;
    redTopTwo.strokeEnd = (float)(([[[_jsonData valueForKey:@"publicRecordsBadData"] valueForKey:@"percentage"] intValue])/100.0);
    redTopTwo.transform = CATransform3DMakeRotation(90 * M_PI/180, 0.0, 0.0, 1.0);
    
    [self.view.layer addSublayer:redTopTwo];
    
    CABasicAnimation *redTopAnimTwo = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    redTopAnimTwo.duration = 2.0f;
    redTopAnimTwo.fromValue = [NSNumber numberWithFloat:0.0f];
    redTopAnimTwo.toValue = [NSNumber numberWithFloat:(float)(([[[_jsonData valueForKey:@"publicRecordsBadData"] valueForKey:@"percentage"] intValue])/100.0)];
    redTopAnimTwo.repeatCount = 0;
    redTopAnimTwo.autoreverses = NO;
    [redTopTwo addAnimation:redTopAnimTwo forKey:@"strokeEnd"];
    
    
    CAShapeLayer *redTopThree = [CAShapeLayer layer];
    redTopThree.bounds = CGRectMake(0,0,self.view.frame.size.width/6, self.view.frame.size.width/6);
    redTopThree.position = CGPointMake(460,650);
    redTopThree.path = [[UIBezierPath bezierPathWithOvalInRect:shapeLayer.bounds] CGPath];
    redTopThree.lineWidth = 30.0;
    redTopThree.strokeColor = [[UIColor colorWithRed:224.0/255.0 green:64.0/255.0 blue:37.0/255.0 alpha:1.0] CGColor];
    redTopThree.fillColor = [[UIColor clearColor] CGColor];
    redTopThree.strokeStart = 0.0f;
    redTopThree.strokeEnd = (float)(([[[_jsonData valueForKey:@"balancePaidBadData"] valueForKey:@"percentage"] intValue])/100.0);
    redTopThree.transform = CATransform3DMakeRotation(90 * M_PI/180, 0.0, 0.0, 1.0);
    
    [self.view.layer addSublayer:redTopThree];
    
    CABasicAnimation *redTopAnimThree = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    redTopAnimThree.duration = 2.0f;
    redTopAnimThree.fromValue = [NSNumber numberWithFloat:0.0f];
    redTopAnimThree.toValue = [NSNumber numberWithFloat:(float)(([[[_jsonData valueForKey:@"balancePaidBadData"] valueForKey:@"percentage"] intValue])/100.0)];
    redTopAnimThree.repeatCount = 0;
    redTopAnimThree.autoreverses = NO;
    [redTopThree addAnimation:redTopAnimThree forKey:@"strokeEnd"];

    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)backButton:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)paymentGoodButton:(id)sender {
    
}

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    PaymentGoodTableViewController *pgtvc = (PaymentGoodTableViewController *)segue.destinationViewController;
    pgtvc.paymentHistory = [_jsonData valueForKey:@"accountPaymentGoodInfo"];
}


@end
