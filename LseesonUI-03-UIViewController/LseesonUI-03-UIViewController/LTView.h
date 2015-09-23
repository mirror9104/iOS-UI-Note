//
//  LTView.h
//  LessonUI-03-LTViewAndLoginView
//
//  Created by huchunyuan on 15/8/17.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LTView : UIView<UITextFieldDelegate>
@property (nonatomic,retain)UILabel *label;
@property (nonatomic,retain)UITextField *textFiled;
@end
