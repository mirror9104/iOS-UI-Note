//
//  TouchView.h
//  LessonUI-05-Target_Action
//
//  Created by huchunyuan on 15/8/19.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import <UIKit/UIKit.h>
// 1.声明两个实力变量 分别记录执行者(target),方法(action)
// 2.通过方法(addTarget:action)获取外部的执行者和方法
// 3.在某个时机让执行者 执行方法
@interface TouchView : UIView
{
    id _target;// 记录方法执行者
    SEL _action;// 记录方法
}
// 添加方法(类似于button) 获取外部的执行者 以及 执行方法
- (void)addTarget:(id)target action:(SEL)action;
@end
