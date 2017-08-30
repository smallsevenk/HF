//
//  HomeBalanceCell.m
//  HFDemo
//
//  Created by smallsevenk on 2017/8/17.
//  Copyright © 2017年 HappinessFamily. All rights reserved.
//

#import "HomeBalanceCell.h"

@implementation HomeBalanceCell

+ (CGFloat)height
{
    return 60;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    if (nil != self) {
        [self initialize];
    }
    
    return self;
}

#pragma mark ——— initialize
- (void)initialize
{
    [self setUpViews];
    [self setLayout];
    [self setData];
}

- (void)setUpViews
{
    self.contentView.backgroundColor = [UIColor tbBgGrayColor];
    [self.contentView addSubview:self.leftBgView];
    [self.contentView addSubview:self.rightBgView];
}

- (void)setLayout
{
    
}

- (void)setData
{
    
}

#pragma mark ——— Lazy

- (UIView *)leftBgView {
    
    if (!_leftBgView) {
        
        _leftBgView = [[HFSubViewNormal alloc] init];
        _leftBgView.backgroundColor = [UIColor whiteColor];
        _leftBgView.frame = CGRectMake(0,2,SCREEN_WIDTH/2 - 1,56);
        
        _leftBgView.sub1.frame = CGRectMake(0,0,_leftBgView.width,30);
        [_leftBgView.sub1 setText:@"0.00"];
        _leftBgView.sub1.font = [UIFont systemFontOfSize:20];
        [_leftBgView.sub1 setTextColor:[UIColor redColor]];
        
        _leftBgView.sub2.frame = CGRectMake(0,_leftBgView.sub1.bottom,_leftBgView.width,26);
        [_leftBgView.sub2 setText:@"余额"];
        _leftBgView.sub2.font = [UIFont systemFontOfSize:12];
        [_leftBgView.sub2 setTextColor:[UIColor grayColor]];
    }
    
    return _leftBgView;
}

- (UIView *)rightBgView {
    
    if (!_rightBgView) {
        
        _rightBgView = [[HFSubViewNormal alloc] init];
        _rightBgView.backgroundColor = _leftBgView.backgroundColor;
        _rightBgView.frame = CGRectMake(SCREEN_WIDTH - _leftBgView.width,_leftBgView.top,_leftBgView.width,_leftBgView.height);
        
        _rightBgView.sub1.frame = _leftBgView.sub1.frame;
        [_rightBgView.sub1 setText:@"0"];
        _rightBgView.sub1.font = _leftBgView.sub1.font;
        [_rightBgView.sub1 setTextColor:_leftBgView.sub1.textColor];
        
        _rightBgView.sub2.frame = _leftBgView.sub2.frame;
        [_rightBgView.sub2 setText:@"待领卡"];
        _rightBgView.sub2.font = _leftBgView.sub2.font;
        [_rightBgView.sub2 setTextColor:_leftBgView.sub2.textColor];
        
    }
    
    return _rightBgView;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
