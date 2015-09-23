//
//  LTView.m
//  UI10
//
//  Created by lanou3g on 15/8/26.
//  Copyright (c) 2015年 怒煮老马菊花. All rights reserved.
//

#import "LTView.h"

@implementation LTView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        CGFloat height = frame.size.height;
        CGFloat width = frame.size.width;
        CGFloat labelWidth = width/3;
        CGFloat tfWidth = width / 3 * 2;
        
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(2, 2, labelWidth, height)];
        _label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_label];
        [_label release];
        self.textField = [[UITextField alloc] initWithFrame:CGRectMake(2+10+labelWidth, 2, tfWidth, height)];
        _textField.borderStyle = UITextBorderStyleRoundedRect;
        [self addSubview:_textField];
        [_textField release];
        
    }
    return self;
}

@end
