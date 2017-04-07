//
//  JumpStarViewController.m
//  MyAnimations
//
//  Created by 张润潮 on 2017/3/14.
//  Copyright © 2017年 zrc. All rights reserved.
//

#import "JumpStarViewController.h"
#import "JumpStarView.h"
@interface JumpStarViewController ()
@property(nonatomic,strong) JumpStarView *starView;
@property(nonatomic,strong) UIButton     *tapButton;
@end

@implementation JumpStarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[@"f4f4f4" hexColor]];
    self.starView = [[JumpStarView alloc] initWithFrame:CGRectMake(self.view.centerX - 10, 100, 20, 20)];
    [self.view addSubview:self.starView];

    self.starView.markImage = [UIImage imageNamed:@"icon_star_incell"];
    self.starView.nonMarkImage = [UIImage imageNamed:@"blue_dot"];
    self.starView.isMark = NO;
    
    
    self.tapButton = [[UIButton alloc] initWithFrame:CGRectMake(self.view.centerX - 70, self.starView.bottom + 30, 140, 140)];
    [self.view addSubview:self.tapButton];
    [self.tapButton setTitle:@"点击" forState:UIControlStateNormal];
    [self.tapButton setTitleColor:[@"333333" hexColor] forState:UIControlStateNormal];
    [self.tapButton addTarget:self action:@selector(tap) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)tap{
    
    [self.starView animate];

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
