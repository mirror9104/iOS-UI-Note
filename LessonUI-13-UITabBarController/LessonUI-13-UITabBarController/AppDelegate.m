//
//  AppDelegate.m
//  LessonUI-13-UITabBarController
//
//  Created by huchunyuan on 15/8/30.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewController.h"

@interface AppDelegate ()<UITabBarControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    // 创建标签视图控制器对象
    RootViewController *tabBarVC = [[[RootViewController alloc] init] autorelease];
    // 将tabBarVC指定为window的跟视图控制器
    self.window.rootViewController = tabBarVC;
    // 设置代理
    tabBarVC.delegate = self;
    // 配置tabBar
    // tintcolor
    tabBarVC.tabBar.tintColor = [UIColor purpleColor];
    // bartintColor
    tabBarVC.tabBar.barTintColor = [UIColor blackColor];
    // 设置图片
//    [tabBarVC.tabBar setBackgroundImage:[UIImage imageNamed:@"320x49.png" ]];
    // 给导航栏设置 同一种风格
    // 只要是UINavigationBar这个类创建的所有对象都拥有同样的属性
    [[UINavigationBar appearance] setBarTintColor:[UIColor brownColor]];
//    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"320x49.png"] forBarMetrics:UIBarMetricsDefault];
    return YES;
}
// 设置controller对应的标签是否可以点击
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    return YES;
}
// 当选中标签时触发的方法
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    // 取消显示的提示
    viewController.tabBarItem.badgeValue = nil;
    // 输出不同的viewController
//    NSLog(@"%@",viewController);
    // 每次点击少一个
    //    static int i = 99;
//    viewController.tabBarItem.badgeValue = [NSString stringWithFormat:@"%d",i--];
}
// 将要开始自定义视图控制器们
- (void)tabBarController:(UITabBarController *)tabBarController willBeginCustomizingViewControllers:(NSArray *)viewControllers{
    NSLog(@"%@",viewControllers);
    for (UINavigationController *naVC in viewControllers) {
        NSLog(@"%@",naVC.viewControllers.firstObject);
    }
}
// 已经完成 自定义控制器
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed{
    NSLog(@"%@",viewControllers);
    for (UINavigationController *naVC in viewControllers) {
        NSLog(@"%@",naVC.viewControllers.firstObject);
    }

}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
