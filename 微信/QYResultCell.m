//
//  QYResultCell.m
//  微信
//
//  Created by qingyun on 16/5/25.
//  Copyright © 2016年 zzc. All rights reserved.
//

#import "QYResultCell.h"
#import "QYTGModel.h"
@interface QYResultCell ()
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *buyCount;

@property (weak, nonatomic) IBOutlet UILabel *price;


@end
@implementation QYResultCell


-(void)setTgModel:(QYTGModel *)tgModel{
    _tgModel = tgModel;
    
    _icon.image = [UIImage imageNamed:tgModel.icon];
    _title.text = tgModel.title;
    _price.text = tgModel.price;
    _buyCount.text = tgModel.buycount;
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
