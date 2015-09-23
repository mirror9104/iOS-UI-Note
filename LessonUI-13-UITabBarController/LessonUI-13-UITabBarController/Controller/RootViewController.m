//
//  RootViewController.m
//  LessonUI-13-UITabBarController
//
//  Created by huchunyuan on 15/8/30.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import "RootViewController.h"
#import "FirstViewController.h"
#import "ScondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"
#import "FixthViewController.h"
#import "SixthViewController.h"
#import "SeventhViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 配置viewControllers
    [self configViewControllers];
}
/** 
 UITabBarController 也是和UINavigationController一样是多视图控制器,但是它和导航视图控制器不太一样,在对视图控制器管理上,导航视图控制器通过push pop进行栈的管理,界面之间是由层级关系.
 标签视图控制器 管理的视图控制器是并列存在的关系 不存在层级关系 我们通过点击不同的标签进行不同界面的切换
 
 */
// 配置viewControllers
- (void)configViewControllers{
    // 1
    FirstViewController *firstVC = [[[FirstViewController alloc] init] autorelease];
    UINavigationController *firstNavi = [[[UINavigationController alloc] initWithRootViewController:firstVC] autorelease];
//    // 这只tittle
//    firstVC.navigationItem.title = @"主页";
//    // 这只tabBarItem的tittle
//    firstNavi.tabBarItem.title = @"主页";
    // 直接设置title
    firstVC.title = @"主页";
    firstNavi.tabBarItem.image = [UIImage imageNamed:@"53-house.png"];
    // 2
    ScondViewController *secondVC = [[[ScondViewController alloc] init] autorelease];
    UINavigationController *secondNavi = [[[UINavigationController alloc] initWithRootViewController:secondVC] autorelease];
    secondVC.title = @"第二页";
    secondNavi.tabBarItem.image = [UIImage imageNamed:@"80-shopping-cart.png"];
    // 3
    ThirdViewController *thirdVC = [[[ThirdViewController alloc] init] autorelease];
    UINavigationController *thirdNavi = [[[UINavigationController alloc] initWithRootViewController:thirdVC] autorelease];
    thirdVC.title = @"发现";
    thirdNavi.tabBarItem.image = [UIImage imageNamed:@"12-eye.png"];
    thirdNavi.tabBarItem.badgeValue = @"就是不消失";
    // 4
    FourthViewController *fourthVC = [[[FourthViewController alloc] init] autorelease];
    UINavigationController *fourthNavi = [[[UINavigationController alloc] initWithRootViewController:fourthVC] autorelease];
    fourthVC.title = @"第四页";
    fourthNavi.tabBarItem.image = [UIImage imageNamed:@"35-shopping-bag.png"];
    // 5
    FixthViewController *fixthVC = [[[FixthViewController alloc] init] autorelease];
    UINavigationController *fixthNavi = [[[UINavigationController alloc] initWithRootViewController:fixthVC] autorelease];
    fixthVC.title = @"第五页";
    fixthNavi.tabBarItem.image = [UIImage imageNamed:@"28-star.png"];
    // 6
    SixthViewController *sixthVC = [[[SixthViewController alloc] init] autorelease];
    UINavigationController *sixthNavi = [[[UINavigationController alloc] initWithRootViewController:sixthVC] autorelease];
    sixthVC.title = @"第六页";
    sixthNavi.tabBarItem.image = [UIImage imageNamed:@"36-toolbox.png"];
    // 7
    SeventhViewController *seventhVC = [[[SeventhViewController alloc] init] autorelease];
    UINavigationController *seventhNavi = [[[UINavigationController alloc] initWithRootViewController:seventhVC] autorelease];
    seventhVC.title = @"第七页";
    seventhNavi.tabBarItem.image = [UIImage imageNamed:@"20-gear2.png"];
    // 设置 tabBArController 控制的视图控制器们
    self.viewControllers = @[firstNavi,secondNavi,thirdNavi,fourthNavi,fixthNavi,sixthNavi,seventhNavi];
    
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
