//
//  TouchView.m
//  LessonUI-05-Target_Action
//
//  Created by huchunyuan on 15/8/19.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import "TouchView.h"

@implementation TouchView
// 添加方法(类似于button)

- (void)addTarget:(id)target action:(SEL)action{
    // 记录 传入的 方法 和 方法执行者
    _target = target;
    _action = action;
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    // 让方法执行者 执行方法
    [_target performSelector:_action withObject:self];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
