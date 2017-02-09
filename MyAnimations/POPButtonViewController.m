//
//  POPButtonViewController.m
//  MyAnimations
//
//  Created by 张润潮 on 2017/1/5.
//  Copyright © 2017年 zrc. All rights reserved.
//

#import "POPButtonViewController.h"
#import "Math.h"

@interface POPButtonViewController ()
@property(nonatomic,strong) UIImageView     *normalImageView;
@property(nonatomic,strong) UIImageView     *blurImageView;
@property(nonatomic,strong) UIButton        *centerButton;
@property(nonatomic,strong) UILabel         *centerLabel;
@property(nonatomic,strong) CAShapeLayer    *circle1;
@property(nonatomic,strong) Math            *math;

@end

@implementation POPButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.math = [Math mathOnceLinearEquationWithPointA:MATHPointMake(0, 1) PointB:MATHPointMake(1, 0.9)];
    
    UIImage *image =[UIImage imageNamed:@"5"];
    self.normalImageView = [[UIImageView alloc] initWithImage:image];
    self.normalImageView.frame = self.view.bounds;
    self.normalImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:self.normalImageView];
    
    self.blurImageView = [[UIImageView alloc] initWithFrame:self.normalImageView.frame];
    self.blurImageView.image = [image blurImage];
    [self.view addSubview:self.blurImageView];

    self.centerButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    self.centerButton.backgroundColor = [UIColor whiteColor];
    self.centerButton.center = self.view.center;
    self.centerButton.layer.cornerRadius = 50;
    [self.view addSubview:self.centerButton];
    
    
    self.centerLabel = [[UILabel alloc] initWithFrame:self.centerButton.bounds];
    [self.centerButton addSubview:self.centerLabel];
    self.centerLabel.textAlignment = NSTextAlignmentCenter;
    self.centerLabel.font = [UIFont HeitiSCWithFontSize:30];
    self.centerLabel.text = @"0%";
    
    //按住Button
    [self.centerButton addTarget:self action:@selector(scaleToSmall) forControlEvents:UIControlEventTouchDown | UIControlEventTouchDragEnter];
    //松开Button
    [self.centerButton addTarget:self action:@selector(scaleToNormal) forControlEvents:UIControlEventTouchUpInside];
    
    //按住后 拖拽离开Button
    [self.centerButton addTarget:self action:@selector(scaleToDefault) forControlEvents:UIControlEventTouchDragExit];

    
    //圆环图层
    {
        self.circle1 = [CAShapeLayer layer];
        self.circle1.strokeEnd = 0;
        CGFloat lineWidth = .5;
        CGFloat radius = 50;
        self.circle1.bounds = CGRectMake(0, 0, (radius + lineWidth)*2, (radius + lineWidth)*2);
        self.circle1.lineWidth = lineWidth;
        self.circle1.position = self.centerButton.center;
        UIBezierPath *circlePath1 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(radius+lineWidth, radius+lineWidth) radius:radius startAngle:0 endAngle:M_PI*2 clockwise:YES];
        self.circle1.path = circlePath1.CGPath;
        self.circle1.strokeColor = [UIColor whiteColor].CGColor;
        self.circle1.fillColor = [UIColor clearColor].CGColor;
        [self.view.layer addSublayer:self.circle1];
       
    
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)scaleToSmall{
    [self.centerButton.layer pop_removeAllAnimations];
    
    POPBasicAnimation *scaleAnim = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    scaleAnim.toValue = [NSValue valueWithCGSize:CGSizeMake(.9, .9)];
    scaleAnim.delegate = self;
    scaleAnim.duration = .8;
    [self.centerButton.layer pop_addAnimation:scaleAnim forKey:@"scale"];
    
    POPSpringAnimation *springAnim = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerBackgroundColor];
    springAnim.toValue = (id)[UIColor blackColor].CGColor;
    [self.centerButton.layer pop_addAnimation:springAnim forKey:@"bgColor" ];
    
}
-(void)scaleToNormal{
    [self.centerButton.layer pop_removeAllAnimations];
    
    POPBasicAnimation *scaleAnim = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    scaleAnim.toValue = [NSValue valueWithCGSize:CGSizeMake(1, 1)];
    scaleAnim.delegate = self;
    [self.centerButton.layer pop_addAnimation:scaleAnim forKey:@"scale"];
    
    
    POPSpringAnimation *springAnim = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerBackgroundColor];
    springAnim.toValue = (id)[UIColor whiteColor].CGColor;
    [self.centerButton.layer pop_addAnimation:springAnim forKey:@"bgcolor"];
    
}
-(void)scaleToDefault{
    
    
}
- (void)pop_animationDidStart:(POPAnimation *)anim {
    
    NSLog(@"pop_animationDidStart %@", anim);
}
- (void)pop_animationDidReachToValue:(POPAnimation *)anim {
    
    NSLog(@"pop_animationDidReachToValue %@", anim);
}

- (void)pop_animationDidStop:(POPAnimation *)anim finished:(BOOL)finished {
    
    NSLog(@"pop_animationDidStop %@", anim);
}
- (void)pop_animationDidApply:(POPAnimation *)anim {

    NSValue *value = [anim valueForKeyPath:@"currentValue"];
    CGSize size = [value CGSizeValue];
    
    [CATransaction setDisableActions:YES];
    CGFloat percent = (size.height - self.math.b)/self.math.k;
    self.circle1.strokeEnd = percent;
    [CATransaction setDisableActions:NO];
    
    self.centerLabel.text = [NSString stringWithFormat:@"%.f%%",fabs(percent*100)];
    self.centerLabel.textColor =[UIColor colorWithRed:percent green:percent blue:percent alpha:1];
    self.blurImageView.alpha = 1 - percent;



}
@end
