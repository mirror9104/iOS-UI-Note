//
//  AddContactView.m
//  LessonUI-11-UITableViewCell
//
//  Created by 怒煮西兰花 on 15/8/28.
//  Copyright (c) 2015年 蓝鸥科技有限公司. All rights reserved.
//

#import "AddContactView.h"
#import "LTView.h"
@implementation AddContactView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //布局背景图片
        [self layoutBackgroudPic];
        
        //布局文本
        [self layoutTheText];
        
    }
    return self;
}


//设置背景图片
-(void)layoutBackgroudPic
{
    UIImageView *backgroudPic = [[UIImageView alloc] initWithFrame:self.bounds];
    backgroudPic.image = [UIImage imageNamed:@"1.jpg"];
    backgroudPic.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:backgroudPic];
    [backgroudPic release];
    backgroudPic.userInteractionEnabled = YES;
    
    //设置头像
    self.picView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 150, 150)];
    _picView.center = CGPointMake(100, 150);
    //切圆
    _picView.layer.cornerRadius = 75;
    _picView.layer.masksToBounds = YES;
    _picView.backgroundColor = [UIColor lightGrayColor];
    _picView.userInteractionEnabled = YES
    ;
    [backgroudPic addSubview:_picView];
    [_picView release];
}

//布局文本
-(void)layoutTheText
{
    
    LTView *name = [[LTView alloc] initWithFrame:CGRectMake(60, 260, 200, 40)];
    name.label.text = @"姓名:";
    name.textField.placeholder = @"请输入姓名";
    name.textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self addSubview:name];
    [name release];
    self.nameTf = name.textField;
    
    LTView *phoneNumber = [[LTView alloc] initWithFrame:CGRectMake(60, 330, 200, 40)];
    phoneNumber.label.text = @"手机号:";
    phoneNumber.textField.placeholder = @"请输入手机号";
    name.textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self addSubview:phoneNumber];
    [phoneNumber release];
    self.phoneNumberTf = phoneNumber.textField;
    
    
    UILabel *sex = [[UILabel alloc] initWithFrame:CGRectMake(170, 160, 50, 35)];
    sex.text = @"性别:";
    [self addSubview:sex];
    [sex release];
    
    self.sexTf = [[UITextField alloc] initWithFrame:CGRectMake(220, 160, 50, 40)];
    _sexTf.textAlignment = NSTextAlignmentCenter;
    _sexTf.placeholder = @"性别";
    _sexTf.borderStyle = UITextBorderStyleRoundedRect;
    [self addSubview:_sexTf];
    [_sexTf release];
    
    
    self.introduceTv = [[UITextView alloc] initWithFrame:CGRectMake(50, 400, 275, 100)];
    [self addSubview:_introduceTv];
    [_introduceTv release];
    
    
}


@end
