//
//  LgoinView.m
//  LessonUI-03-LTViewAndLoginView
//
//  Created by huchunyuan on 15/8/17.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import "LoginView.h"

@implementation LoginView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        // 子视图布置
        // 用户
        self.user = [[LTView alloc] initWithFrame:CGRectMake(20, 100, 335, 40)];
        _user.label.text = @"用户名:";
        _user.textFiled.placeholder = @"请输入用户名";
        [self addSubview:_user];
        [_user release];
        // 密码
        self.passWord = [[LTView alloc] initWithFrame:CGRectMake(20, 150, 335, 40)];
        _passWord.label.text = @"密码:";
        _passWord.textFiled.placeholder = @"请输入密码";
        _passWord.textFiled.secureTextEntry = YES;
        [self addSubview:_passWord];
        [_passWord release];
        _loginBt = [UIButton buttonWithType:UIButtonTypeSystem];
        [_loginBt setTitle:@"登录" forState:UIControlStateNormal];
        _loginBt.frame = CGRectMake(50, 250, 50, 20);
        [self addSubview:_loginBt];
        _findPassWordBt = [UIButton buttonWithType:UIButtonTypeSystem];
        [_findPassWordBt setTitle:@"注册" forState:UIControlStateNormal];
        _findPassWordBt.frame = CGRectMake(150, 250, 50, 20);
        [self addSubview:_findPassWordBt];
        _registBt = [UIButton buttonWithType:UIButtonTypeSystem];
        [_registBt setTitle:@"找回密码" forState:UIControlStateNormal];
        _registBt.frame = CGRectMake(250, 250, 100, 20);
        [self addSubview:_registBt];
        
    }
    return self;
}
// 重写 layoutSubViews
- (void)layoutSubviews{
    [super layoutSubviews];
    // 获取应用程序对象
    UIApplication *app = [UIApplication sharedApplication];
    // 通过方向 进行横屏 竖屏的判断
    if (app.statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown || app.statusBarOrientation == UIInterfaceOrientationPortrait) {
        self.user.frame = CGRectMake(20, 100, 335, 40);
        self.passWord.frame = CGRectMake(20, 180, 355, 40);
        _loginBt.frame = CGRectMake(50, 250, 50, 20);
        _findPassWordBt.frame =  CGRectMake(150, 250, 50, 20);
        _registBt.frame = CGRectMake(250, 250, 100, 20);
        NSLog(@"竖屏");
    }else if (app.statusBarOrientation==UIInterfaceOrientationLandscapeRight || app.statusBarOrientation==UIInterfaceOrientationLandscapeLeft){
        NSLog(@"横屏");
        self.user.frame = CGRectMake(100, 100, 467, 40);
        self.passWord.frame = CGRectMake(100, 160, 467, 40);
        self.loginBt.frame = CGRectMake(100, 220, 367/3, 40);
        self.findPassWordBt.frame = CGRectMake(100 + 367/3 + 50,220 , 367/3, 40);
        self.registBt.frame = CGRectMake(100 + (367/3 + 50) *2, 220, 367/3, 40);
    }
}
- (void)dealloc{
    self.user = nil;
    self.passWord = nil;
    self.registBt = nil;
    self.loginBt = nil;
    self.passWord = nil;
    self.findPassWordBt = nil;
    [super dealloc];
}


@end
