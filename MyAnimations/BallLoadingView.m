//
//  BallLoadingView.m
//  MyAnimations
//
//  Created by 张润潮 on 2017/2/8.
//  Copyright © 2017年 zrc. All rights reserved.
//

#import "BallLoadingView.h"
#define BALL_RADIUS 10
#define BALL_COLOR [UIColor colorWithRed:1.0f green:.45f blue:.12f alpha:1]
#define BALL_COLOR2 [UIColor colorWithRed:0.45f green:1.0f blue:.12f alpha:1]
#define BALL_COLOR3 [UIColor colorWithRed:0.12f green:.45f blue:1.0f alpha:1]


@interface BallLoadingView()<CAAnimationDelegate>
@property(nonatomic,strong) UIView *centerBall;
@property(nonatomic,strong) UIView *leftBall;
@property(nonatomic,strong) UIView *rightBall;

@end
@implementation BallLoadingView

-(id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor grayColor];
        NSLog(@"%f",self.middleX);
        _centerBall = [[UIView alloc] initWithFrame:CGRectMake(self.middleX - BALL_RADIUS, self.middleY - BALL_RADIUS, BALL_RADIUS*2, BALL_RADIUS*2)];
        _centerBall.layer.cornerRadius = BALL_RADIUS;
        
        _centerBall.backgroundColor = BALL_COLOR;
        [self addSubview:_centerBall];
        
        _leftBall = [[UIView alloc] initWithFrame:CGRectMake(_centerBall.x - BALL_RADIUS*2, _centerBall.y, _centerBall.width, _centerBall.height)];
        _leftBall.layer.cornerRadius = BALL_RADIUS;
        _leftBall.backgroundColor = BALL_COLOR2;

        [self addSubview:_leftBall];
        
        _rightBall = [[UIView alloc] initWithFrame:CGRectMake(_centerBall.right, _centerBall.y, _centerBall.width, _centerBall.height)];
        _rightBall.layer.cornerRadius = BALL_RADIUS;
        _rightBall.backgroundColor = BALL_COLOR3;

        [self addSubview:_rightBall];
        
        
    }
    return self;
}

-(void)loading{
    
   
    [self rotate];
    
    
}


-(void)rotate{
    
    UIBezierPath *leftBallPath1 = [UIBezierPath bezierPath];
    [leftBallPath1 moveToPoint:_leftBall.center];
    
    [leftBallPath1 addArcWithCenter:self.middlePoint radius:BALL_RADIUS*2 startAngle:M_PI endAngle:M_PI*2 clockwise:NO];
    
    UIBezierPath *leftBallPath2 = [UIBezierPath bezierPath];
    [leftBallPath2 moveToPoint:_rightBall.center];
    [leftBallPath2 addArcWithCenter:self.middlePoint radius:BALL_RADIUS*2 startAngle:M_PI*2 endAngle:M_PI clockwise:NO];
    [leftBallPath1 appendPath:leftBallPath2];
    
    
    
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    anim.path = leftBallPath1.CGPath;
    anim.duration = 1.4;
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
    anim.repeatCount = 1;
    anim.delegate = self;
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [_leftBall.layer addAnimation:anim forKey:@"leftAnim"];
    
    
    
    
    UIBezierPath *rightBallPath1 = [UIBezierPath bezierPath];
    [rightBallPath1 moveToPoint:_rightBall.center];
    [rightBallPath1 addArcWithCenter:_centerBall.center radius:BALL_RADIUS*2 startAngle:M_PI*2 endAngle:M_PI clockwise:NO];
    
    UIBezierPath *rightBallPath2 = [UIBezierPath bezierPath];
    [rightBallPath2 moveToPoint:_leftBall.center];
    [rightBallPath2 addArcWithCenter:_centerBall.center radius:BALL_RADIUS*2 startAngle:M_PI endAngle:M_PI*2 clockwise:NO];
    [rightBallPath1 appendPath:rightBallPath2];
    
    CAKeyframeAnimation *rightAnim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    rightAnim.duration = 1.4;
    rightAnim.path = rightBallPath1.CGPath;
    rightAnim.removedOnCompletion = NO;
    rightAnim.fillMode = kCAFillModeForwards;
    rightAnim.repeatCount = 1;
    rightAnim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [_rightBall.layer addAnimation:rightAnim forKey:@"rightAnim" ];
    
    
    
    
    
}

- (void)animationDidStart:(CAAnimation *)anim{
   
    [UIView animateWithDuration:.3 delay:.1 options:UIViewAnimationOptionCurveEaseOut|UIViewAnimationOptionBeginFromCurrentState animations:^{
    
    
        _leftBall.transform = CGAffineTransformMakeTranslation(-BALL_RADIUS*2, 0);
        _leftBall.transform = CGAffineTransformMakeScale(.7f, .7f);
        _rightBall.transform = CGAffineTransformMakeTranslation(BALL_RADIUS*2, 0);
        _rightBall.transform = CGAffineTransformMakeScale(.7f, .7f);
        
        _centerBall.transform = CGAffineTransformMakeScale(.7f, .7f);
        
    
    }completion:^(BOOL finished) {
       
        [UIView animateWithDuration:0.3 delay:0.1 options:UIViewAnimationOptionCurveEaseIn  | UIViewAnimationOptionBeginFromCurrentState animations:^{
            _leftBall.transform = CGAffineTransformIdentity;
            _rightBall.transform = CGAffineTransformIdentity;
            
            _centerBall.transform = CGAffineTransformIdentity;
        } completion:NULL];
        

        
    }];
    
    
    
}


- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    
    if (flag) {
        [self rotate];
    }
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
