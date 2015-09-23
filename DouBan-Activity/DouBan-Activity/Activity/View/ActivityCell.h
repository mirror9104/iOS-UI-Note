//
//  ActivityCell.h
//  DouBan-Activity
//
//  Created by huchunyuan on 15/9/8.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ActivityCell : UITableViewCell
@property (retain, nonatomic) IBOutlet UILabel *titleLabel;// 标题
@property (retain, nonatomic) IBOutlet UILabel *timeLabel;// 时间
@property (retain, nonatomic) IBOutlet UILabel *addressLabel;// 地址
@property (retain, nonatomic) IBOutlet UILabel *categoryLabel;// 类型
@property (retain, nonatomic) IBOutlet UILabel *wisherLabel;// 感兴趣人数
@property (retain, nonatomic) IBOutlet UILabel *participantLabel;// 参加人数
@property (retain, nonatomic) IBOutlet UIImageView *activityPci;// 图片

@end
