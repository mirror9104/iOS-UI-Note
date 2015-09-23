//
//  girlCell.m
//  LessonUI-11-UITableViewCell
//
//  Created by huchunyuan on 15/8/27.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import "girlCell.h"

#define kTopMargin 15
#define kLeftMargin 10

#define kPicWidth 100
#define kPicHeight 150

#define kLeftAndRight 15

#define kTopLabel 20
#define kNameWidth 140
#define kLabelHeight 30

#define kSexWidth 75
#define kPhoneWith 235
#define kIntroduceWith 235

@implementation girlCell
/** 通过文字获取高度 */
+ (CGFloat)heightWithString:(NSString *)string{
    CGRect rect = [string boundingRectWithSize:CGSizeMake(kIntroduceWith, 100000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:17]} context:nil];
    return rect.size.height;
}
- (void)awakeFromNib {
    // Initialization code
}
- (void)setContact:(Contact *)contact{
    if (_contact != contact) {
        [_contact release];
        _contact = [contact retain];
        // 控件的赋值
        _nameLabel.text = contact.name;
        _phoneNumberLabel.text = contact.phoneNumber;
        _sexLabel.text = contact.sex;
        _picView.image = [UIImage imageNamed:contact.picName];
        
        CGFloat height = [girlCell heightWithString:contact.introduce];
        _introduceLabel.frame =CGRectMake(kLeftMargin, CGRectGetMaxY(self.phoneNumberLabel.frame)+10, kIntroduceWith, height);
        _introduceLabel.text = contact.introduce;
    }
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // 子视图 布局
        // 姓名
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 375, 200)];
        imageView.image = [UIImage imageNamed:@"cell3"];
        [self.contentView addSubview:imageView];
        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(kLeftMargin, kTopLabel, kNameWidth, kLabelHeight)];
        // 居中
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_nameLabel];
        [_nameLabel release];
        
        // 性别
        self.sexLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.nameLabel.frame)+kLeftAndRight, kTopLabel, kSexWidth, kLabelHeight)];
        _sexLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_sexLabel];
        [_sexLabel release];
        // 电话
        self.phoneNumberLabel = [[UILabel alloc] initWithFrame:CGRectMake(kLeftMargin, CGRectGetMaxY(self.nameLabel.frame)+20, kPhoneWith, kLabelHeight)];
        _phoneNumberLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_phoneNumberLabel];
        [_phoneNumberLabel release];
        // 简介
        self.introduceLabel = [[UILabel alloc] initWithFrame:CGRectMake(kLeftMargin, CGRectGetMaxY(self.phoneNumberLabel.frame)+10, kIntroduceWith, kLabelHeight)];
        _introduceLabel.numberOfLines = 0;
        _introduceLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_introduceLabel];
        [_introduceLabel release];
        
        // 照片
        self.picView = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.sexLabel.frame)+20, kTopLabel, kPicWidth, kPicHeight)];
        [self.contentView addSubview:_picView];
        _picView.layer.cornerRadius = 50;
        _picView.layer.masksToBounds = YES;
        [_picView release];
        
      
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
