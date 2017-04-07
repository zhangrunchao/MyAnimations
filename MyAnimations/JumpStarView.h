//
//  JumpStarView.h
//  MyAnimations
//
//  Created by 张润潮 on 2017/3/14.
//  Copyright © 2017年 zrc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JumpStarView : UIView
/**是否标记*/
@property(nonatomic)        BOOL    isMark;
@property(nonatomic,strong) UIImage *markImage;
@property(nonatomic,strong) UIImage *nonMarkImage;

-(void)animate;
@end
