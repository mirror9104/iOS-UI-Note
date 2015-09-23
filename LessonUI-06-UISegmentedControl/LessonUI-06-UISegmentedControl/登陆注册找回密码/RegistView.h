//
//  RegistView.h
//  UI作业 -- 03(2)
//
//  Created by lanou3g on 15/5/20.
//  Copyright (c) 2015年 MFM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LTView.h"

@interface RegistView : UIView

@property(nonatomic,retain)LTView *nameView;
@property(nonatomic,retain)LTView *passwordView;
@property(nonatomic,retain)LTView *passwordSureView;
@property(nonatomic,retain)LTView *phoneNumberView;
@property(nonatomic,retain)LTView *eMailView;
@property(nonatomic,retain)UIButton *loginButton;

@end
