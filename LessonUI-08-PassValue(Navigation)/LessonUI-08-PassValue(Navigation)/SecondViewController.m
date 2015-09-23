//
//  SecondViewController.m
//  LessonUI-08-PassValue(Navigation)
//
//  Created by huchunyuan on 15/8/24.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
@property (nonatomic,retain)UITextField *tf;
@end


@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    self.navigationItem.title = @"SecondVC";
    // 布局tf
    [self layouttf];
}
// 布局tf
- (void)layouttf{
    self.tf = [[UITextField alloc] initWithFrame:CGRectMake(50, 100, 275, 50)];
    // 圆角
    _tf.text = _tfStr;
    _tf.borderStyle = UITextBorderStyleRoundedRect;
    _tf.placeholder = @"请任意输入";
    [self.view addSubview:_tf];
    [_tf release];                                                                                                                                                                                                                                                                                                                                                                                                         
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - 代理传值
- (void)viewWillDisappear:(BOOL)animated{
    // 一定要调super
    [super viewWillDisappear:animated];
    // 通知代理 执行协议中的方法 把Tf上的字符串拿走
    [_delegate StringToFirst:_tf.text];
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
