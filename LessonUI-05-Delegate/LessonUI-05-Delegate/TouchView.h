//
//  TouchView.h
//  LessonUI-05-Delegate
//
//  Created by huchunyuan on 15/8/19.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TouchView;
@protocol TouchViewDelegate <NSObject>
// 当touchView 被点击时 触发
// 当视图被触摸时 触发的方法
- (void)touchViewDidTouchBegan:(TouchView *)touchView;

@end


@interface TouchView : UIView
// 服从协议的 代理
@property (nonatomic,assign)id<TouchViewDelegate>delegate;
@end
