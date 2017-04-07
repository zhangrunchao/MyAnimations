//
//  JumpStarView.m
//  MyAnimations
//
//  Created by 张润潮 on 2017/3/14.
//  Copyright © 2017年 zrc. All rights reserved.
//

#import "JumpStarView.h"

@interface JumpStarView()<CAAnimationDelegate>
@property(nonatomic)    BOOL    isAnimating;
@property(nonatomic,strong) UIImageView *starView;
@property(nonatomic,strong) UIImageView *shadowView;

@end
@implementation JumpStarView

-(instancetype)init{
    self = [super init];
    return self;
}


-(void)layoutSubviews{
    
    [super layoutSubviews];
    self.backgroundColor = [UIColor clearColor];
    if (self.starView == nil) {
        self.starView = [[UIImageView alloc]initWithFrame:CGRectMake(self.bounds.size.width/2 - (self.bounds.size.width-6)/2, 0, self.bounds.size.width-6, self.bounds.size.height - 6)];
        self.starView.contentMode = UIViewContentModeScaleToFill;
        self.starView.image = self.nonMarkImage;
        [self addSubview:self.starView];
    }
    if (self.shadowView == nil) {
        self.shadowView = [[UIImageView alloc]initWithFrame:CGRectMake(self.bounds.size.width/2 - 10/2, self.bounds.size.height - 3, 10, 3)];
        self.shadowView.alpha = 0.4;
        self.shadowView.image = [UIImage imageNamed:@"shadow_new"];
        [self addSubview:self.shadowView];
    }
    
}
-(void)setIsMark:(BOOL)isMark{
    _isMark = isMark;
    if (self.isMark) {
        self.starView.image = self.markImage;
    }else{
        self.starView.image = self.nonMarkImage;
    }
}

-(void)animate{
    
    
    if (self.isAnimating ) {
        return ;
    }
    
    self.isAnimating = YES;
    
    
    CABasicAnimation *rotate = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    rotate.fromValue = @(0);
    rotate.toValue   = @(M_PI_2);
    rotate.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut] ;
    
    CABasicAnimation *up = [CABasicAnimation animationWithKeyPath:@"position.y"];
    up.fromValue = @(self.starView.y);
    up.toValue   = @(self.starView.y - 14);
    rotate.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[rotate,up];
    group.duration  = 0.125;
    group.removedOnCompletion = NO;
    group.fillMode = kCAFillModeForwards;
    group.delegate = self;
    [self.starView.layer addAnimation:group forKey:@"up"];
    
    
    
}



-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    
    if ([anim isEqual: [self.starView.layer animationForKey:@"up"]]) {
        //上
        self.isMark = !self.isMark;

        CABasicAnimation *rotate = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
        rotate.fromValue = @(M_PI_2);
        rotate.toValue = @(M_PI);
        rotate.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        
        
        CABasicAnimation *down = [CABasicAnimation animationWithKeyPath:@"position.y"];
        down.fromValue = @(self.starView.y);
        down.toValue = @(self.starView.y + 14);
        down.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        
        CAAnimationGroup *group = [CAAnimationGroup animation];
        group.animations = @[rotate,down];
        group.duration = 0.125;
        group.delegate = self;
        group.fillMode = kCAFillModeForwards;
        group.removedOnCompletion = NO;
        [self.starView.layer addAnimation:group forKey:@"down"];
    }else{
        self.isAnimating = NO;

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
