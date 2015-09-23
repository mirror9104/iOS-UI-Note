//
//  RootViewController.m
//  LessonUI-03-UIViewController2
//
//  Created by huchunyuan on 15/8/18.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import "RootViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"

@interface RootViewController ()
@property (nonatomic,retain)FirstViewController *firstVC;
@property (nonatomic,retain)SecondViewController *secondVC;
@property (nonatomic,assign)BOOL isRedView;// 判断是否是红色
@end

@implementation RootViewController
- (void)dealloc{
    self.firstVC = nil;
    self.secondVC = nil;
    [super dealloc];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // 创建firstVC 对象
    self.firstVC = [[[FirstViewController alloc] init] autorelease];
    // 就爱那个firstVC 设置为当视图控制器的子视图控制器
    [self addChildViewController:_firstVC];
    [self.view addSubview:_firstVC.view];
    
    self.secondVC = [[[SecondViewController alloc] init] autorelease];
    [self.view addSubview:_secondVC.view];
    [self addChildViewController:_secondVC];
    // 创建btn
    UIButton *bt = [UIButton buttonWithType:UIButtonTypeSystem];
    bt.frame = CGRectMake(0, 0, 100, 50);
    bt.center = CGPointMake(375/2, 100);
    [bt setTitle:@"切换" forState:UIControlStateNormal];
    // 添加点击时间
    [bt addTarget:self action:@selector(change:) forControlEvents:UIControlEventTouchUpInside];
    self.isRedView = NO;
    [self.view addSubview:bt];
    
}
- (void)change:(UIButton *)bt{
    if (_isRedView) {
        [self.view bringSubviewToFront:_secondVC.view];
        // 更改布尔 状态
        self.isRedView = NO;
    }else{
        [self.view bringSubviewToFront:_firstVC.view];
        // 更改布尔 状态
        self.isRedView = YES;
    }
    [self.view bringSubviewToFront:bt];
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
