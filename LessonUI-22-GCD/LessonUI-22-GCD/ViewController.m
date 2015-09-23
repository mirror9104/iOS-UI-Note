//
//  ViewController.m
//  LessonUI-22-GCD
//
//  Created by huchunyuan on 15/9/15.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,retain)NSLock *lock;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.lock = [[[NSLock alloc] init] autorelease];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 串行 多个任务执行时,只能一个个执行 比如,只有当第一个任务执行完,第二个才能执行 接着是第三个..
// 推荐使用自己创建的 系统创建的在主线程中,手动的在子线程 不会阻塞界面
- (IBAction)serialQueue:(id)sender {
    // 1.系统的创建串行队列的方法
//    dispatch_queue_t systemQueue = dispatch_get_main_queue();
//    
//    dispatch_async(systemQueue, ^{
//        NSLog(@"%@-------%d 任务一",[NSThread currentThread],[NSThread isMainThread]);
//    });
//    
//    dispatch_async(systemQueue, ^{
//        NSLog(@"%@-------%d 任务二",[NSThread currentThread],[NSThread isMainThread]);
//    });
//    
//    dispatch_async(systemQueue, ^{
//        NSLog(@"%@-------%d 任务三",[NSThread currentThread],[NSThread isMainThread]);
//    });
//    
//    dispatch_async(systemQueue, ^{
//        NSLog(@"%@-------%d 任务四 ",[NSThread currentThread],[NSThread isMainThread]);
//    });
    
    
    // 2.自己创建串行队列
    // 第一个参数:"com.lanou.www"给定标识
    // 第二个参数:DISPATCH_QUEUE_SERIAL)代表一个串行队列
    dispatch_queue_t queue = dispatch_queue_create("com.lanou.www", DISPATCH_QUEUE_SERIAL);
    
    // 任务添加
    dispatch_async(queue, ^{
        NSLog(@"%@-----%d 任务一",[NSThread currentThread],[NSThread isMainThread]);
    });
    
    dispatch_async(queue, ^{
        NSLog(@"%@-----%d 任务二",[NSThread currentThread],[NSThread isMainThread]);
    });
    
    dispatch_async(queue, ^{
        NSLog(@"%@-----%d 任务三",[NSThread currentThread],[NSThread isMainThread]);
    });
    
    dispatch_async(queue, ^{
        NSLog(@"%@-----%d 任务四",[NSThread currentThread],[NSThread isMainThread]);
    });
    
    
    
}

// 并行 推荐系统创建 因为有预留参数 不怕版本迭代,手动和系统无太大区别
- (IBAction)concurrentQueue:(id)sender {
    // 1.使用系统创建的并行队列
//    dispatch_queue_t systemQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    
//    // 添加任务
//    // 第一个参数 设置优先级
//    // 第二个参数 预留参数 当前给0
//    dispatch_async(systemQueue, ^{
//        NSLog(@"%@-----%d 任务1",[NSThread currentThread],[NSThread isMainThread]);
//    });
//    dispatch_async(systemQueue, ^{
//        NSLog(@"%@-----%d 任务2",[NSThread currentThread],[NSThread isMainThread]);
//    });
//    dispatch_async(systemQueue, ^{
//        NSLog(@"%@-----%d 任务3",[NSThread currentThread],[NSThread isMainThread]);
//    });
//    dispatch_async(systemQueue, ^{
//        NSLog(@"%@-----%d 任务4",[NSThread currentThread],[NSThread isMainThread]);
//    });
    
    // 2.自己创建并行队列
    dispatch_queue_t myQueue = dispatch_queue_create("com.huchunyuan.www", DISPATCH_QUEUE_CONCURRENT);
    
    // 添加任务
    dispatch_async(myQueue, ^{
        NSLog(@"%@-----%d 任务1",[NSThread currentThread],[NSThread isMainThread]);
    });
    dispatch_async(myQueue, ^{
        NSLog(@"%@-----%d 任务2",[NSThread currentThread],[NSThread isMainThread]);
    });
    dispatch_async(myQueue, ^{
        NSLog(@"%@-----%d 任务3",[NSThread currentThread],[NSThread isMainThread]);
    });
    dispatch_async(myQueue, ^{
        NSLog(@"%@-----%d 任务4",[NSThread currentThread],[NSThread isMainThread]);
    });
}

// 分组
- (IBAction)groupQueue:(id)sender {
    // 创建分组
    dispatch_group_t group = dispatch_group_create();
    
    // 使用系统创建并行
    dispatch_queue_t systemQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    
    
    // 添加任务
    dispatch_group_async(group, systemQueue, ^{
        NSLog(@"%@-----%d 任务1",[NSThread currentThread],[NSThread isMainThread]);
    });
    dispatch_group_async(group, systemQueue, ^{
        NSLog(@"%@-----%d 任务2",[NSThread currentThread],[NSThread isMainThread]);
    });
    dispatch_group_async(group, systemQueue, ^{
        NSLog(@"%@-----%d 任务3",[NSThread currentThread],[NSThread isMainThread]);
    });
   
    dispatch_group_async(group, systemQueue, ^{
        NSLog(@"%@-----%d 任务4",[NSThread currentThread],[NSThread isMainThread]);
    });
    // 当分组中所有任务完成时 执行
    dispatch_group_notify(group, systemQueue, ^{
        NSLog(@"分组中的任务全部完成");
        NSLog(@"%@-----%d 任务4",[NSThread currentThread],[NSThread isMainThread]);
    });
   
}

// 障碍
- (IBAction)barrier:(id)sender {
    
    // 创建自己的并行
    dispatch_queue_t myQueue = dispatch_queue_create("com.huchunyuana.www", DISPATCH_QUEUE_CONCURRENT);;
    
    // 加载过程
    dispatch_async(myQueue, ^{
        NSLog(@"A 加载....");
    });
    dispatch_async(myQueue, ^{
        NSLog(@"B 加载....");
    });
    dispatch_async(myQueue, ^{
        NSLog(@"C 加载....");
    });
    
    dispatch_barrier_async(myQueue, ^{
        NSLog(@"全部加载完成,开始进入游戏");
    });
    
    // 进入游戏
    dispatch_async(myQueue, ^{
        NSLog(@"A进入游戏");
    });
    dispatch_async(myQueue, ^{
        NSLog(@"B进入游戏");
    });
    dispatch_async(myQueue, ^{
        NSLog(@"C进入游戏");
    });
    
    // 回到主线程
    dispatch_barrier_async(myQueue, ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"%@-----%d 任务4",[NSThread currentThread],[NSThread isMainThread]);
            NSLog(@"敌军还有30秒钟到达战场,碾碎他们");
        });
    });
    
}

// 一次
- (IBAction)once:(id)sender {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSLog(@"asd");
    });
}
- (IBAction)buyTicket:(id)sender {
    
    // 创建并行队列
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    // 买票
    for (int i = 0; i < 11; i++) {
        // 添加买票任务
        dispatch_async(queue, ^{
            [self buy];
        });
    }
    
}
- (void)buy{
    static int count = 10;// 10张票
    // 加锁
    [_lock lock];
    if (count<=0) {
        NSLog(@"没票了");
    }else{
        count --;// 每买一次 票数减一
        NSLog(@"购买了一张票,第%d张票",10-count);
    }
    [_lock unlock];
    
}



@end
