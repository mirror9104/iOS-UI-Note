//
//  SecondViewController.h
//  LessonUI-13-Block
//
//  Created by huchunyuan on 15/8/30.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^passValueBlock)(NSString *);
@protocol backDelegate <NSObject>

- (void)backStr:(NSString *)str;

@end
@interface SecondViewController : UIViewController
@property (nonatomic,retain)UITextField *tf;
@property (nonatomic,copy)NSString *tfstr;
@property (nonatomic,assign)id<backDelegate>delegate;
// block的属性 copy到堆区防止在栈区释放了
@property (nonatomic,copy)passValueBlock passValue;
@end
