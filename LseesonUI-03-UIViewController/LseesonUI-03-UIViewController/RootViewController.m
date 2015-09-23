//
//  RootViewController.m
//  LseesonUI-03-UIViewController
//
//  Created by huchunyuan on 15/8/17.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import "RootViewController.h"
#import "LoginView.h"

@interface RootViewController ()

@end

@implementation RootViewController
// 初始化 指定初始化方法:调用任何初始化方法都会执行该方法
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}
// 当视图控制器需要view的时候 该方法调用 创建view并给self.view赋值
// 当我们需要自定义视图控制器的view 我们需要重写loadView方法 进行自定义的视图的创建 并给self.view 赋值(注意!! 此时不能调用[super loadView])
- (void)loadView{
    // 创建登录视图
    LoginView *loginView = [[LoginView alloc] initWithFrame:CGRectMake(0, 0, 375, 667)];
    // 将登录视图 指定为当前视图控制器的view
    self.view = loginView;
}
// 当loadView执行完该方法会立即调用.进行视图的布局
- (void)viewDidLoad {
    [super viewDidLoad];
    // self.view是视图控制器的属性 默认会为我们自动创建 也就是说,视图控制器会自带一个视图 就是self.view
    self.view.backgroundColor = [UIColor yellowColor];
    // 创建登录界面
//    LoginView *loginView = [[LoginView alloc] initWithFrame:self.view.bounds];
//    [self.view addSubview:loginView];
//    [loginView release];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    NSLog(@"内存警告!!! %s  %d",__FUNCTION__,__LINE__);
    // 将加载过 并且不在window上显示的视图 进行销毁 回收控件
    if ([self isViewLoaded] && !self.view.window) {
        // 销毁
        self.view  = nil;
    }
}
#pragma mark - 旋转 
// 设置 当前视图控制器 是否支持旋转
- (BOOL)shouldAutorotate{
    return YES;
}
#pragma mark - 被启用的旋转方法
// 屏幕将要旋转式 出发 之前一般用来进行视频音频的暂停操作
// 这只当前试图控制器 支持旋转的方向
- (NSUInteger)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskAll;
}
// 旋转动画将要开始时出发 之前一般进行过度动画的控制
- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration{
    NSLog(@"屏幕将要旋转");
}
// 旋转结束时 触发 之前一般进行暂停视频音频的重新播放
- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration{
    NSLog(@"将要开始旋转动画");
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation{
    NSLog(@"结束旋转");
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
