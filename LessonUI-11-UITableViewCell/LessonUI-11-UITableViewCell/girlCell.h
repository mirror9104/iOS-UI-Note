//
//  girlCell.h
//  LessonUI-11-UITableViewCell
//
//  Created by huchunyuan on 15/8/27.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contact.h"
@interface girlCell : UITableViewCell
@property (nonatomic,retain)UIImageView *picView;
@property (nonatomic,retain)UILabel *nameLabel;
@property (nonatomic,retain)UILabel *sexLabel;
@property (nonatomic,retain)UILabel *phoneNumberLabel;
@property (nonatomic,retain)UILabel *introduceLabel;
@property (nonatomic,retain)Contact *contact;// 声明model属性
/** 通过文字获取高度 */
+ (CGFloat)heightWithString:(NSString *)string;

@end
