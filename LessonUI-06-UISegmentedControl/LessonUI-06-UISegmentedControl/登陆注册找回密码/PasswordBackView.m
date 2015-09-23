//
//  PasswordBackView.m
//  UI作业--(3)
//
//  Created by lanou3g on 15/5/20.
//  Copyright (c) 2015年 MFM. All rights reserved.
//

#import "PasswordBackView.h"

@implementation PasswordBackView

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
        NSArray *strArr1 = @[@"电话号码",@"新密码"];
        NSArray *strArr2 = @[@"请输入电话号码",@"请输入新密码"];
        for (int i = 0; i < 2; i ++) {
            LTView *ltView = [[LTView alloc] initWithFrame:CGRectMake(50 ,40 * i, 350, 35)];
            ltView.label.text = strArr1[i];
            ltView.textField.placeholder = strArr2[i];
            ltView.textField.borderStyle = UITextBorderStyleRoundedRect;
            ltView.tag = 100 + i;
            [self addSubview:ltView];
            [ltView release];
            if (i == 1 || i == 2) {
                ltView.textField.secureTextEntry = YES;
            }
        }
        self.phoneNumberLt = (LTView *)[self viewWithTag:100];
        self.PasswordLt = (LTView *)[self viewWithTag:101];
        
        self.sureButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _sureButton.frame = CGRectMake(150, 150, 70, 35);
        [_sureButton setTitle:@"确定" forState:UIControlStateNormal];
        [self addSubview:_sureButton];
    }
    return self;
}


@end
