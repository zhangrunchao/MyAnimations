//
//  RCPopTransition.m
//  MyAnimations
//
//  Created by 张润潮 on 2017/4/11.
//  Copyright © 2017年 zrc. All rights reserved.
//

#import "RCPopTransition.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
@interface RCPopTransition()<CAAnimationDelegate>
@property(nonatomic,strong) id<UIViewControllerContextTransitioning> contextTransition;
@end
@implementation RCPopTransition
-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return .7f;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    self.contextTransition = transitionContext;
    SecondViewController *fromView = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    FirstViewController  *toView   = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    
    UIButton *button = toView.goButton;
    [containerView addSubview:toView.view];
    [containerView addSubview:fromView.view];
    
    CGFloat width = MAX(button.centerX - 0, toView.view.width - button.centerX);
    CGFloat height = MAX(button.centerY - 0, toView.view.height - button.centerY);
    CGFloat radius = MAX(width, height);
    
    UIBezierPath *startPath = [UIBezierPath bezierPathWithRect:CGRectInset(button.frame, -radius, -radius)];
    
    UIBezierPath *finalPath = [UIBezierPath bezierPathWithRect:button.frame];
    
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.path = finalPath.CGPath;
    fromView.view.layer.mask = maskLayer;
    
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"path"];
    anim.duration = [self transitionDuration:transitionContext];
    anim.fromValue = (__bridge id)startPath.CGPath;
    anim.toValue  = (__bridge id)finalPath.CGPath;
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    anim.delegate = self;
    [maskLayer addAnimation:anim forKey:@"pathAnim"];
    
    
}
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    
    [self.contextTransition completeTransition:![self.contextTransition transitionWasCancelled]];
    [self.contextTransition viewControllerForKey:UITransitionContextFromViewControllerKey].view.layer.mask = nil;
    [self.contextTransition viewControllerForKey:UITransitionContextToViewControllerKey].view.layer.mask = nil;
    
    
    
}
@end
