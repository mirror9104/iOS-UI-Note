//
//  RegistView.m
//  UI作业 -- 03(2)
//
//  Created by lanou3g on 15/5/20.
//  Copyright (c) 2015年 MFM. All rights reserved.
//

#import "RegistView.h"
@implementation RegistView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithFrame:(CGRect)frame
{
    NSArray *strArr1 = @[@"用户名",@"密码",@"密码确认",@"电话号码",@"邮箱"];
    NSArray *strArr2 = @[@"请输入用户名",@"请输入密码",@"请再次输入密码",@"请输入电话号码",@"请输入邮箱"];
    if ([super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        for (int i  = 0; i < 5 ; i++) {
            LTView *ltView = [[LTView alloc] initWithFrame:CGRectMake(50 ,50 * i, 350, 35)];
            ltView.label.text = strArr1[i];
            ltView.textField.placeholder = strArr2[i];
            ltView.tag = 100 + i;
            [self addSubview:ltView];
            ltView.textField.borderStyle = UITextBorderStyleRoundedRect;
            [ltView release];
            if (i == 1 || i == 2) {
                ltView.textField.secureTextEntry = YES;
            }
        }
        self.nameView = (LTView *)[self viewWithTag:100];
        self.passwordSureView = (LTView *)[self viewWithTag:101];
        self.passwordSureView = (LTView *)[self viewWithTag:102];
        self.phoneNumberView = (LTView *)[self viewWithTag:103];
        self.eMailView = (LTView *)[self viewWithTag:104];
        
            self.loginButton = [UIButton buttonWithType:UIButtonTypeSystem];
            _loginButton.frame = CGRectMake(150, 280, 70, 35);
            [_loginButton setTitle:@"注册" forState:UIControlStateNormal];
            [self addSubview:_loginButton];
    
        
    }
    
    
    return self;
}



    
@end

