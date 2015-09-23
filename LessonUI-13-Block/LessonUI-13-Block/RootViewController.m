//
//  RootViewController.m
//  LessonUI-13-Block
//
//  Created by huchunyuan on 15/8/30.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import "RootViewController.h"
#import "SecondViewController.h"

@interface RootViewController ()<backDelegate>

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self customizeNavigationItem];
    void (^change)(NSString *) = ^ void (NSString *str){
        _tf.text = str;
    };
    
}
- (void)customizeNavigationItem{
    self.tf = [[UITextField alloc] initWithFrame:CGRectMake(10, 100, 350, 50)];
    _tf.placeholder = @"123123";
    _tf.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:_tf];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"push" style:(UIBarButtonItemStyleDone) target:self action:@selector(rigthAction)];
    
}
- (void)rigthAction{
    SecondViewController *secVC = [[[SecondViewController alloc] init] autorelease];
    secVC.tfstr = _tf.text;
    // 对于Block内部在使用外部对象的时候会对该对象持有一份所有权.
    // 如果不想持有 使用__block修饰该对象
    // 在ARC情况下 使用__weak
    
    __block RootViewController *RootVC = self;
    // 使用属性接受block语法块
    secVC.passValue = ^ void (NSString *string){
        NSLog(@"block=----=====");
        RootVC.tf.text = string;
    };
    
    secVC.delegate = self;
    [self.navigationController pushViewController:secVC animated:YES];
}
//- (void)backStr:(NSString *)str{
//    _tf.text = str;
//}
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
