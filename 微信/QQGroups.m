//
//  QQGroups.m
//  QQ好友
//
//  Created by qingyun on 16/5/17.
//  Copyright © 2016年 zzc. All rights reserved.
//

#import "QQGroups.h"
#import "QQFriends.h"
@implementation QQGroups
-(instancetype)initWithDictionary:(NSDictionary *)dic{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
        NSMutableArray *array = [NSMutableArray array];
        for (NSDictionary *dict in self.friends) {
            QQFriends *friend = [QQFriends friendWithDictionary:dict];
            [array addObject:friend];
        }
        _friends = array;
    }
    return self;
}

+(instancetype)groupWithDictionary:(NSDictionary *)dic{
    return [[self alloc]initWithDictionary:dic];
}
@end
