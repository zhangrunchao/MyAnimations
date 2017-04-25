//
//  RCPushTransition.m
//  MyAnimations
//
//  Created by 张润潮 on 2017/4/10.
//  Copyright © 2017年 zrc. All rights reserved.
//

#import "RCPushTransition.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
@interface RCPushTransition()<CAAnimationDelegate>
@property(nonatomic,strong) id<UIViewControllerContextTransitioning> transitionContext;
@end

@implementation RCPushTransition
-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return .7f;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    self.transitionContext = transitionContext;
    FirstViewController *firstView = (FirstViewController*)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    SecondViewController *secondView = (SecondViewController*)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *container = [transitionContext containerView];
    
    UIButton *button = firstView.goButton;
    UIBezierPath *maskStartPath = [UIBezierPath bezierPathWithRect:button.frame];
    [container addSubview:firstView.view];
    [container addSubview:secondView.view];
    
    //创建两个圆形贝塞尔路径，一个是按钮的size 另一个是半径足够覆盖屏幕，动画从第一个贝塞尔曲线到第二个。
    

    //判断半径
    
    CGFloat width = MAX(secondView.view.width - button.centerX,button.centerX - 0);
    CGFloat height = MAX(button.centerY - 0, secondView.view.height - button.centerY);
    CGFloat radius = MAX(width, height);
    
    UIBezierPath *maskFinalPath = [UIBezierPath bezierPathWithOvalInRect:CGRectInset(button.frame, -radius, -radius)];
    
    
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.path = maskFinalPath.CGPath;
    secondView.view.layer.mask = maskLayer;
    

    
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"path"];
    anim.duration = [self transitionDuration:transitionContext];;
    anim.fromValue = (__bridge id)maskStartPath.CGPath;
    anim.toValue   = (__bridge id)maskFinalPath.CGPath;
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    anim.delegate = self;
    [maskLayer addAnimation:anim forKey:@"pathAnim"];
  
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    
    [self.transitionContext completeTransition:![self.transitionContext transitionWasCancelled]];
    
    [self.transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view.layer.mask = nil;
    [self.transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view.layer.mask = nil;
    
    
    
}
@end
