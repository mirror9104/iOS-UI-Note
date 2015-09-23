//
//  LoginView.m
//  UI作业 -- 03
//
//  Created by lanou3g on 15/5/20.
//  Copyright (c) 2015年 MFM. All rights reserved.
//

#import "LoginView.h"

@implementation LoginView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithFrame:(CGRect)frame
{
    if ([super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        NSArray *strArr1 = @[@"用户名",@"密码"];
        NSArray *strArr2 = @[@"请输入用户名",@"请输入密码"];
        for (int i = 0; i < 2; i ++) {
            LTView *ltView = [[LTView alloc] initWithFrame:CGRectMake(50,i * 50, 350, 35)];
            ltView.label.text = strArr1[i];
            ltView.textField.placeholder = strArr2[i];
            ltView.textField.borderStyle = UITextBorderStyleRoundedRect;
            ltView.tag = 100 + i;
            [self addSubview:ltView];
            [ltView release];
            if (i == 1) {
                ltView.textField.secureTextEntry = YES;
            }
        }
        self.nameView = (LTView *)[self viewWithTag:100];
        self.passwordView = (LTView *)[self viewWithTag:101];
    
            self.loginButton = [UIButton buttonWithType:UIButtonTypeSystem];
            _loginButton.frame = CGRectMake(150 , 200, 70, 35);
        [_loginButton setTitle:@"登陆" forState:UIControlStateNormal];
            [self addSubview:_loginButton];
            [_loginButton release];
    }
    
    
    return self;
}



@end
