//
//  WaveView.m
//  MyAnimations
//
//  Created by 张润潮 on 2017/4/14.
//  Copyright © 2017年 zrc. All rights reserved.
//

#import "WaveView.h"

@interface WaveView()
@property(nonatomic,strong) CAShapeLayer    *shapeLayer;

@end
@implementation WaveView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setupView];
    }
    
    return self;
    
}


-(void)setupView{
    
    self.shapeLayer = [CAShapeLayer layer];
    self.shapeLayer.frame = self.bounds;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:self.bounds];
    self.shapeLayer.path = path.CGPath;
    self.shapeLayer.fillColor = [@"a70367" hexColor].CGColor;
    
    CAReplicatorLayer *repLayer = [CAReplicatorLayer layer];
    repLayer.instanceDelay = .5f;
    repLayer.instanceCount = 5;
    [repLayer addSublayer:self.shapeLayer];
    [self.layer addSublayer:repLayer];
    
    
}


-(void)start{
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[[self scaleAnimation] , [self alphaAnimation]];
    group.duration   = 1.5f;
    group.autoreverses = false;
    group.repeatCount  = CGFLOAT_MAX;
    [self.shapeLayer addAnimation:group forKey:@"group"];
    
    
}

-(CABasicAnimation*)scaleAnimation{
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"transform"];
    CATransform3D t1 = CATransform3DScale(CATransform3DIdentity, 1.0f, 1.0f, 0.0f);
    CATransform3D t2 = CATransform3DScale(CATransform3DIdentity, 3.0f, 3.0f, 0.0f);
    anim.fromValue = [NSValue valueWithCATransform3D: t1];
    anim.toValue = [NSValue valueWithCATransform3D:t2];
    return anim;
}

-(CABasicAnimation*)alphaAnimation{
    
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"opacity"];
    anim.fromValue = @(1);
    anim.toValue = @(0);
    return anim;
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
