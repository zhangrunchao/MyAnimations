//
//  BallLoadingView.m
//  MyAnimations
//
//  Created by 张润潮 on 2017/2/8.
//  Copyright © 2017年 zrc. All rights reserved.
//

#import "BallLoadingView.h"
#define BALL_RADIUS 25
#define BALL_COLOR [UIColor colorWithRed:.89f green:.45f blue:.12f alpha:1]
@interface BallLoadingView()
@property(nonatomic,strong) UIView *centerBall;
@property(nonatomic,strong) UIView *leftBall;
@property(nonatomic,strong) UIView *rightBall;

@end
@implementation BallLoadingView

-(id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _centerBall = [[UIView alloc] initWithFrame:CGRectMake(self.centerX - BALL_RADIUS, self.centerY - BALL_RADIUS, BALL_RADIUS*2, BALL_RADIUS*2)];
        _centerBall.layer.cornerRadius = BALL_RADIUS;
        
        _centerBall.backgroundColor = BALL_COLOR;
        [self addSubview:_centerBall];
        
        _leftBall = [[UIView alloc] initWithFrame:CGRectMake(_centerBall.x - BALL_RADIUS*2, _centerBall.y, _centerBall.width, _centerBall.height)];
        _leftBall.layer.cornerRadius = BALL_RADIUS;
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
