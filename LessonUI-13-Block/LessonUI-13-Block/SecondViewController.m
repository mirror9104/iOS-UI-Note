//
//  SecondViewController.m
//  LessonUI-13-Block
//
//  Created by huchunyuan on 15/8/30.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import "SecondViewController.h"
#import "RootViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController
- (void)dealloc{
    // 释放block
    Block_release(_passValue);
    [super dealloc];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self layoutTextField];
    [self customizeNavigationItem];
}
- (void)customizeNavigationItem{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:(UIBarButtonItemStyleDone) target:self action:@selector(leftAction)];
}
- (void)leftAction{
    [self.navigationController popViewControllerAnimated:YES];
//    [self.delegate backStr:_tf.text];
    self.passValue(_tf.text);
    
}
- (void)layoutTextField{
    self.tf = [[UITextField alloc] initWithFrame:CGRectMake(10, 100, 350, 50)];
    _tf.borderStyle = UITextBorderStyleRoundedRect;
    _tf.text = _tfstr;
    [self.view addSubview:_tf];
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
