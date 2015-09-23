//
//  RootViewController.m
//  LessonUI-04-TouchEvent
//
//  Created by huchunyuan on 15/8/18.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import "RootViewController.h"
#import "TouchView.h"
#import "label.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 响应者链 : 由多个响应者组成的链状结构
    // 对于响应 有两个过程,响应事件查询过程 和 响应事件的处理过程.
    // 查询过程:硬件设备 --> AppLication --> window --> 视图控制器 --> View --> 视图的各个子视图 最终找到被触摸的子视图
    // 处理过程 : 被触摸的视图 --> 各个父视图 --> view --> 视图控制器 --> window --> Application --> ....遗失
    
    // 创建touchView
    TouchView *touchView = [[TouchView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    touchView.center = CGPointMake(375/2, 300);
    touchView.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:touchView];
    // 关闭自己以及所有子视图的用户交互 此时响应者链被打破 对于视图以及子视图来说 不会再对用户做出响应
//    self.view.userInteractionEnabled = NO;
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(100, 100, 100, 100);
    [btn setTitle:@"asd" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    // Label默认为不可交互的 需要重写类进行开启
    label *l = [[label alloc] initWithFrame:CGRectMake(200, 200, 100, 100)];
    l.backgroundColor  = [UIColor redColor];
    l.text = @"label";
    l.userInteractionEnabled = YES;
    [self.view addSubview:l];
}

//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
//    NSLog(@"视图控制器 被触摸了!!!");
//}
- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
