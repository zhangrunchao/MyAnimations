//
//  SlideMenu.h
//  MyAnimations
//
//  Created by 张润潮 on 2017/2/10.
//  Copyright © 2017年 zrc. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SlideMenuButtonClickBlock)(NSInteger index,NSString *title);

@interface SlideMenu : UIView

-(id)initWithTitles:(NSArray*)titles;

-(id)initWithTitles:(NSArray *)titles withButtonHeight:(CGFloat)buttonHeight withMenuColor:(UIColor*)menuColor ;

-(void)trigger;


@property(nonatomic,copy) SlideMenuButtonClickBlock menuClickBlock;



@end
