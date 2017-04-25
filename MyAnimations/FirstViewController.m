//
//  FirstViewController.m
//  MyAnimations
//
//  Created by 张润潮 on 2017/4/10.
//  Copyright © 2017年 zrc. All rights reserved.
//

#import "FirstViewController.h"
#import "RCPushTransition.h"
#import "SecondViewController.h"

@interface FirstViewController ()
@property(nonatomic,strong) UIImageView *imageView;
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [@"f4f4f4" hexColor];
    // Do any additional setup after loading the view.
    
    
    self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed: @"dingdang"]];
    self.imageView.center = self.view.center;
    [self.view addSubview:self.imageView];
    
    
    self.goButton = [[UIButton alloc] initWithFrame:CGRectMake(Width - 80, Height - 80, 70, 70)];
    [self.goButton setTitle:@"下一页" forState:UIControlStateNormal];
    self.goButton.titleLabel.font = [UIFont HeitiSCWithFontSize:13];
    [self.goButton setTitleColor:[@"f38764" hexColor] forState:UIControlStateNormal];
    [self.goButton addTarget:self action:@selector(buttonEvent:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.goButton];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    
    if (operation == UINavigationControllerOperationPush) {
        RCPushTransition *push = [[RCPushTransition alloc] init];
        return push;
    }
    
    return nil;
    
}
-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.delegate = self;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(IBAction)buttonEvent:(id)sender{
    
    SecondViewController *second = [[SecondViewController alloc] init];
    [self.navigationController pushViewController:second animated:YES];
    
}

@end
