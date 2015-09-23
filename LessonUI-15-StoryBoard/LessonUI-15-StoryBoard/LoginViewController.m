//
//  LoginViewController.m
//  LessonUI-15-StoryBoard
//
//  Created by huchunyuan on 15/9/4.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import "LoginViewController.h"
#import "MBProgressHUD+MJ.h"

@interface LoginViewController ()<UITextFieldDelegate>
@property (retain, nonatomic) IBOutlet UITextField *nameTF;// 用户名
@property (retain, nonatomic) IBOutlet UITextField *passWordTF; // 密码

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 设置代理 等同于控件拖delegate线
    // self.nameTF.delegate = self;
    // self.passWordTF.delegate = self
    
}
- (IBAction)loginClick:(id)sender {
     [MBProgressHUD showSuccess:@"登陆成功"];
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


- (void)dealloc {
    [_nameTF release];
    [_passWordTF release];
    [super dealloc];
}
@end
