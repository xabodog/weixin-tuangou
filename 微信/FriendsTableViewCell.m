//
//  FriendsTableViewCell.m
//  QQ好友
//
//  Created by qingyun on 16/5/17.
//  Copyright © 2016年 zzc. All rights reserved.
//

#import "FriendsTableViewCell.h"
#import "QQFriends.h"
@implementation FriendsTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier]) {
        
    }
    return self;
}


-(void)setFriendsData:(QQFriends *)friendsData{
    _friendsData = friendsData;
    self.imageView.image = [UIImage imageNamed:friendsData.icon];
    self.textLabel.text = friendsData.name;
    self.detailTextLabel.text = friendsData.status;
    self.textLabel.textColor = friendsData.vip ? [UIColor redColor] : [UIColor blackColor];
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
