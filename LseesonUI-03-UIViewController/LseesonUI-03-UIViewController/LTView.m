//
//  LTView.m
//  LessonUI-03-LTViewAndLoginView
//
//  Created by huchunyuan on 15/8/17.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import "LTView.h"

@implementation LTView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        // label textFiled 创建
        // 计算 高度 宽度
        CGFloat height = frame.size.height -4;
        CGFloat weidth = frame.size.width - 14;
        CGFloat labelWeith = weidth / 3;
        CGFloat tfWeidth = weidth/3*2;
        // label
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(2, 2, labelWeith, height)];
        _label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_label];
        [_label release];
        // textfield
        self.textFiled = [[UITextField alloc] initWithFrame:CGRectMake(2+10+labelWeith, 2, tfWeidth, height)];
        _textFiled.borderStyle = UITextBorderStyleRoundedRect;
        // 设置代理
        _textFiled.delegate = self;
        [self addSubview:_textFiled];
        [_textFiled release];
        
        
        
    }
    return self;
}
// 点击return回收键盘
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}
- (void)dealloc{
    self.label = nil;
    self.textFiled = nil;
    NSLog(@"asdasd");
    [super dealloc];
}

@end
