//
//  FirstViewController.m
//  LessonUI-08-UINavigationCoontroller
//
//  Created by huchunyuan on 15/8/24.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

// 任何ViewControll都有这四种方法
// 视图将要出现
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"1viewWillAppear");
}
// 视图已经出现
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"1viewDidAppear");
    NSLog(@"%@",self.navigationController.viewControllers);
}
// 视图将要消失
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    NSLog(@"1viewWillDisappear");
}
// 视图已经消失
- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    NSLog(@"1viewDidDisappear");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    // 设置Title
    self.navigationItem.title = @"FirstVC";
    // 布局button
//    [self layoutButton];
    // 设置navigationItem
    [self customizeNavigationItem];
}
// 自定义navigationItem
- (void)customizeNavigationItem{
    // rightBarButtonItem
    // 使用系统的风格
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(nextAction:)];
    
    // 创建button
    UIButton *rightBt = [UIButton buttonWithType:UIButtonTypeSystem];
    [rightBt setTitle:@"push" forState:UIControlStateNormal];
    [rightBt addTarget:self action:@selector(nextAction:)
      forControlEvents:UIControlEventTouchUpInside];
    rightBt.frame = CGRectMake(0, 0, 44, 44);
    // 通过button创建UIBarButtonItem
    UIBarButtonItem *righItem = [[UIBarButtonItem alloc] initWithCustomView:rightBt];
    // 给rightBarButtonItem 赋值
    self.navigationItem.rightBarButtonItem = righItem;
    [righItem release];
}
- (void)layoutButton{
    UIButton *bt = [UIButton buttonWithType:UIButtonTypeSystem];
    bt.frame = CGRectMake(275, 64, 100, 50);
    bt.backgroundColor = [UIColor yellowColor];
    // 设置title
    [bt setTitle:@"下一个" forState:UIControlStateNormal];
    // 添加点击事件
    [bt addTarget:self action:@selector(nextAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bt];
}
- (void)nextAction:(UIButton *)bt{
    // 1.创建下一个视图控制器对象
    SecondViewController *secondVc = [[SecondViewController alloc] init];
    // 2.通过导航视图控制器push操作
    [self.navigationController pushViewController:secondVc animated:YES];
}
- (void)didReceiveMemoryWarning {
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
