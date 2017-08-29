//
//  HomeAdCell.m
//  BBGWallet
//
//  Created by Zick.Zhao on 2017/8/11.
//  Copyright © 2017年 HappinessFamily. All rights reserved.
//

#import "HomeAdCell.h"

@implementation HomeAdCell

+ (CGFloat)height
{
    UIImage *img = [UIImage imageNamed:@"home_ad_1"];
    return img.size.height;
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
    
    UIImageView *imgView = [UIImageView new];
    imgView.image = [UIImage imageNamed:@"home_ad_1"];
    imgView.frame = CGRectMake(0,0,SCREEN_WIDTH,[HomeAdCell height]);
    imgView.contentMode = UIViewContentModeScaleAspectFill;
    [self.contentView addSubview:imgView];
}

- (void)setLayout
{
    
}

- (void)setData
{
    
}

#pragma mark ——— Lazy



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
