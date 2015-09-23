//
//  AppDelegate.m
//  LessonUI-01-UIViewAndUILabel
//
//  Created by huchunyuan on 15/8/13.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end
@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 创建 UIVindow对象 并给属性赋值
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // 配置UIWindow 背景颜色
    self.window.backgroundColor = [UIColor whiteColor];
    // 将window对象设置为主window 并显示
    [self.window makeKeyAndVisible];
//#pragma mark - UIView : 代表着屏幕上一块矩形区域,在我们iOS开发的应用程序中 几乎所有能看到的都是UIView及其子类对象
//    // UIVIew的使用步骤 包括四步:
//    // 1.创建UIView对象
//    UIView *yellowView = [[UIView alloc] initWithFrame:CGRectMake(100, 200, 200, 100)];
//    // 2.配置属性
//    yellowView.backgroundColor = [UIColor yellowColor];
//    // 3.添加父视图
//    [self.window addSubview:yellowView];
//    // 4.释放所有权
//    [yellowView release];
//    // 创建绿色视图
//    UIView *greenView = [[UIView alloc] initWithFrame:CGRectMake(100, 300, 100, 200)];
//    greenView.backgroundColor = [UIColor greenColor];
//    [self.window addSubview:greenView];
//    [greenView release];
#pragma mark - frame center bounds
//    // frame 当前视图距离父视图坐标器原点的相对位置 以及 显示的大小
//    NSLog(@"%@",NSStringFromCGRect(self.window.frame));
//    // 改变绿色视图的frame
//    greenView.frame = CGRectMake(50, 50, 100, 200);
//    // 改变绿色视图的 父视图(一个视图 只能有一个父视图 但是一个父视图可以有多个子视图)
//    [yellowView addSubview:greenView];
//    // center:当前视图中心点 相对于父视图坐标系的相对位置,一般用来控制视图的位置
//    // 创建红色视图
//    UIView *redView = [[UIView alloc] initWithFrame:CGRectMake(50, 0, 300, 200)];
//    redView.backgroundColor = [UIColor redColor];
//    [self.window addSubview:redView];
//    [redView release];
//    // 获取红色视图中心点
//    NSLog(@"%@",NSStringFromCGPoint(redView.center));
//    redView.center = CGPointMake(200, 200);
//    //bounds: 自身视图做商店距离自身视图坐标系的位置,改变bounds的点,不会更改自身视图的位置.只会改变子视图的位置.会影响子视图的位置 改变bounds的size,会更改当前视图的大小 但是子很视图的中心点不变
//    // 白色视图
//    UIView *whiteView = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 100, 100)];
//    whiteView.backgroundColor = [UIColor whiteColor];
//    [redView addSubview:whiteView];
//    [whiteView release];
//    // 获取红色视图的bounds
//    NSLog(@"bounds = %@",NSStringFromCGRect(redView.bounds));
//    // 更改父视图bounds
//    redView.bounds = CGRectMake(50,50,300,200);
//    
//    redView.bounds = CGRectMake(50,50,150,100);
//    NSLog(@"%@",NSStringFromCGPoint(redView.center));
//
    
