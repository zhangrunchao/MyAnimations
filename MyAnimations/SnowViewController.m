//
//  SnowViewController.m
//  MyAnimations
//
//  Created by 张润潮 on 2017/4/14.
//  Copyright © 2017年 zrc. All rights reserved.
//

#import "SnowViewController.h"
#import <CoreGraphics/CoreGraphics.h>

@interface SnowViewController ()

@end

@implementation SnowViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [@"f4f4f4" hexColor];
    
    CAEmitterLayer *layer = [CAEmitterLayer layer];
    
    layer.emitterShape = kCAEmitterLayerLine;
    layer.emitterMode = kCAEmitterLayerOutline;
    layer.emitterSize = CGSizeMake(self.view.bounds.size.width*2, 0);
    layer.emitterPosition = CGPointMake(self.view.bounds.size.width/2, -20);
    
    CAEmitterCell *snowCell = [CAEmitterCell emitterCell];
    snowCell.contents =(id)[[UIImage imageNamed:@"snow"] CGImage];  //粒子中的图片
    snowCell.lifetime = 120;            //粒子存活时间

    snowCell.yAcceleration = 2;       //初始的加速度
    snowCell.birthRate     = 2;         //每秒生成的粒子个数
    snowCell.velocity      = -10;       //粒子速度均值
    snowCell.velocityRange = 10;       //粒子运动的速度范围
    snowCell.emissionRange = 0.5 *M_PI;   //粒子发射角度，这里是一个扇形
    snowCell.spinRange      = 0.25 *M_PI;
    snowCell.color = [[UIColor colorWithRed:0.600 green:0.658 blue:0.743 alpha:1.000] CGColor];
    layer.shadowOpacity = 1;
    layer.shadowRadius  = 0 ;
    layer.shadowOffset = CGSizeMake(0.0, 1.0);
    layer.shadowColor   = [[UIColor whiteColor] CGColor];

    layer.emitterCells   = @[snowCell];

    [self.view.layer insertSublayer:layer atIndex:0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
