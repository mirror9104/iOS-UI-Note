//
//  RootViewController.m
//  LessonUI-06-UISegmentedControl
//
//  Created by huchunyuan on 15/8/20.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import "RootViewController.h"
#import "LoginView.h"
#import "PasswordBackView.h"
#import "RegistView.h"

@interface RootViewController ()
/** 登陆界面 */
@property (nonatomic,retain)LoginView *loginView;
/** 密码界面 */
@property (nonatomic,retain)PasswordBackView *passwordView;
/** 注册界面 */
@property (nonatomic,retain)RegistView *registView;
@end

@implementation RootViewController
- (void)dealloc{
    self.loginView = nil;
    self.passwordView = nil;
    self.registView = nil;
    [super dealloc];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 布局UISegementedControl
    [self layoutSegmentedControl];
    // 布局登陆 注册 找回密码
    [self layoutViews];
    
}

// 布局登陆 注册 找回密码
- (void)layoutViews{
    // 登陆
    self.loginView = [[LoginView alloc] initWithFrame:CGRectMake(0, 100, 375, 567)];
    [self.view addSubview:_loginView];
    [_loginView release];
    // 注册
    self.registView = [[RegistView alloc] initWithFrame:CGRectMake(0, 100, 375, 567)];
    [self.view addSubview:_registView];
    [_registView release];
    // 找回密码
    self.passwordView = [[PasswordBackView alloc] initWithFrame:CGRectMake(0, 100, 375, 567)];
    [self.view addSubview:_passwordView];
    [_passwordView release];
    
    // 将登陆界面移动到最前面
    [self.view bringSubviewToFront:_loginView];
}
// 布局segmentControl
- (void)layoutSegmentedControl{
    // UISegmentedControl 是UI中的分段控件,相当于一组button 点击不同的分段 进行不同界面的切换展示
    // 在使用上 和UI中其他控件没有区别 分四步
    // 1.创建对象
    UISegmentedControl *segment = [[UISegmentedControl alloc] initWithItems:@[@"登陆",@"注册",@"找回密码"]];
    // 2.配置属性
    // (1)frame center
    segment.frame = CGRectMake(0, 0, 200, 25);
    segment.center = CGPointMake(375/2, 50);
    segment.backgroundColor = [UIColor whiteColor];
    // 设置点击的颜色
    segment.tintColor = [UIColor purpleColor];
    // 设置选中的分段
    segment.selectedSegmentIndex = 1;
    // 修改分段显示内容
    [segment setTitle:@"登陆" forSegmentAtIndex:1];
    [segment setTitle:@"注册" forSegmentAtIndex:0];
    
    // 添加事件
    [segment addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
    // 3.添加父视图
    [self.view addSubview:segment];
    // 4.释放所有权
    [segment release];
}
#pragma mark - 事件处理
- (void)segmentAction:(UISegmentedControl *)segment{
    NSLog(@"%ld",segment.selectedSegmentIndex);
    if (segment.selectedSegmentIndex == 0) {
        [self.view bringSubviewToFront:_registView];
    }else if (segment.selectedSegmentIndex == 1){
        [self.view bringSubviewToFront:_loginView];
    }else{
        [self.view bringSubviewToFront:_passwordView];
    }
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
