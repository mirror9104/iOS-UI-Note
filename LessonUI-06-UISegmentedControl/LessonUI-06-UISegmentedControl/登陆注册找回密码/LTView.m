//
//  LTView.m
//  UI作业 -- 03
//
//  Created by lanou3g on 15/5/20.
//  Copyright (c) 2015年 MFM. All rights reserved.
//

#import "LTView.h"

@implementation LTView

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
        CGFloat height = frame.size.height;
        CGFloat labelWidth = frame.size.width / 3 - 15;
        
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, labelWidth, height)];
        [self addSubview:_label];
        [_label release];
      
        self.textField = [[UITextField alloc] initWithFrame:CGRectMake(labelWidth + 10, 0,labelWidth  * 2 - 10 , height)];
        [self addSubview:_textField];
        [_textField release];
        
    }
    return self;
}



@end
