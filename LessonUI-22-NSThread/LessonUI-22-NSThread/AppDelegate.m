//
//  AppDelegate.m
//  LessonUI-22-NSThread
//
//  Created by huchunyuan on 15/9/15.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()
@property (nonatomic,retain)UIImageView *imageView;
@end

@implementation AppDelegate

/** 
 
 每一个应用程序都可以看做一个进程,每一个进程可以包含多个线程,但是至少有一个线程(一般由系统默认创建)我们称之为主线程,如果想要多线程去完成多任务工作 需要我们手动开辟创建子线程 一般我们将耗时的操作放入子线程进行,对于UI界面的刷新我们仍然在主线程中操作 否则,会发生另一现象
 
 关于多线程的好处和坏处:
    1.使用多线程可以把程序中的耗时操作放入子线程进行后台处理,比如网络请求,图片下载
    2.发挥多核处理器的优势,让程执行更佳流畅,更佳迅速 用户体现好
 
 坏处:
    1.大量的线程开辟,降低代码的可读性
    2.线程的开辟就意味着需要更多的资源
    3.在进行多线程工作,会发生多个线程对统一资源进行抢夺 发生线程安全问题
 
 */
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
#pragma mark - 主线程阻塞现象
    
    UIButton *bt1 = [UIButton buttonWithType:UIButtonTypeSystem];
    bt1.frame = CGRectMake(0, 100, 100, 50);
    [bt1 setTitle:@"打印1" forState:UIControlStateNormal];
    [bt1 addTarget:self action:@selector(print1) forControlEvents:UIControlEventTouchUpInside];
    [self.window addSubview:bt1];



    
    UIButton *bt2 = [UIButton buttonWithType:UIButtonTypeSystem];
    bt2.frame = CGRectMake(275, 100, 100, 50);
    [bt2 setTitle:@"打印2" forState:UIControlStateNormal];
    [bt2 addTarget:self action:@selector(print2) forControlEvents:UIControlEventTouchUpInside];
    [self.window addSubview:bt2];
    
#pragma mark -子线程开辟 第一种方式 使用NSThread
    
    // [NSThread currentThread] 获取当前的线程
    // [NSThread isMainThread] 获取当前的线程是否是主线程
    
    // 主线程的编号(number)为1 名字为mian
    
//    NSLog(@"%@----%d",[NSThread currentThread],[NSThread isMainThread]);
    
    // 1.使用类方法 开辟子线程
//    [NSThread detachNewThreadSelector:@selector(print1) toTarget:self withObject:nil];
//    [NSThread detachNewThreadSelector:@selector(print2) toTarget:self withObject:nil];
    
//    // 2.创建对象 开辟子线程
//    NSThread *thread1 = [[NSThread alloc] initWithTarget:self selector:@selector(print1) object:nil];
//    NSThread *thread2 = [[NSThread alloc] initWithTarget:self selector:@selector(print2) object:nil];
//    
//    // 开启子线程 并执行任务
//    [thread1 start];
//    [thread2 start];
    
    
#pragma mark - 开辟子线程的 第二种方式 使用NSObject提供的方法

//    [self performSelectorInBackground:@selector(print1) withObject:nil];
//    [self performSelectorInBackground:@selector(print2) withObject:nil];
    
    
#pragma mark - 练习 开辟子线程进行图片请求
    // @"http://image.zcool.com.cn/56/13/1308200901454.jpg"
//    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 150, 335, 500)];
//    _imageView.backgroundColor = [UIColor purpleColor];
//    [self.window addSubview:_imageView];
//    [_imageView release];
    

    
//    UIButton *bt3 = [UIButton buttonWithType:UIButtonTypeSystem];
//    bt3.frame = CGRectMake(162, 100, 100, 50);
//    [bt3 addTarget:self action:@selector(requestImage) forControlEvents:UIControlEventTouchUpInside];
//    [bt3 setTitle:@"asdasd" forState:UIControlStateNormal];
//    [self.window addSubview:bt3];
    
    
#pragma mark -开辟子线程的第三种方式 NSOperationQueue
    
    // 创建任务 NSOperation
    // 1.使用block 创建任务
    NSBlockOperation *opeartopn1 = [NSBlockOperation blockOperationWithBlock:^{
        
        NSLog(@"%@------%d 任务1",[NSThread currentThread],[NSThread isMainThread]);
    
    }];
    NSBlockOperation *operation2 = [NSBlockOperation blockOperationWithBlock:^{
        
        NSLog(@"%@-----%d 任务2",[NSThread currentThread],[NSThread isMainThread]);
    }];
    
    // 2.使用NSInvocationOperation 创建任务
    NSInvocationOperation *operation3 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(action1:) object:nil];
    
    NSInvocationOperation *operation4 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(action2:) object:nil];
    
    
    // 创建任务队列
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    // 控制开辟线程个数
    queue.maxConcurrentOperationCount = 1; 
    
    // 添加任务
//    [queue addOperation:opeartopn1];
//    [queue addOperation:operation2];
//    [queue addOperation:operation3];
//    [queue addOperation:operation4];
    
    // 线程 重用问题
    for (int i=0; i<20; i++) {
       
        // 创建任务
        NSBlockOperation *operation = [NSBlockOperation blockOperationWithBlock:^{
           NSLog(@"%@-----%d 任务%d",[NSThread currentThread],[NSThread isMainThread],i);
        }];
        // 添加到任务队列
        [queue addOperation:operation];
    }
    return YES;
}

- (void)action1:(NSInvocationOperation *)operation{
    NSLog(@"%@-----%d 任务3",[NSThread currentThread],[NSThread isMainThread]);
    
}

- (void)action2:(NSInvocationOperation *)operation{
    NSLog(@"%@-----%d 任务4",[NSThread currentThread],[NSThread isMainThread]);
    
}

- (void)requestImage{
    // 1.按主线程进行同步请求
//        [self loadImage];
    
    // 1.在子线程进行 同步请求
//    [NSThread detachNewThreadSelector:@selector(loadImage) toTarget:self withObject:nil];
    // 2.使用NSObject提供的方法 开辟子线程
    [self performSelectorInBackground:@selector(loadImage) withObject:nil];
    
}
// 请求图片
- (void)loadImage{
    NSLog(@"%@ --- %d",[NSThread currentThread],[NSThread isMainThread]);
    // 创建URL
    NSURL *url = [NSURL URLWithString:@"http://image.zcool.com.cn/56/13/1308200901454.jpg"];
    
    // 创建NSURLRequest 对象
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    // 发送同步请求
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    
    // 对于网络请求 可以放在子线程进行操作 但是对于UI界面的刷新重新赋值 需要回到主线程进行
    // 提示主线程赋值
    [self performSelectorOnMainThread:@selector(setImageWithData:) withObject:data waitUntilDone:YES];

    
    
}

- (void)setImageWithData:(NSData *)data{
    self.imageView.image = [UIImage imageWithData:data];
}

- (void)print1{
    for (int i = 0; i < 100; i++) {
        NSLog(@"你好%d",i);
    }
    NSLog(@"%@----%d",[NSThread currentThread],[NSThread isMainThread]);
}

- (void)print2{
    for (int i = 0; i<100; i++) {
        NSLog(@"hello%d",i);
    }
    NSLog(@"%@----%d",[NSThread currentThread],[NSThread isMainThread]);

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
