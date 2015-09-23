//
//  MyTableViewCell.m
//  LessonUI-11-UITableViewCell
//
//  Created by huchunyuan on 15/8/27.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import "MyTableViewCell.h"
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

@implementation MyTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setContact:(Contact *)contact{
    if (_contact != contact) {
        [_contact release];
        _contact = [contact retain];
        // 控件赋值
        _picView.image = [UIImage imageNamed:contact.picName];
        _nameLabel.text = contact.name;
        _sexLabel.text = contact.sex;
        _phoneLaebl.text = contact.phoneNumber;
        // 描述introduceLabel赋值
        // 计算需要显示文字的高度
        CGFloat height = [MyTableViewCell heightWithString:contact.introduce];
        // 别忘记改Label的numberOfLines;
        // 通过文字的高度 重新设置introlduceLabel的高度
        CGRect frame = CGRectMake(CGRectGetMaxX(self.picView.frame)+10, CGRectGetMaxY(self.phoneLaebl.frame)+20, kIntroduceWith, height);
        _introduceLabel.frame = frame;
        _introduceLabel.text = contact.introduce;
    }
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // 子视图布局
        // 图片
        self.picView = [[UIImageView alloc ]initWithFrame:CGRectMake(kLeftAndRight, kTopMargin, kPicWidth, kPicHeight)];
        // 背景颜色
        [self.contentView addSubview:_picView];
        [_picView release];
        // 姓名
        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.picView.frame)+kLeftAndRight, kTopLabel, kNameWidth, kLabelHeight)];
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_nameLabel];
        [_nameLabel release];
        // 性别
        self.sexLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.nameLabel.frame)+kLeftAndRight, kTopLabel, kSexWidth, kLabelHeight)];
        _sexLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_sexLabel];
        [_sexLabel release];
        // 电话
        self.phoneLaebl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.picView.frame)+kLeftAndRight,CGRectGetMaxY(self.nameLabel.frame)+20, kPhoneWith, kLabelHeight)];
        _phoneLaebl.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_phoneLaebl];
        [_phoneLaebl release];
        // 描述
        self.introduceLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.picView.frame)+10, CGRectGetMaxY(self.phoneLaebl.frame)+20, kIntroduceWith, kLabelHeight)];
        _introduceLabel.numberOfLines = 0;
        _introduceLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_introduceLabel];
        [_introduceLabel release];
    }
    return self;
}
/** 通过字符串 计算字符串所需要的高度 */
+ (CGFloat)heightWithString:(NSString *)str{
    // 第一个参数: 给定限定大小
    // 第二个参数: 设置展示风格
    // 第三个参数: 设置字号
    // 第四个参数: 预留参数
    CGRect rect = [str boundingRectWithSize:CGSizeMake(kIntroduceWith, 100000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:17]} context:nil];
    return rect.size.height;
}
@end
