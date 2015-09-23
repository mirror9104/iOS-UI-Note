//
//  AppDelegate.m
//  LessonUI-02-UITextFildAndUIButton2
//
//  Created by huchunyuan on 15/8/14.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()<UITextFieldDelegate>

@end

@implementation AppDelegate

// 程序准备就是 将要运行时执行 我们一般用来进行 window的创建 以及 视图控件等等配置
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    // 创建对象
    UITextField *tf = [[UITextField alloc] initWithFrame:CGRectMake(50, 100, 275, 50)];
    // 2.配置属性
    tf.borderStyle = UITextBorderStyleRoundedRect;
    tf.placeholder = @"请输入用户名";
    // 设置代理
    tf.delegate = self;
    // 添加视图
    [self.window addSubview:tf];
    // 释放所有权
    UITextField *tf2 = [[UITextField alloc] initWithFrame:CGRectMake(50, 200, 275, 50)];
    tf2.borderStyle = UITextBorderStyleRoundedRect;
    tf2.placeholder = @"请输入密码";
    tf2.delegate = self;
    [self.window addSubview:tf2];
    tf2.tag = 102;
    [tf2 release];
    return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    // 回收键盘
//    [textField resignFirstResponder];
    // 通过tag值获取UI控件对象
    UITextField *tf2 = (UITextField *)[self.window viewWithTag:102];
    [tf2 becomeFirstResponder];
    // 如果是第二个输入框就回收键盘
    if ([textField isEqual:tf2]) {
        [tf2 resignFirstResponder];
    }
    return YES;
}
// 程序 将要取消活跃状态 执行的方法 歌曲的暂停 视频的暂停等方法
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    NSLog(@"程序将要取消活跃状态:%s %d",__FUNCTION__,__LINE__);
}
// 程序 已经进入到后台 执行的方法 一般用来保存临时的数据
- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    NSLog(@"程序已经进入到后台 %s %d",__FUNCTION__,__LINE__);
}
// 程序 将要从后台进入前台 执行的方法 一般进行 视频 歌曲 数据的恢复
- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    NSLog(@"程序将要进入前台%s %d",__FUNCTION__,__LINE__);
}
// 程序 已经变成活跃状态 执行的方法 一般进行UI界面刷新
- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    NSLog(@"程序已经进入活跃状态 %s %d",__FUNCTION__,__LINE__);
}
// 程序 将要退出 执行的方法 用于数据的保存
- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    NSLog(@"程序将要退出%s %d",__FUNCTION__,__LINE__);
}

@end
