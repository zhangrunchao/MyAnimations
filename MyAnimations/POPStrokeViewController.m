//
//  POPStrokeViewController.m
//  MyAnimations
//
//  Created by 张润潮 on 2017/1/9.
//  Copyright © 2017年 zrc. All rights reserved.
//

#import "POPStrokeViewController.h"

@interface POPStrokeViewController ()
@property(nonatomic,strong) GCDTimer    *timer;
@property(nonatomic,strong) CAShapeLayer    *layer;
@end

@implementation POPStrokeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    CGFloat lineWidth = 3.0;
    CGFloat radius    = 50;
    
    self.layer = [CAShapeLayer layer];
    self.layer.lineWidth = 3.f;
    self.layer.lineCap = kCALineCapRound;
    self.layer.cornerRadius = radius;
    self.layer.bounds = CGRectMake(0, 0, (radius+lineWidth)*2, (radius+lineWidth)*2);
    self.layer.position = self.view.center;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(lineWidth + radius, lineWidth+radius) radius:radius startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    path.lineWidth = lineWidth;
    self.layer.path = [path CGPath];
    self.layer.fillColor = [UIColor clearColor].CGColor;
    [self.view.layer addSublayer:self.layer];
    
    self.timer = [[GCDTimer alloc] initInQueue: [GCDQueue mainQueue]];
    [self.timer event:^{
        
        CGFloat value1 = arc4random() % 101 / 100.0f;
        CGFloat value2 = arc4random() % 101 / 100.0f;
        
        POPSpringAnimation *strokeStartAnim = [POPSpringAnimation animationWithPropertyNamed:kPOPShapeLayerStrokeStart];
        strokeStartAnim.toValue =@(value1>value2?value2:value1);
        strokeStartAnim.springBounciness = 15.f;
        [self.layer pop_addAnimation:strokeStartAnim forKey:@"start"];
        
        POPSpringAnimation *strokeEndAnim = [POPSpringAnimation animationWithPropertyNamed:kPOPShapeLayerStrokeEnd];
        strokeEndAnim.toValue =@(value1<value2?value2:value1);
        strokeEndAnim.springBounciness = 15.f;
        [self.layer pop_addAnimation:strokeEndAnim forKey:@"end"];
        
        
        POPSpringAnimation *bgAnim = [POPSpringAnimation animationWithPropertyNamed:kPOPShapeLayerStrokeColor];
        bgAnim.toValue = (__bridge id)([self randomColor].CGColor);
        [self.layer pop_addAnimation:bgAnim forKey:@"bg"];
    
    
    } timeIntervalWithSecs:1];

    [self.timer start];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIColor *)randomColor {
    
    return [UIColor colorWithRed:arc4random() % 101 / 100.f
                           green:arc4random() % 101 / 100.f
                            blue:arc4random() % 101 / 100.f
                           alpha:1];
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
