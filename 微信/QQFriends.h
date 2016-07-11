//
//  QQFriends.h
//  QQ好友
//
//  Created by qingyun on 16/5/17.
//  Copyright © 2016年 zzc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QQFriends : NSObject
@property (nonatomic ,copy) NSString *icon;
@property (nonatomic ,copy) NSString *name;
@property (nonatomic ,copy) NSString *status;
@property (nonatomic) BOOL vip;

- (instancetype) initWithDictionary:(NSDictionary *)dic;

+ (instancetype) friendWithDictionary:(NSDictionary *)dic;
@end
