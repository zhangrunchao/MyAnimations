//
//  DownloadButton.m
//  MyAnimations
//
//  Created by 张润潮 on 2017/4/5.
//  Copyright © 2017年 zrc. All rights reserved.
//

#import "DownloadButton.h"

@interface DownloadButton ()<CAAnimationDelegate>
@property(nonatomic)  CGRect    originalFrame;
@property(nonatomic)  BOOL      isAnimation;
@end


@implementation DownloadButton


-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSomething];
    }
    
    return self;
    
}

-(void)setupSomething{
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(animation)];
    [self addGestureRecognizer:tap];
    
}


-(void)animation{
    
    self.originalFrame = self.frame;
    
    if (_isAnimation) {
        return;
    }

    for (CAShapeLayer *layer in self.layer.sublayers) {
        [layer removeFromSuperlayer];
    }
    
    
    _isAnimation = YES;
    
    self.backgroundColor = [@"ff1100" hexColor];
    
    
    //先改变layer属性，再使用动画，并且[UIView animate]方法只能对UIView的属性进行动画，对layer的属性是无效的，必须使用CoreAnimation
    self.layer.cornerRadius = self.buttonHeight/2;

    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"cornerRadius"];
    anim.duration = 0.3f;
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    anim.fromValue = @(self.originalFrame.size.height/2);
    anim.delegate = self;
    [self.layer addAnimation:anim forKey:@"cornerRadius"];
    
    
    
    
}

-(void)animationDidStart:(CAAnimation *)anim{
    
    if ([anim isEqual:[self.layer animationForKey:@"cornerRadius"]]) {
        [UIView animateWithDuration:.6f animations:^{
            self.bounds = CGRectMake(0, 0, self.buttonWidth, self.buttonHeight);
            self.backgroundColor = [@"ff1100" hexColor];
        } completion:^(BOOL finished) {
            
            [self.layer removeAllAnimations];
            [self progressBarAnimation];
            
            
        }];
    }else if([anim isEqual:[self.layer animationForKey:@"restoreCorner"]]){
        
        [UIView animateWithDuration:.6f animations:^{
            self.bounds = CGRectMake(0, 0, self.originalFrame.size.width, self.originalFrame.size.height);
            self.backgroundColor = [@"11ff00" hexColor];
        
        } completion:^(BOOL finished) {
            [self.layer removeAllAnimations];
            [self checkAnimation];
            
        }];
        
    }
    
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    
    
    if ([[anim valueForKey:@"animationName"] isEqualToString:@"progress"]){
        [UIView animateWithDuration:0.6f animations:^{
        
            for (CALayer *subLayer in self.layer.sublayers) {
                subLayer.opacity = 0.0f;
            }
        } completion:^(BOOL finished) {
            
            if (finished) {
                for (CALayer *subLayer in self.layer.sublayers) {
                    [subLayer removeFromSuperlayer];
                }
                
                self.layer.cornerRadius = self.originalFrame.size.height/2;
                
                CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"cornerRadius"];
                anim.fromValue = @(self.buttonHeight/2);
                anim.duration = .3f;
                anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
                anim.delegate = self;
                [self.layer addAnimation:anim forKey:@"restoreCorner"];
            }
            
        }];
    }else if ([[anim valueForKey:@"animationName"] isEqualToString:@"check"]){
        
        self.isAnimation = NO;
    }

    
    
    
}

-(void)progressBarAnimation{
    
    CAShapeLayer *whiteLayer = [CAShapeLayer layer];
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(self.buttonHeight/2, self.bounds.size.height/2)];
    [path addLineToPoint:CGPointMake(self.bounds.size.width - self.buttonHeight/2, self.bounds.size.height/2)];
    whiteLayer.path = path.CGPath;
    whiteLayer.lineWidth = self.buttonHeight - 6;
    whiteLayer.strokeColor = [[UIColor whiteColor] CGColor];
    whiteLayer.lineCap = kCALineCapRound;
    [self.layer addSublayer:whiteLayer];
    
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    anim.fromValue = @(0);
    anim.toValue   = @(1);
    anim.duration  = 2.0f;
    anim.timingFunction = [CAMediaTimingFunction functionWithName:  kCAMediaTimingFunctionEaseInEaseOut];
    anim.delegate = self;
    [anim setValue:@"progress" forKey:@"animationName"];
    [whiteLayer addAnimation:anim forKey:nil];
    
    
    
    
}

-(void)checkAnimation{
    
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(self.bounds.size.width/4, self.bounds.size.height/2 -5)];
    [path addLineToPoint:CGPointMake(self.bounds.size.width/5*2, self.bounds.size.height/5*4 -10)];
    [path addLineToPoint:CGPointMake(self.bounds.size.width/8*7, self.bounds.size.height/3 )];
    layer.path = [path CGPath];

    layer.fillColor = [[UIColor clearColor] CGColor];
    layer.lineWidth = 4;
    layer.strokeColor = [[UIColor whiteColor] CGColor];
    
    [self.layer addSublayer:layer];
    
    
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    anim.duration = 1.5;
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    anim.fromValue = @(0);
    anim.toValue = @(1);
    anim.delegate = self;
    [anim setValue:@"check" forKey:@"animationName"];
    
    [layer addAnimation:anim forKey:nil];
    
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
