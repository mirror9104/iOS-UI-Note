//
//  RegistViewController.m
//  LessonUI-14-XibAndAutoLayout
//
//  Created by huchunyuan on 15/8/31.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import "RegistViewController.h"

@interface RegistViewController ()
@property (retain, nonatomic) IBOutlet UITextField *userNameTf;
@property (retain, nonatomic) IBOutlet UITextField *passWordTf;
@property (retain, nonatomic) IBOutlet UITextField *passWordTfAgain;
@property (retain, nonatomic) IBOutlet UITextField *telNumberTf;
@property (retain, nonatomic) IBOutlet UITextField *mailNameTf;
@end

@implementation RegistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/** 注册点击方法 */
- (IBAction)registClick:(id)sender {
    UIAlertController *alerCotroller = [UIAlertController alertControllerWithTitle:@"提示" message:nil preferredStyle:(UIAlertControllerStyleAlert)];
    if ([_userNameTf.text isEqualToString:@""] && [_passWordTf.text isEqualToString:@""] && [_passWordTfAgain.text isEqualToString:@""]) {
        alerCotroller.message = @"用户名密码为空";
    }else{
        alerCotroller.message = @"注册成功";
    }
    UIAlertAction *confrim = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction *action) {
       NSLog(@"确定");
    }];
    // 添加事件 模态
    [alerCotroller addAction:confrim];
    [self presentViewController:alerCotroller animated:YES completion:nil];
}
- (IBAction)cancleClick:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)dealloc {
    [_userNameTf release];
    [_passWordTf release];
    [_passWordTfAgain release];
    [_telNumberTf release];
    [_mailNameTf release];
    [super dealloc];
}
@end
