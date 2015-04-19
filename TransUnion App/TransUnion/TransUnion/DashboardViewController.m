//
//  DashboardViewController.m
//  TransUnion
//
//  Created by Matt Goodrich on 4/18/15.
//  Copyright (c) 2015 Increditables. All rights reserved.
//

#import "DashboardViewController.h"
#import "AFNetworking.h"
#import "graphsViewController.h"


@interface DashboardViewController ()
@property (weak, nonatomic) IBOutlet UIView *boxOne;
@property (weak, nonatomic) IBOutlet UIView *boxTwo;
@property (strong, nonatomic) CAShapeLayer *shapeLayer;
@property (strong, nonatomic) NSString *grade;
@property int creditScore;
@property (strong, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *greetingMessage;
@property (weak, nonatomic) IBOutlet UILabel *encouragementMessage;
@property (strong, nonatomic) UIFont *IntroRegular;
@property (weak, nonatomic) IBOutlet UILabel *summaryLabel;
@property (weak, nonatomic) IBOutlet UILabel *navigationBarTitle;
@property (weak, nonatomic) IBOutlet UILabel *breakdownLabel;
@property  (strong,nonatomic) IBOutlet UILabel *positiveLabel;
@property  (strong,nonatomic) IBOutlet UILabel *negativeLabel;
@property BOOL loaded;
@property (weak, nonatomic) IBOutlet UILabel *letterLabel;


@property (strong, nonatomic) NSMutableDictionary *jsonData;

@end

@implementation DashboardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
     
    _IntroRegular = [UIFont fontWithName:@"IntroRegular" size:20.0];
    
    [_navigationBarTitle setFont:[UIFont fontWithName:@"IntroRegularCaps" size:24.0]];
    [_navigationBarTitle setTextColor:[UIColor whiteColor]];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.font = [UIFont fontWithName:@"IntroRegularCaps" size:16.0];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    self.navigationItem.titleView = label;
    label.text = @"Dashboard";
    [label sizeToFit];
    
    _breakdownLabel.font = [UIFont fontWithName:@"IntroRegular" size:40];
    _breakdownLabel.text = @"Here's the Breakdown";
    
    _scoreLabel.font = [UIFont fontWithName:@"IntroRegular" size:64.0];
    _scoreLabel.textColor = [UIColor clearColor];
    
//    _GradeLabel.font = [UIFont fontWithName:@"IntroSemiBoldCaps" size:88.0];
//    _GradeLabel.text = @"B";
    
    _summaryLabel.font = [UIFont fontWithName:@"IntroSemiBold" size:64.0];
    
    _jsonData = [NSMutableDictionary dictionary];
    
    CAScrollLayer *layerScroll = [CAScrollLayer layer];

    [layerScroll setFrame:self.view.frame];
    
    [self.parentViewController.navigationController.navigationBar setHidden:YES];
    
}

