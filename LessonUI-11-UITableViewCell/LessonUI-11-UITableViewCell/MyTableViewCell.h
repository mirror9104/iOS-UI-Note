//
//  MyTableViewCell.h
//  LessonUI-11-UITableViewCell
//
//  Created by huchunyuan on 15/8/27.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contact.h"
@interface MyTableViewCell : UITableViewCell
// 声明一个modal类的属性
@property (nonatomic,retain)Contact *contact;

@property (nonatomic,retain)UIImageView *picView;
@property (nonatomic,retain)UILabel *nameLabel;
@property (nonatomic,retain)UILabel *sexLabel;
@property (nonatomic,retain)UILabel *phoneLaebl;
@property (nonatomic,retain)UILabel *introduceLabel;
/** 通过字符串 计算字符串所需要的高度 */
+ (CGFloat)heightWithString:(NSString *)str;

@end