#pragma mark - 视图层级
//    // 创建5个 视图 aView bView cView dView eView
//    UIView *aView = [[UIView alloc] initWithFrame:CGRectMake(100, 50, 100, 500)];
//    aView.backgroundColor = [UIColor redColor];
//    [self.window addSubview:aView];
//    [aView release];
//    UIView *bView = [[UIView alloc] initWithFrame:CGRectMake(50, 100, 200, 100)];
//    bView.backgroundColor = [UIColor orangeColor];
//    [self.window addSubview:bView];
//    [bView release];
//    UIView *cView = [[UIView alloc] initWithFrame:CGRectMake(200, 50, 100, 200)];
//    cView.backgroundColor = [UIColor yellowColor];
//    // 将视图添加到子视图的下面
//    [self.window insertSubview:cView belowSubview:aView];
////    [self.window addSubview:cV     iew];
//    [cView release];
//    UIView *dView = [[UIView alloc] initWithFrame:CGRectMake(100, 220, 200, 200)];
//    dView.backgroundColor = [UIColor greenColor];
////    [self.window addSubview:dView];
//    // 通过下标将视图添加到指定位置
//    [self.window insertSubview:dView atIndex:0];
//    [dView release];
//    UIView *eView = [[UIView alloc] initWithFrame:CGRectMake(50, 300, 300, 200)];
//    eView.backgroundColor = [UIColor blueColor];
////    [self.window addSubview:eView];
//    // 添加到某个子视图的上面
//    [self.window insertSubview:eView aboveSubview:dView];
//    [eView release];
//    // bringSubviewToFont 把指定子视图移动到最前面
//    // sendSubviewToBack 把指定子视图一道最后面
//    // exchangeSubviewAtIndex 交换
//    // 将红色视图移动到最前面
//    [self.window bringSubviewToFront:aView];
//    // 将黄色视图移动到最后面
//    [self.window sendSubviewToBack:cView];
//    // 将黄色和红色视图交换
//    [self.window exchangeSubviewAtIndex:0 withSubviewAtIndex:4];
//    // 从父视图一处
//    [aView removeFromSuperview];
//    [bView removeFromSuperview];
//    [cView removeFromSuperview];
//    [dView removeFromSuperview];
//    [eView removeFromSuperview];
    
    
#pragma mark - UIView属性
//    // 1.创建控件对象
//    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 275, 567)];
//    // 2.配置属性
//    
//    // (1)设置背景颜色
//    view.backgroundColor = [UIColor yellowColor];
//    
//    // (2)设置显隐性
//    view.hidden = NO; // 默认是NO
//    // (3)设置透明度
//    view.alpha = 0.1;// 取值范围0 ~ 1.0 默认:1.0
//    // (6)tag 值
//    view.tag = 101;// 一般设置大于100的数值
//    // 3.添加父视图
//    [self.window addSubview:view]
//    ;
//    // (4)获取父视图
//    NSLog(@"%@",view.superview);
//    // (5)获取子视图
//    [view addSubview:eView];
//    NSArray *arr = view.subviews;
//    NSLog(@"%@",arr);
//    
//    
//    
//    // 4.释放所有权
//    [view release];
//    
//    // 通过 tag值 获取对应的控件对象
//    UIView *tagView = [self.window viewWithTag:101];
//    tagView.backgroundColor = [UIColor redColor];
    
#pragma mark - UILabel : 用来显示文字的控件,也表示屏幕上的一个矩形区域 和UIView相比仅仅多了文字的处理功能 在使用上没有差别
    
//    // 1.创建控件对象
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 175, 200)];
//    // 2.配置属性
//    label.backgroundColor = [UIColor yellowColor];
//    // (1)配置文字
//    label.text = @"每周一,我就发现 我是一个超越公交车的男人";
//    // (2)配置文字的颜色
//    label.textColor = [UIColor redColor];
//    // (3)配置字体大小
//    label.font = [UIFont systemFontOfSize:20];
////    label.font =[UIFont fontWithName:@"Helvetica-Bold" size:20];
//    // (4)设置行数
//    label.numberOfLines = 0; // 默认1行 设置为0代表自动换行
//    // (5)对齐风格
//    label.textAlignment = NSTextAlignmentRight;
//    // (6)阴影的颜色
//    label.shadowColor = [UIColor greenColor];
//    // (7)设置阴影偏移量
//    label.shadowOffset = CGSizeMake(-5, -5);
//    // 3.添加父视图
//    [self.window addSubview:label];
//    // 4.释放所有权
//    [label release];
    UIView *sun = [[UIView alloc] initWithFrame:CGRectMake(50, 100, 200, 200)];
    sun.backgroundColor = [UIColor redColor];
    // 切圆
    sun.layer.cornerRadius = 50;
    sun.layer.masksToBounds = YES;
    [self.window addSubview:sun];
    [sun release];
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