- (void)viewDidAppear:(BOOL)animated{
    
    [self.navigationController.navigationBar setHidden:YES];
    
    if (_loaded){
        return;
    }
    _loaded = YES;
    
    //START POST
    NSString *postURL = @"http://104.131.141.95/";
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *parameters = @{};
    [manager POST:postURL parameters:parameters success: ^(AFHTTPRequestOperation *operation, id responseObject) {
        NSMutableDictionary *response = [NSMutableDictionary dictionary];
        [response setValue:responseObject forKey:@"data"];
        for (id key in response){
            NSLog(@"Key: %@, Value: %@", key, [response valueForKey:key]);
        }
        [_letterLabel setText:@"C"];
        [_letterLabel setFont:[UIFont fontWithName:@"IntroRegular" size:64]];
        [_letterLabel setTextColor:[UIColor colorWithRed:169.0/255.0 green:209.0/255.0 blue:97.0/255.0 alpha:1.0]];
        _jsonData = [responseObject mutableCopy];
        
        _creditScore = [[_jsonData valueForKey:@"creditScore"] intValue]; //990 is max, 490 is min
        
        _summaryLabel.text = @"Good";
        
        _scoreLabel.text = [NSString stringWithFormat:@"%d",_creditScore];
        
        _encouragementMessage.font = _IntroRegular;
        
        _greetingMessage.font = _IntroRegular;
        _greetingMessage.text = [NSString stringWithFormat:@"Hello %@, your current credit score is:", [responseObject valueForKey:@"name"]]; //Set name
        
        
        
        
        //Lighter Blue
        CAShapeLayer *lightBlueLayer = [CAShapeLayer layer];
        lightBlueLayer.bounds = CGRectMake(0, 0,(_boxOne.frame.size.width/2) -50, (_boxOne.frame.size.width/2) - 50);
        lightBlueLayer.position = CGPointMake(_boxOne.frame.origin.x+_boxOne.frame.size.width/4 + 20,_boxOne.frame.origin.y+_boxOne.frame.size.height/2 + 60);
        lightBlueLayer.path = [[UIBezierPath bezierPathWithOvalInRect:lightBlueLayer.bounds] CGPath];
        lightBlueLayer.lineWidth = 30.0;
        lightBlueLayer.strokeColor = [[UIColor  colorWithRed:100.0/255.0 green:100.0/255.0 blue:100.0/255.0 alpha:.5] CGColor];
        lightBlueLayer.fillColor = [[UIColor clearColor] CGColor];
        lightBlueLayer.strokeStart = 0.0f;
        lightBlueLayer.strokeEnd = (500.0/500.0)*(.85);
        lightBlueLayer.transform = CATransform3DMakeRotation(90 * M_PI/180, 0.0, 0.0, 1.0);
        
        [self.view.layer addSublayer:lightBlueLayer];
        
        if (_creditScore > 720){
            _summaryLabel.textColor = [UIColor colorWithRed:0.0/255.0 green:166.0/255.0 blue:202.0/255.0 alpha:1.0];
            _summaryLabel.text = @"Great";
            _encouragementMessage.text = @"Perfection!  Keep up the good work!";
            _scoreLabel.textColor = [UIColor colorWithRed:0.0/255.0 green:166.0/255.0 blue:202.0/255.0 alpha:1.0];
            //Blue
            CAShapeLayer *shapeLayer = [CAShapeLayer layer];
            shapeLayer.bounds = CGRectMake(0, 0,(_boxOne.frame.size.width/2) -50, (_boxOne.frame.size.width/2) - 50);
            shapeLayer.position = CGPointMake(_boxOne.frame.origin.x+_boxOne.frame.size.width/4 + 20,_boxOne.frame.origin.y+_boxOne.frame.size.height/2 + 60);
            shapeLayer.path = [[UIBezierPath bezierPathWithOvalInRect:shapeLayer.bounds] CGPath];
            shapeLayer.lineWidth = 30.0;
            shapeLayer.strokeColor = [[UIColor colorWithRed:0.0/255.0 green:166.0/255.0 blue:202.0/255.0 alpha:1.0] CGColor];
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
            
            //max green
            CAShapeLayer *greenLayer = [CAShapeLayer layer];
            greenLayer.bounds = CGRectMake(0, 0,(_boxOne.frame.size.width/2) -50, (_boxOne.frame.size.width/2) - 50);
            greenLayer.position = CGPointMake(_boxOne.frame.origin.x+_boxOne.frame.size.width/4 + 20,_boxOne.frame.origin.y+_boxOne.frame.size.height/2 + 60);
            greenLayer.path = [[UIBezierPath bezierPathWithOvalInRect:shapeLayer.bounds] CGPath];
            greenLayer.lineWidth = 30.0;
            greenLayer.strokeColor = [[UIColor colorWithRed:169.0/255.0 green:209.0/255.0 blue:97.0/255.0 alpha:1.0] CGColor];
            greenLayer.fillColor = [[UIColor clearColor] CGColor];
            greenLayer.strokeStart = 0.0f;
            greenLayer.strokeEnd = (float)((719.0-490.0)/500.0)*(.85);
            greenLayer.transform = CATransform3DMakeRotation(90 * M_PI/180, 0.0, 0.0, 1.0);
            greenLayer.beginTime = 2.0;
            [self.view.layer addSublayer:greenLayer];
            
            CABasicAnimation *greenAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
            greenAnimation.duration = 2.0f;
            greenAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
            greenAnimation.toValue = [NSNumber numberWithFloat:(float)((719.0-490)/500.0)*(.85)];
            greenAnimation.repeatCount = 0;
            greenAnimation.autoreverses = NO;
            [greenLayer addAnimation:greenAnimation forKey:@"strokeEnd"];
            
            //max yellow
            CAShapeLayer *yellowLayer = [CAShapeLayer layer];
            yellowLayer.bounds = CGRectMake(0, 0,(_boxOne.frame.size.width/2) -50, (_boxOne.frame.size.width/2) - 50);
            yellowLayer.position = CGPointMake(_boxOne.frame.origin.x+_boxOne.frame.size.width/4 + 20,_boxOne.frame.origin.y+_boxOne.frame.size.height/2 + 60);
            yellowLayer.path = [[UIBezierPath bezierPathWithOvalInRect:shapeLayer.bounds] CGPath];
            yellowLayer.lineWidth = 30.0;
            yellowLayer.strokeColor = [[UIColor colorWithRed:252.0/255.0 green:216.0/255.0 blue:0.0 alpha:1.0] CGColor];
            yellowLayer.fillColor = [[UIColor clearColor] CGColor];
            yellowLayer.strokeStart = 0.0f;
            yellowLayer.strokeEnd = (float)((639.0-490.0)/500.0)*(.85);
            yellowLayer.transform = CATransform3DMakeRotation(90 * M_PI/180, 0.0, 0.0, 1.0);
            
            [self.view.layer addSublayer:yellowLayer];
            
            CABasicAnimation *yellowAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
            yellowAnimation.duration = 2.0f;
            yellowAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
            yellowAnimation.toValue = [NSNumber numberWithFloat:(float)((639.0-490)/500.0)*(.85)];
            yellowAnimation.repeatCount = 0;
            yellowAnimation.autoreverses = NO;
            [yellowLayer addAnimation:yellowAnimation forKey:@"strokeEnd"];
            
            //Max Red
            CAShapeLayer *redLayer = [CAShapeLayer layer];
            redLayer.bounds = CGRectMake(0, 0,(_boxOne.frame.size.width/2) -50, (_boxOne.frame.size.width/2) - 50);
            redLayer.position = CGPointMake(_boxOne.frame.origin.x+_boxOne.frame.size.width/4 + 20,_boxOne.frame.origin.y+_boxOne.frame.size.height/2 + 60);
            redLayer.path = [[UIBezierPath bezierPathWithOvalInRect:shapeLayer.bounds] CGPath];
            redLayer.lineWidth = 30.0;
            redLayer.strokeColor = [[UIColor colorWithRed:224.0/255.0 green:64.0/255.0 blue:37.0/255.0 alpha:1.0] CGColor];
            redLayer.fillColor = [[UIColor clearColor] CGColor];
            redLayer.strokeStart = 0.0f;
            redLayer.strokeEnd = (float)((589.0-490.0)/500.0)*(.85);
            redLayer.transform = CATransform3DMakeRotation(90 * M_PI/180, 0.0, 0.0, 1.0);
            
            [self.view.layer addSublayer:redLayer];
            
            CABasicAnimation *redAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
            redAnimation.duration = 2.0f;
            redAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
            redAnimation.toValue = [NSNumber numberWithFloat:(float)((589.0-490)/500.0)*(.85)];
            redAnimation.repeatCount = 0;
            redAnimation.autoreverses = NO;
            [redLayer addAnimation:redAnimation forKey:@"strokeEnd"];
        } else if (_creditScore > 639){
            _summaryLabel.textColor = [UIColor colorWithRed:169.0/255.0 green:209.0/255.0 blue:97.0/255.0 alpha:1.0];
            _encouragementMessage.text = @"Nice! You're almost there!";
            _summaryLabel.text = @"Good";
            _scoreLabel.textColor = [UIColor colorWithRed:169.0/255.0 green:209.0/255.0 blue:97.0/255.0 alpha:1.0];
            //partial green
            CAShapeLayer *greenLayer = [CAShapeLayer layer];
            greenLayer.bounds = CGRectMake(0, 0,(_boxOne.frame.size.width/2) -50, (_boxOne.frame.size.width/2) - 50);
            greenLayer.position = CGPointMake(_boxOne.frame.origin.x+_boxOne.frame.size.width/4 + 20,_boxOne.frame.origin.y+_boxOne.frame.size.height/2 + 60);
            greenLayer.path = [[UIBezierPath bezierPathWithOvalInRect:greenLayer.bounds] CGPath];
            greenLayer.lineWidth = 30.0;
            greenLayer.strokeColor = [[UIColor colorWithRed:169.0/255.0 green:209.0/255.0 blue:97.0/255.0 alpha:1.0] CGColor];
            greenLayer.fillColor = [[UIColor clearColor] CGColor];
            greenLayer.strokeStart = 0.0f;
            greenLayer.strokeEnd = (float)((_creditScore-490.0)/500.0)*(.85);
            greenLayer.transform = CATransform3DMakeRotation(90 * M_PI/180, 0.0, 0.0, 1.0);
            greenLayer.beginTime = 2.0;
            [self.view.layer addSublayer:greenLayer];
            
            CABasicAnimation *greenAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
            greenAnimation.duration = 2.0f;
            greenAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
            greenAnimation.toValue = [NSNumber numberWithFloat:(float)((_creditScore-490)/500.0)*(.85)];
            greenAnimation.repeatCount = 0;
            greenAnimation.autoreverses = NO;
            [greenLayer addAnimation:greenAnimation forKey:@"strokeEnd"];
            
            //max yellow
            CAShapeLayer *yellowLayer = [CAShapeLayer layer];
            yellowLayer.bounds = CGRectMake(0, 0,(_boxOne.frame.size.width/2) -50, (_boxOne.frame.size.width/2) - 50);
            yellowLayer.position = CGPointMake(_boxOne.frame.origin.x+_boxOne.frame.size.width/4 + 20,_boxOne.frame.origin.y+_boxOne.frame.size.height/2 + 60);
            yellowLayer.path = [[UIBezierPath bezierPathWithOvalInRect:yellowLayer.bounds] CGPath];
            yellowLayer.lineWidth = 30.0;
            yellowLayer.strokeColor = [[UIColor colorWithRed:252.0/255.0 green:216.0/255.0 blue:0.0 alpha:1.0] CGColor];
            yellowLayer.fillColor = [[UIColor clearColor] CGColor];
            yellowLayer.strokeStart = 0.0f;
            yellowLayer.strokeEnd = (float)((639.0-490.0)/500.0)*(.85);
            yellowLayer.transform = CATransform3DMakeRotation(90 * M_PI/180, 0.0, 0.0, 1.0);
            
            [self.view.layer addSublayer:yellowLayer];
            
            CABasicAnimation *yellowAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
            yellowAnimation.duration = 2.0f;
            yellowAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
            yellowAnimation.toValue = [NSNumber numberWithFloat:(float)((639.0-490)/500.0)*(.85)];
            yellowAnimation.repeatCount = 0;
            yellowAnimation.autoreverses = NO;
            [yellowLayer addAnimation:yellowAnimation forKey:@"strokeEnd"];
            
            //Max Red
            CAShapeLayer *redLayer = [CAShapeLayer layer];
            redLayer.bounds = CGRectMake(0, 0,(_boxOne.frame.size.width/2) -50, (_boxOne.frame.size.width/2) - 50);
            redLayer.position = CGPointMake(_boxOne.frame.origin.x+_boxOne.frame.size.width/4 + 20,_boxOne.frame.origin.y+_boxOne.frame.size.height/2 + 60);
            redLayer.path = [[UIBezierPath bezierPathWithOvalInRect:redLayer.bounds] CGPath];
            redLayer.lineWidth = 30.0;
            redLayer.strokeColor = [[UIColor colorWithRed:224.0/255.0 green:64.0/255.0 blue:37.0/255.0 alpha:1.0] CGColor];
            redLayer.fillColor = [[UIColor clearColor] CGColor];
            redLayer.strokeStart = 0.0f;
            redLayer.strokeEnd = (float)((589.0-490.0)/500.0)*(.85);
            redLayer.transform = CATransform3DMakeRotation(90 * M_PI/180, 0.0, 0.0, 1.0);
            
            [self.view.layer addSublayer:redLayer];
            
            CABasicAnimation *redAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
            redAnimation.duration = 2.0f;
            redAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
            redAnimation.toValue = [NSNumber numberWithFloat:(float)((589.0-490)/500.0)*(.85)];
            redAnimation.repeatCount = 0;
            redAnimation.autoreverses = NO;
            [redLayer addAnimation:redAnimation forKey:@"strokeEnd"];
        } else if (_creditScore > 589){
            _summaryLabel.text = @"Not Bad";
            _summaryLabel.textColor = [UIColor colorWithRed:252.0/255.0 green:216.0/255.0 blue:0.0 alpha:1.0];
            _encouragementMessage.text = @"Eh.. You're better than this!";
            _scoreLabel.textColor = [UIColor colorWithRed:252.0/255.0 green:216.0/255.0 blue:0.0 alpha:1.0];
            //partial yellow
            CAShapeLayer *yellowLayer = [CAShapeLayer layer];
            yellowLayer.bounds = CGRectMake(0, 0,(_boxOne.frame.size.width/2) -50, (_boxOne.frame.size.width/2) - 50);
            yellowLayer.position = CGPointMake(_boxOne.frame.origin.x+_boxOne.frame.size.width/4 + 20,_boxOne.frame.origin.y+_boxOne.frame.size.height/2 + 60);
            yellowLayer.path = [[UIBezierPath bezierPathWithOvalInRect:yellowLayer.bounds] CGPath];
            yellowLayer.lineWidth = 30.0;
            yellowLayer.strokeColor = [[UIColor colorWithRed:252.0/255.0 green:216.0/255.0 blue:0.0 alpha:1.0] CGColor];
            yellowLayer.fillColor = [[UIColor clearColor] CGColor];
            yellowLayer.strokeStart = 0.0f;
            yellowLayer.strokeEnd = (float)((_creditScore-490.0)/500.0)*(.85);
            yellowLayer.transform = CATransform3DMakeRotation(90 * M_PI/180, 0.0, 0.0, 1.0);
            
            [self.view.layer addSublayer:yellowLayer];
            
            CABasicAnimation *yellowAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
            yellowAnimation.duration = 2.0f;
            yellowAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
            yellowAnimation.toValue = [NSNumber numberWithFloat:(float)((_creditScore-490)/500.0)*(.85)];
            yellowAnimation.repeatCount = 0;
            yellowAnimation.autoreverses = NO;
            [yellowLayer addAnimation:yellowAnimation forKey:@"strokeEnd"];
            
            //Max Red
            CAShapeLayer *redLayer = [CAShapeLayer layer];
            redLayer.bounds = CGRectMake(0, 0,(_boxOne.frame.size.width/2) -50, (_boxOne.frame.size.width/2) - 50);
            redLayer.position = CGPointMake(_boxOne.frame.origin.x+_boxOne.frame.size.width/4 + 20,_boxOne.frame.origin.y+_boxOne.frame.size.height/2 + 60);
            redLayer.path = [[UIBezierPath bezierPathWithOvalInRect:redLayer.bounds] CGPath];
            redLayer.lineWidth = 30.0;
            redLayer.strokeColor = [[UIColor colorWithRed:224.0/255.0 green:64.0/255.0 blue:37.0/255.0 alpha:1.0] CGColor];
            redLayer.fillColor = [[UIColor clearColor] CGColor];
            redLayer.strokeStart = 0.0f;
            redLayer.strokeEnd = (float)((589.0-490.0)/500.0)*(.85);
            redLayer.transform = CATransform3DMakeRotation(90 * M_PI/180, 0.0, 0.0, 1.0);
            
            [self.view.layer addSublayer:redLayer];
            
            CABasicAnimation *redAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
            redAnimation.duration = 2.0f;
            redAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
            redAnimation.toValue = [NSNumber numberWithFloat:(float)((589.0-490)/500.0)*(.85)];
            redAnimation.repeatCount = 0;
            redAnimation.autoreverses = NO;
            [redLayer addAnimation:redAnimation forKey:@"strokeEnd"];
        } else {
            _encouragementMessage.text = @"Ouch! Your score could use some love!";
            _summaryLabel.text = @"Poor";
            _summaryLabel.textColor = [UIColor colorWithRed:224.0/255.0 green:64.0/255.0 blue:37.0/255.0 alpha:1.0];
            _scoreLabel.textColor = [UIColor colorWithRed:224.0/255.0 green:64.0/255.0 blue:37.0/255.0 alpha:1.0];
            //Max Red
            CAShapeLayer *redLayer = [CAShapeLayer layer];
            redLayer.bounds = CGRectMake(0, 0,(_boxOne.frame.size.width/2) -50, (_boxOne.frame.size.width/2) - 50);
            redLayer.position = CGPointMake(_boxOne.frame.origin.x+_boxOne.frame.size.width/4 + 20,_boxOne.frame.origin.y+_boxOne.frame.size.height/2 + 60);
            redLayer.path = [[UIBezierPath bezierPathWithOvalInRect:redLayer.bounds] CGPath];
            redLayer.lineWidth = 30.0;
            redLayer.strokeColor = [[UIColor colorWithRed:224.0/255.0 green:64.0/255.0 blue:37.0/255.0 alpha:1.0] CGColor];
            redLayer.fillColor = [[UIColor clearColor] CGColor];
            redLayer.strokeStart = 0.0f;
            redLayer.strokeEnd = (float)((_creditScore-490.0)/500.0)*(.85);
            redLayer.transform = CATransform3DMakeRotation(90 * M_PI/180, 0.0, 0.0, 1.0);
            
            [self.view.layer addSublayer:redLayer];
            
            CABasicAnimation *redAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
            redAnimation.duration = 2.0f;
            redAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
            redAnimation.toValue = [NSNumber numberWithFloat:(float)((_creditScore-490)/500.0)*(.85)];
            redAnimation.repeatCount = 0;
            redAnimation.autoreverses = NO;
            [redLayer addAnimation:redAnimation forKey:@"strokeEnd"];
        }
        //TOP
        //*******************
        //BOTTOM
        
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.bounds = CGRectMake(0, 0, _boxTwo.frame.size.width/3,_boxTwo.frame.size.width/3);
        shapeLayer.position = CGPointMake(_boxTwo.frame.origin.x+_boxTwo.frame.size.width/4 + 20,_boxTwo.frame.origin.y+_boxTwo.frame.size.height/2 + 260);
        shapeLayer.path = [[UIBezierPath bezierPathWithOvalInRect:shapeLayer.bounds] CGPath];
        shapeLayer.lineWidth = 20.0;
        shapeLayer.strokeColor = [[UIColor colorWithRed:169.0/255.0 green:209.0/255.0 blue:97.0/255.0 alpha:1.0] CGColor];
        shapeLayer.fillColor = [[UIColor colorWithRed:169.0/255.0 green:209.0/255.0 blue:97.0/255.0 alpha:.5] CGColor];
        shapeLayer.strokeStart = 0.0f;
        shapeLayer.strokeEnd = 1.0f;
        shapeLayer.transform = CATransform3DMakeRotation(90 * M_PI/180, 0.0, 0.0, 1.0);
        
        [self.view.layer addSublayer:shapeLayer];
        
        CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
        pathAnimation.duration = 2.0f;
        pathAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
        pathAnimation.toValue = [NSNumber numberWithFloat:1.0f];
        pathAnimation.repeatCount = 0;
        pathAnimation.autoreverses = NO;
        [shapeLayer addAnimation:pathAnimation forKey:@"strokeEnd"];
        
        
        CAShapeLayer *rightShape = [CAShapeLayer layer];
        rightShape.bounds = CGRectMake(0, 0, _boxTwo.frame.size.width/3,_boxTwo.frame.size.width/3);
        rightShape.position = CGPointMake(_boxTwo.frame.origin.x+(3* _boxTwo.frame.size.width)/4 + 20-40,_boxTwo.frame.origin.y+_boxTwo.frame.size.height/2 + 260);
        rightShape.path = [[UIBezierPath bezierPathWithOvalInRect:shapeLayer.bounds] CGPath];
        rightShape.lineWidth = 20.0;
        rightShape.strokeColor = [[UIColor colorWithRed:224.0/255.0 green:64.0/255.0 blue:37.0/255.0 alpha:1.0] CGColor];
        rightShape.fillColor = [[UIColor colorWithRed:224.0/255.0 green:64.0/255.0 blue:37.0/255.0 alpha:.5] CGColor];
        rightShape.strokeStart = 0.0f;
        rightShape.strokeEnd = 1.0f;
        rightShape.transform = CATransform3DMakeRotation(90 * M_PI/180, 0.0, 0.0, 1.0);
        
        [self.view.layer addSublayer:rightShape];
        
        CABasicAnimation *rightAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
        rightAnimation.duration = 2.0f;
        rightAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
        rightAnimation.toValue = [NSNumber numberWithFloat:1.0f];
        rightAnimation.repeatCount = 0;
        rightAnimation.autoreverses = NO;
        [rightShape addAnimation:rightAnimation forKey:@"strokeEnd"];
        
        
        _positiveLabel.font = [UIFont fontWithName:@"IntroRegular" size:50.0];
        _positiveLabel.textColor = [UIColor colorWithRed:169.0/255.0 green:209.0/255.0 blue:97.0/255.0 alpha:1.0];
        _positiveLabel.text = [NSString stringWithFormat:@"+%@",[_jsonData valueForKey:@"goodScore"]];
        
        _negativeLabel.font = [UIFont fontWithName:@"IntroRegular" size:50.0];
        _negativeLabel.textColor = [UIColor colorWithRed:224.0/255.0 green:64.0/255.0 blue:37.0/255.0 alpha:1.0];
        _negativeLabel.text = [NSString stringWithFormat:@"+%@",[_jsonData valueForKey:@"badScore"]];
        
        
        
    } failure: ^(AFHTTPRequestOperation *operation, NSError *error) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Connection Error" message:@"Unable to Reach the Verification Server!" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Okay, I Will Retry Soon", nil];
        [alert show];
    }];
    //END POST
}



- (IBAction)hurtButton:(id)sender {
    
}

- (IBAction)boostButton:(id)sender {
    
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    graphsViewController *gvc = (graphsViewController *)segue.destinationViewController;
    gvc.jsonData = self.jsonData;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
