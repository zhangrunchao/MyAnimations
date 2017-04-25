//
//  WaveViewController.m
//  MyAnimations
//
//  Created by 张润潮 on 2017/4/14.
//  Copyright © 2017年 zrc. All rights reserved.
//

#import "WaveViewController.h"
#import "WaveView.h"
@interface WaveViewController ()
@property(nonatomic,strong) WaveView    *waveView;
@end

@implementation WaveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [@"f4f4f4" hexColor];
    self.waveView = [[WaveView alloc] initWithFrame:CGRectMake(50, 80, 120, 120)];
    [self.view addSubview:self.waveView];
    [self.waveView start];
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
