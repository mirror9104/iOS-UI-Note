//
//  FourthViewController.m
//  LessonUI-08-UINavigationCoontroller
//
//  Created by huchunyuan on 15/8/24.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import "FourthViewController.h"

@interface FourthViewController ()

@end

@implementation FourthViewController

// 任何ViewControll都有这四种方法
// 视图将要出现
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"4viewWillAppear");
}
// 视图已经出现
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"4viewDidAppear");
    NSLog(@"%@",self.navigationController.viewControllers);
}
// 视图将要消失
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    NSLog(@"4viewWillDisappear");
}
// 视图已经消失
- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    NSLog(@"4viewDidDisappear");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    // 设置title
    self.navigationItem.title = @"fourthVC";
    // Do any additional setup after loading the view.
    [self layoutButton];
}
- (void)layoutButton{
    UIButton *bt2 = [UIButton buttonWithType:UIButtonTypeSystem];
    bt2.frame = CGRectMake(0, 64, 100, 50);
    bt2.backgroundColor = [UIColor whiteColor];
    // 设置title
    [bt2 setTitle:@"上一个" forState:UIControlStateNormal];
    // 添加点击事件
    [bt2 addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bt2];
}

- (void)backAction:(UIButton *)bt{
//    [self.navigationController popViewControllerAnimated:YES];
    // 返回root视图
    // popToRootViewControllerAnimated 直接返回(pop)到根视图控制器
//    [self.navigationController popToRootViewControllerAnimated:YES];
    // 返回哪一个controller
    // popToViewController:animated:返回(pop)到指定视图控制器
    [self.navigationController popToViewController:self.navigationController.viewControllers[1] animated:YES];
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
