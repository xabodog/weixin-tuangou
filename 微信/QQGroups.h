//
//  QQGroups.h
//  QQ好友
//
//  Created by qingyun on 16/5/17.
//  Copyright © 2016年 zzc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QQGroups : NSObject
@property (nonatomic ,strong) NSArray *friends;
@property (nonatomic ,copy)   NSString *name;
@property (nonatomic)         NSInteger online;
@property (nonatomic)         BOOL isOn;

- (instancetype)initWithDictionary: (NSDictionary *)dic;

+ (instancetype)groupWithDictionary: (NSDictionary *)dic;
@end
