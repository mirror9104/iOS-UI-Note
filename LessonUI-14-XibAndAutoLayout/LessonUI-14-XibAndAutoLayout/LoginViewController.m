//
//  LoginViewController.m
//  LessonUI-14-XibAndAutoLayout
//
//  Created by huchunyuan on 15/8/31.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import "LoginViewController.h"
#import "RegistViewController.h"

@interface LoginViewController ()
@property (retain, nonatomic) IBOutlet UITextField *nameTf;
@property (retain, nonatomic) IBOutlet UITextField *passTf;
@property (nonatomic,copy)NSString *userName;// 用户名
@property (nonatomic,copy)NSString *passWord;// 密码
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title  = @"登陆";
    // Do any additional setup after loading the view from its nib.
    // 设置默认 账号密码
    self.userName = @"admin";
    self.passWord = @"123456";
}
- (IBAction)loginAction:(id)sender {
    NSLog(@"登陆了");
    // UIAlertController
    // sheet下面 Alert中间
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"提示" message:@"登陆成功" preferredStyle:(UIAlertControllerStyleAlert)];
    
    // 判断
    if ([_nameTf.text isEqualToString:_userName] && [_passTf.text isEqualToString:_passWord]) {
        // 设置message
        alertVC.message = @"欢迎回来";
    }else{
        alertVC.message = @"用户名或密码错误";
    }
    // 添加事件
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction *action) {
        NSLog(@"点击了");
    }];
    [alertVC addAction:action];
    // 模态显示
    [self presentViewController:alertVC animated:YES completion:nil];
}
- (IBAction)registAction:(id)sender {
    NSLog(@"注册了");
    RegistViewController *registVC = [[RegistViewController alloc] init];
    [self.navigationController pushViewController:registVC animated:YES];
    
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
    [_nameTf release];
    [_passTf release];
    [super dealloc];
}
@end
