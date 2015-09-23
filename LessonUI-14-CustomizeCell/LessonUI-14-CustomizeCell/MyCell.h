//
//  MyCell.h
//  LessonUI-14-CustomizeCell
//
//  Created by huchunyuan on 15/8/31.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCell : UITableViewCell
@property (retain, nonatomic) IBOutlet UIImageView *picView;// 照片
@property (retain, nonatomic) IBOutlet UILabel *nameLabel;// 姓名
@property (retain, nonatomic) IBOutlet UILabel *phoneLabel;// 电话

@end
