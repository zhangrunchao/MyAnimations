//
//  SlideMenu.m
//  MyAnimations
//
//  Created by 张润潮 on 2017/2/10.
//  Copyright © 2017年 zrc. All rights reserved.
//

#import "SlideMenu.h"

@interface SlideMenu()
@property(nonatomic,strong) CADisplayLink *displayLink;
@property NSInteger animationCount;
@end

@implementation SlideMenu{
    UIView *helperCenterView;
    UIWindow    *keyWindow;
    BOOL triggered;
    CGFloat diff;
    UIColor *_menuColor;
    CGFloat menuButtonHeight;
}

-(id)initWithTitles:(NSArray *)titles{
    return [self initWithTitles:titles withButtonHeight:40.f withMenuColor:[UIColor colorWithRed:.54 green:.90 blue:.12 alpha:1]];
}

-(id)initWithTitles:(NSArray *)titles withButtonHeight:(CGFloat)buttonHeight withMenuColor:(UIColor *)menuColor{
    
    self = [super init];
    if (self) {
        keyWindow = [[UIApplication sharedApplication] keyWindow];
        
        helperCenterView = [[UIView alloc] initWithFrame:CGRectMake(-40, CGRectGetHeight(keyWindow.frame)/2-20, 40, 40)];
        [keyWindow addSubview:helperCenterView];
        
        self.frame = CGRectMake(-keyWindow.frame.size.width/2, 0, keyWindow.frame.size.width/2, keyWindow.frame.size.height);
        self.backgroundColor = [UIColor clearColor];
        [keyWindow insertSubview:self belowSubview:helperCenterView];
        
        _menuColor = menuColor;
        menuButtonHeight = buttonHeight;
        [self addButtons:titles];
        
    }
    
    return self;
}


-(void)addButtons:(NSArray*)titles{
    
    if(titles.count % 2 == 0){
        //偶数个button
        NSInteger indexDown = titles.count/2;
        NSInteger indexUp   = -1;
        for(int i = 0; i<titles.count;i++){
            NSString *title = titles[i];
            if (i >= titles.count / 2) {
                
            }else{
                
            }
            
            
        }
        
    }else{
        //奇数个button
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
