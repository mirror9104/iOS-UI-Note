//
//  RegistViewController.m
//  LessonUI-15-StoryBoard
//
//  Created by huchunyuan on 15/9/4.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import "RegistViewController.h"
#import "MBProgressHUD+MJ.h"
@interface RegistViewController ()<UITextFieldDelegate>
@property (retain, nonatomic) IBOutlet UITextField *nameTF;// 用户名
@property (retain, nonatomic) IBOutlet UITextField *passTF;// 密码
@property (retain, nonatomic) IBOutlet UITextField *passAgain;// 再次密码
@property (retain, nonatomic) IBOutlet UITextField *mailTF;// 邮件
@property (retain, nonatomic) IBOutlet UITextField *phoneTF;// 电话

@end

@implementation RegistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
// 注册
- (IBAction)registClick:(id)sender {
    [MBProgressHUD showSuccess:@"注册成功"];
}
// 取消
- (IBAction)cancleClick:(id)sender {
    [MBProgressHUD showSuccess:@"取消注册"];
    [self.navigationController popToRootViewControllerAnimated:YES];
}
// 回收键盘
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
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

- (void)dealloc {
    [_nameTF release];
    [_passTF release];
    [_passAgain release];
    [_mailTF release];
    [_phoneTF release];
    [super dealloc];
}
@end
