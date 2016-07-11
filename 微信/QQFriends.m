//
//  QQFriends.m
//  QQ好友
//
//  Created by qingyun on 16/5/17.
//  Copyright © 2016年 zzc. All rights reserved.
//

#import "QQFriends.h"
@interface QQFriends()

@end
@implementation QQFriends
- (instancetype) initWithDictionary:(NSDictionary *)dic{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

+ (instancetype)friendWithDictionary:(NSDictionary *)dic{
    return [[self alloc]initWithDictionary:dic];
}
@end
