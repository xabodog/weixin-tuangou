//
//  GroupView.m
//  QQ好友
//
//  Created by qingyun on 16/5/17.
//  Copyright © 2016年 zzc. All rights reserved.
//

#import "GroupView.h"
#import "QQGroups.h"
@interface GroupView ()
@property (nonatomic, strong) UIButton *bgBtn;
@property (nonatomic, strong) UILabel *onLineLabel;
@end
@implementation GroupView
static NSString *headerIdentifier = @"headerSection";
+(instancetype)sectionHeaderView:(UITableView *)tableView{
    GroupView *groupView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerIdentifier];
    if (groupView == nil) {
        groupView = [[GroupView alloc]initWithReuseIdentifier:headerIdentifier];
    }
    return groupView;
}

-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        //添加bgBtn
        UIButton *bgBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:bgBtn];
        
        //设置背景
        UIImage *image = [[UIImage imageNamed:@"buddy_header_bg"] resizableImageWithCapInsets:UIEdgeInsetsMake(44, 0, 44, 1) resizingMode:UIImageResizingModeStretch];
        UIImage *highLightedImage = [[UIImage imageNamed:@"buddy_header_bg_highlighted"] resizableImageWithCapInsets:UIEdgeInsetsMake(44, 0, 44, 1) resizingMode:UIImageResizingModeStretch];
        [bgBtn setBackgroundImage:image forState:UIControlStateNormal];
        [bgBtn setBackgroundImage:highLightedImage forState:UIControlStateHighlighted];
        //字体颜色
        [bgBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        //设置图片
        UIImage *arrowImage = [UIImage imageNamed:@"buddy_header_arrow"];
        [bgBtn setImage:arrowImage forState:UIControlStateNormal];
        
        //添加事件监听
        [bgBtn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
        
        
        //设置bgBtn的内容模式
        bgBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        //设置内容的偏移
        bgBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        //设置标题的偏移
        bgBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        
        bgBtn.imageView.contentMode = UIViewContentModeCenter;
        bgBtn.imageView.clipsToBounds = NO;
        
        //添加Label
        UILabel *label = [[UILabel alloc] init];
        [self.contentView addSubview:label];
        
        //设置label的对齐方式
        label.textAlignment = NSTextAlignmentRight;
        
        _bgBtn = bgBtn;
        _onLineLabel = label;
        
    }
    return self;
}

//重新布局子视图
-(void)layoutSubviews{
    [super layoutSubviews];
    //设置子视图的frame
    _bgBtn.frame = self.bounds;
    
    _onLineLabel.frame = CGRectMake(CGRectGetWidth(self.bounds) - 100 - 10, 0, 100, CGRectGetHeight(self.bounds));
}

-(void)btnClick{
    //更改sectionModel的isOpen状态
    _QQgroups.isOn = !_QQgroups.isOn;
    
    if (_headViewClick) {
        _headViewClick();
    }
    
    
    
}

//设置bgBtn的标题,label的wenb
-(void)setQQgroups:(QQGroups *)QQgroups{
    _QQgroups = QQgroups;
    
    [_bgBtn setTitle:QQgroups.name forState:UIControlStateNormal];
    _onLineLabel.text = [NSString stringWithFormat:@"%ld/%ld",QQgroups.online,QQgroups.friends.count];
    
    if (QQgroups.isOn) {
        _bgBtn.imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
    }else{
        _bgBtn.imageView.transform = CGAffineTransformIdentity;
    }
}

@end
