//
//  AppDelegate.m
//  LessonUI-19-SaveData
//
//  Created by huchunyuan on 15/9/9.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // IOS只有 NSDocumentDirectory路径 Documents
    // NSUserDomainMask用户域
    // YES详尽的显示
    // 对于我们ios来说只有一个文件夹所以要写firstObject
    // 用documentsPath接收路径
    NSString *documentsPath =[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    // 打印documents路径
    NSLog(@"%@",documentsPath);
    // 获取包内容
    NSString *appPath = [[NSBundle mainBundle] resourcePath];
    NSLog(@"%@",appPath);
    
    /** 
     沙盒:其实对于每一个应用程序,都有唯一的一个本地文件与之对应,名字由系统随机生成,这个文件就是沙盒
     
     沙盒机制:沙盒机制其实就是,对每一个应用资源起到一个保护作用,当前程序不允许访问其他程序的资源,其他程序也不允许访问当前程序的资源.
     
     对于每一个应用程序的沙盒文件中都包含以下文件:
        1.documents:用来存储持久化数据文件,如果我们想对一个文件进行长久存储,就放在该文件夹下
        2.Library:
            (a)Caches:缓存文件,存放已经下载完成的视频,音频,图片等等,一般我们会在该文件夹下创建Images,Audioes,Videoes等文件分别存放图片,音乐,视频.
            (v)Prefrences:用于存储用户的偏好设置,比如程序用于判别程序是否是第一次启用plist文件就放在该文件夹下
        3.tmp:存放未下载完成的视频音频等,一般我们会将下载完成的视频,音频手动移动到Cahes文件夹中
     
     xxxx.app:应用程序的包,应用程序的资源都来源于包,而包也是我们上传到appStore以及用户从appStore下载的东西 对于包内的资源我们不能进行修改,更不删除
     
     另外,对于以上文件都是由系统创建,不允许随意删除,修改 我们只能删除,修改自己创建的文件
     
     */
    
    
    
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
