//
//  MyLoadingViewController.m
//  MyAnimations
//
//  Created by 张润潮 on 2017/2/8.
//  Copyright © 2017年 zrc. All rights reserved.
//

#import "MyLoadingViewController.h"
#import "BallLoadingView.h"
@interface MyLoadingViewController ()
@property(nonatomic,strong) BallLoadingView *loading;
@end

@implementation MyLoadingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [@"f4f4f4" hexColor];
    // Do any additional setup after loading the view.
    self.loading = [[BallLoadingView alloc] initWithFrame:CGRectMake(self.view.centerX - 100, self.view.centerY-50, 200, 100)];
    [self.view addSubview:self.loading];
    [self.loading loading];
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
