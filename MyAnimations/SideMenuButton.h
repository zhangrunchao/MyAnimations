//
//  SideMenuButton.h
//  MyAnimations
//
//  Created by 张润潮 on 2017/2/17.
//  Copyright © 2017年 zrc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SideMenuButton : UIView
@property(nonatomic,strong) UIColor *buttonColor;
@property(nonatomic,copy) void(^buttonClick)(void);

-(id)initWithTitle:(NSString*)title;

@end
