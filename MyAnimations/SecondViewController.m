//
//  SecondViewController.m
//  MyAnimations
//
//  Created by 张润潮 on 2017/4/10.
//  Copyright © 2017年 zrc. All rights reserved.
//

#import "SecondViewController.h"
#import "RCPopTransition.h"

@interface SecondViewController ()
@property(nonatomic,strong) UIImageView *imageView;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [@"f4f4f4" hexColor];
    
    self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed: @"5"]];
    self.imageView.center = self.view.center;
    [self.view addSubview:self.imageView];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.delegate = self;
}
-(id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    
    if (operation == UINavigationControllerOperationPop) {
        RCPopTransition *transition = [RCPopTransition new];
        return transition;
    }
    
    return nil;

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
