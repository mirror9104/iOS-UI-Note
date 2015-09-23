//
//  FindPassViewController.m
//  LessonUI-15-StoryBoard
//
//  Created by huchunyuan on 15/9/4.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import "FindPassViewController.h"
#import "MBProgressHUD+MJ.h"
@interface FindPassViewController ()<UITextFieldDelegate>
@property (retain, nonatomic) IBOutlet UITextField *mailTF;// 邮箱


@end

@implementation FindPassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
// 确定
- (IBAction)confirmClick:(id)sender {
    [MBProgressHUD showSuccess:@"已发送邮件"];
}
// 取消
- (IBAction)cancleClick:(id)sender {
    [MBProgressHUD showSuccess:@"取消找回"];
    [self.navigationController popToRootViewControllerAnimated:YES];
}
// 回收键盘
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
    [_mailTF release];
    [super dealloc];
}
@end
