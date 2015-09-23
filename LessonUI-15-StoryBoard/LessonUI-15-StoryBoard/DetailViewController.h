//
//  DetailViewController.h
//  LessonUI-15-StoryBoard
//
//  Created by huchunyuan on 15/9/4.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (retain, nonatomic) IBOutlet UIImageView *picView;// 照片
@property (retain, nonatomic) IBOutlet UILabel *nameLabel;// 姓名
@property (retain, nonatomic) IBOutlet UILabel *sexLabel;// 性别
@property (retain, nonatomic) IBOutlet UILabel *phoneLabel;// 电话

@end
