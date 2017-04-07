//
//  DownloadButtonViewController.m
//  MyAnimations
//
//  Created by 张润潮 on 2017/4/5.
//  Copyright © 2017年 zrc. All rights reserved.
//

#import "DownloadButtonViewController.h"
#import "DownloadButton.h"

@interface DownloadButtonViewController ()
@property(nonatomic,strong) DownloadButton *downloadButton;
@end

@implementation DownloadButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[@"f4f4f4" hexColor]];

    self.downloadButton = [[DownloadButton alloc] initWithFrame:CGRectMake(Width/2 - 40, 120, 80, 80)];
    self.downloadButton.backgroundColor = [@"ff1100" hexColor];
    self.downloadButton.buttonHeight = 30;
    self.downloadButton.buttonWidth  = 150;
    self.downloadButton.layer.cornerRadius = self.downloadButton.height/2;
    [self.view addSubview:self.downloadButton];




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
