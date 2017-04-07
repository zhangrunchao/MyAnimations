//
//  SideMenuButton.m
//  MyAnimations
//
//  Created by 张润潮 on 2017/2/17.
//  Copyright © 2017年 zrc. All rights reserved.
//

#import "SideMenuButton.h"
@interface SideMenuButton()
@property(nonatomic,strong) NSString *buttonTitle;
@end
@implementation SideMenuButton

-(id)initWithTitle:(NSString *)title{
    if (self = [super init]) {
        self.buttonTitle = title;
    }
    
    return self;
}

-(void)drawRect:(CGRect)rect{
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextAddRect(context, rect);
    [self.buttonColor set];
    CGContextFillPath(context);
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectInset(rect, 1, 1) cornerRadius:rect.size.height/2];
    [self.buttonColor set];
    [path fill];
    [[UIColor whiteColor] setStroke];
    path.lineWidth = 1;
    [path stroke];
    
    
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
