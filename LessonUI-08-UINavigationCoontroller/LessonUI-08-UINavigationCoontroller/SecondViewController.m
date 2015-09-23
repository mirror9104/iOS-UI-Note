//
//  SecondViewController.m
//  LessonUI-08-UINavigationCoontroller
//
//  Created by huchunyuan on 15/8/24.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import "SecondViewController.h"
#import "ThirdViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

// 任何ViewControll都有这四种方法
// 视图将要出现
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"2viewWillAppear");
}
// 视图已经出现
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"2viewDidAppear");
    NSLog(@"%@",self.navigationController.viewControllers);
}
// 视图将要消失
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    NSLog(@"2viewWillDisappear");
}
// 视图已经消失
- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    NSLog(@"2viewDidDisappear");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    // Do any additional setup after loading the view.
    // 设置title
    self.navigationItem.title = @"secondVC";
//    [self layoutButton];
    [self NavigationBarButton];
    
}
- (void)NavigationBarButton{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(backAction:)];
//    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeSystem];
//    [leftBtn setTitle:@"pop" forState:UIControlStateNormal];
//    [leftBtn addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
//    leftBtn.frame = CGRectMake(0, 0, 44, 44);
//    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
//    self.navigationItem.leftBarButtonItem = leftItem;
//    [leftBtn release];
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [rightBtn setTitle:@"push" forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(nextAction:) forControlEvents:UIControlEventTouchUpInside];
    rightBtn.frame = CGRectMake(0, 0, 44, 44);
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = rightItem;
    [rightItem release];
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
    
    UIButton *bt2 = [UIButton buttonWithType:UIButtonTypeSystem];
    bt2.frame = CGRectMake(0, 64, 100, 50);
    bt2.backgroundColor = [UIColor whiteColor];
    // 设置title
    [bt2 setTitle:@"上一个" forState:UIControlStateNormal];
    // 添加点击事件
    [bt2 addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bt2];
}
// pop
- (void)backAction:(UIButton *)bt{
    // popViewControllerAnimated:返回(pop)上一级视图控制
    [self.navigationController popViewControllerAnimated:YES];

}

- (void)nextAction:(UIButton *)bt{
    // 1.创建下一个视图控制器对象
    ThirdViewController *thirdVc = [[ThirdViewController alloc] init];
    // 2.通过导航视图控制器push操作
    [self.navigationController pushViewController:thirdVc animated:YES];
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
