//
//  LgoinView.h
//  LessonUI-03-LTViewAndLoginView
//
//  Created by huchunyuan on 15/8/17.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LTView.h"

@interface LgoinView : UIView
@property (nonatomic,retain)LTView *user; // 用户
@property (nonatomic,retain)LTView *passWord;// 密码
@property (nonatomic,retain)UIButton *loginBt;// 登录
@property (nonatomic,retain)UIButton *findPassWordBt;// 找回密码
@property (nonatomic,retain)UIButton *registBt; // 注册

@end
