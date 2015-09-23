//
//  DataHandle.h
//  AddressBook
//
//  Created by huchunyuan on 15/8/28.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contact.h"

@interface DataHandle : NSObject
+ (DataHandle *)shareDateHandle;
@property (nonatomic,retain)NSMutableArray *allKeys;
@property (nonatomic,retain)NSMutableDictionary *classDic;
// 添加联系人
- (void)addContact:(Contact *)contact;
@end
