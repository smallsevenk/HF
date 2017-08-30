//
//  HomeOtherCell.m
//  HFDemo
//
//  Created by Zick.Zhao on 2017/8/17.
//  Copyright © 2017年 HappinessFamily. All rights reserved.
//

#import "HomeOtherCell.h"
#import "HFSubViewNormal.h"

#define HOME_OTHER_MAX_COLS 3

@implementation HomeOtherCell

+ (NSArray<NSArray *> *)items{
    return @[@{@"icon":@"home_other_0",@"text":@"绑卡"},
             @{@"icon":@"home_other_1",@"text":@"卡包"},
             @{@"icon":@"home_other_2",@"text":@"卡明细"},
             @{@"icon":@"home_other_3",@"text":@"账单"},
             @{@"icon":@"home_other_4",@"text":@"实名认证"},
             @{@"icon":@"home_other_5",@"text":@"安全中心"}
             ];
}

+ (long int)row{
    
    NSArray *items = [HomeOtherCell items];
    
    return items.count % HOME_OTHER_MAX_COLS ? ceil(items.count / (CGFloat)HOME_OTHER_MAX_COLS):items.count / HOME_OTHER_MAX_COLS;;
}

+ (CGFloat)height
{
    return [HomeOtherCell row] * 90 + ([HomeOtherCell row] - 1) * 8;
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    if (nil != self) {
        [self initialize];
    }
    
    return self;
}

- (void)initialize
{
    [self setUpViews];
    [self setLayout];
    [self setData];
}

- (void)setUpViews
{
    self.contentView.backgroundColor = self.backgroundColor = [UIColor tbBgGrayColor];
    
    int maxCols = HOME_OTHER_MAX_COLS;
    
    CGFloat item_width = (SCREEN_WIDTH - 2 * (maxCols - 1)) / maxCols;
    CGFloat item_height = 90;
    
    NSArray *items = [HomeOtherCell items];
    
    long int row =  [HomeOtherCell row];
    
    UIImage *iconImg = [UIImage imageNamed:@"home_other_0"];
    
    for (int i = 0; i < row; i++) {
        
        for (int j = 0;  j < maxCols; j++) {
            
            int tag = i * maxCols + j;
            
            if (tag >= items.count)
            {
                break;
            }
            
            NSLog(@"tag:%d",tag);
            
            HFSubViewNormal *view = [[HFSubViewNormal alloc] init];
            view.backgroundColor = [UIColor whiteColor];
            view.frame = CGRectMake((item_width + 2) * j,(item_height + 8) * i,item_width,item_height);
            [self.contentView addSubview:view];
            
            UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
            [view setUserInteractionEnabled:YES];
            [view setTag:tag];
            [view addGestureRecognizer:tapGes]; 
            
            view.imgView.frame = CGRectMake(0,15,iconImg.size.width,iconImg.size.height);
            view.imgView.image = [UIImage imageNamed:items[tag][@"icon"]];
            [view.imgView setCenterXEqualSuper];
            
            view.sub2.frame = CGRectMake(0,view.imgView.bottom + 8,view.width,26);
            [view.sub2 setText:items[tag][@"text"]];
            view.sub2.font = [UIFont systemFontOfSize:12];
            [view.sub2 setTextColor:[UIColor blackColor]];
        }
    }
}

- (void)setLayout
{
    
}

- (void)setData
{
    
}

-(void)tapAction:(UIGestureRecognizer*)gesRec{
    NSInteger tag = gesRec.view.tag;
    if (_didSelect) {
        _didSelect(self,tag);
    }
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
