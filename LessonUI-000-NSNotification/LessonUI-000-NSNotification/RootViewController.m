//
//  RootViewController.m
//  LessonUI-000-NSNotification
//
//  Created by huchunyuan on 15/9/17.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import "RootViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configViewControllers];
}
- (void)configViewControllers{
    FirstViewController *firstVC = [[FirstViewController alloc] init];
    UINavigationController *firstNavc = [[UINavigationController alloc] initWithRootViewController:firstVC];
    firstVC.title = @"First";
    [firstVC release];
    
    
    SecondViewController *secondVC = [[SecondViewController alloc] init];
    UINavigationController *seconNavc = [[UINavigationController alloc] initWithRootViewController:secondVC];
    secondVC.title = @"Second";
    [secondVC release];
    
    ThirdViewController *thirdVC = [[ThirdViewController alloc] init];
    UINavigationController *thirdNavc = [[UINavigationController alloc] initWithRootViewController:thirdVC];
    thirdVC.title = @"Third";
    [thirdVC release];
    
    FourthViewController *fourthVC = [[FourthViewController alloc] init];
    UINavigationController *fourthNavc = [[UINavigationController alloc] initWithRootViewController:fourthVC];
    fourthVC.title = @"fourth";
    [fourthVC release];
    
    self.viewControllers = @[firstNavc,seconNavc,thirdNavc,fourthNavc];
    
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
