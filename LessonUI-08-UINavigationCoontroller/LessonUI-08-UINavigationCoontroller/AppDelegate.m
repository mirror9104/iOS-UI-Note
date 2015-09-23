//
//  AppDelegate.m
//  LessonUI-08-UINavigationCoontroller
//
//  Created by huchunyuan on 15/8/24.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    // 1.创建firstVC
    FirstViewController *firstVC = [[FirstViewController alloc] init];
    // 2.创建导航控制器对象 naVC 将firstVC成为导航控制器的根视图控制器
    UINavigationController *naVC = [[UINavigationController alloc] initWithRootViewController:firstVC];
    
    // 3.将导航视图控制器对象 naVC 指定为window的跟视图控制器
    self.window.rootViewController = naVC;
    // 4.释放所有权
    [naVC release];
    [firstVC release];
    // 定制navigationBar
    // 设置barTinColor
//    naVC.navigationBar.barTintColor = [UIColor whiteColor];
    // 关闭半透明
//    naVC.navigationBar.translucent = NO;
    // tinColor
    naVC.navigationBar.tintColor = [UIColor purpleColor];
    
    // 设置风格
//    naVC.navigationBar.barStyle = UIBarStyleBlack;
    
    // 设置背景图片
    // 当给我们navigationBar设置图片时 navigationBar不再透明
    // 图片尺寸:
    // 当小于44 或者 大于64 时图片会在navigationBar 和statusBar上产生平铺效果(很难看)
    // 当尺寸正好等于44时,图片只会为navigationBar附上图片
    // 当尺寸正好等于64时,图片会为navigationBar何statusBar都附上图片
//    [naVC.navigationBar setBackgroundImage:[UIImage imageNamed:@"32074.png"] forBarMetrics:UIBarMetricsDefault];
    return YES;
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
