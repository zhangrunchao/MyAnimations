//
//  AppDelegate.m
//  MyAnimations
//
//  Created by 张润潮 on 2017/1/5.
//  Copyright © 2017年 zrc. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    ViewController *view = [[ViewController alloc] init];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:view];
    
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    
    
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.contents = (id)[[UIImage imageNamed:@"logo"] CGImage];
    maskLayer.position = nav.view.center;
    maskLayer.bounds = CGRectMake(0, 0, 60, 60);
    nav.view.layer.mask = maskLayer;
    
    
    UIView *maskBackView = [[UIView alloc] initWithFrame:nav.view.bounds];
    maskBackView.backgroundColor = [UIColor whiteColor];
    [nav.view addSubview:maskBackView];
    [nav.view bringSubviewToFront:maskBackView];
    
    
    
    CAKeyframeAnimation *keyAnim = [CAKeyframeAnimation animationWithKeyPath:@"bounds"];
    keyAnim.values = @[[NSValue valueWithCGRect:maskLayer.bounds],[NSValue valueWithCGRect:CGRectMake(0, 0, 50, 50)],[NSValue valueWithCGRect:CGRectMake(0, 0, 2000, 2000)]];
    keyAnim.keyTimes = @[@(0),@(0.5),@(1)];
    keyAnim.duration = 1;
    keyAnim.beginTime = CACurrentMediaTime() + 1;
    keyAnim.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut],[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
    keyAnim.removedOnCompletion = NO;
    keyAnim.fillMode = kCAFillModeForwards;
    [nav.view.layer.mask addAnimation:keyAnim forKey:@"anim"];
    
    [UIView animateWithDuration:0.1 delay:1.35 options:UIViewAnimationOptionCurveEaseIn animations:^{
        maskBackView.alpha = 0;
     
    } completion:^(BOOL finished) {
        [maskBackView removeFromSuperview];

    }];
    
    
    [UIView animateWithDuration:0.25 delay:1.3 options:UIViewAnimationOptionCurveEaseIn animations:^{
        nav.view.transform = CGAffineTransformMakeScale(1.05, 1.05);
        
    } completion:^(BOOL finished) {

        [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        
            nav.view.transform = CGAffineTransformIdentity;

        } completion:^(BOOL finished) {
            nav.view.layer.mask = nil;

        }];
    }];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
