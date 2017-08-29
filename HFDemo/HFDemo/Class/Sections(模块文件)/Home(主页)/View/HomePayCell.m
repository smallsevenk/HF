//
//  HomePayCell.m
//  BBGWallet
//
//  Created by Zick.Zhao on 2017/8/11.
//  Copyright © 2017年 HappinessFamily. All rights reserved.
//

#import "HomePayCell.h"
#import "TwoSubView.h"

@interface HomePayCell()

@end

@implementation HomePayCell

+ (CGFloat)height
{
    return 90;
}

+ (NSArray<NSArray *> *)items{
    return @[@{@"icon":@"home_pay_0",@"text":@"付钱"},
             @{@"icon":@"home_pay_1",@"text":@"收钱"},
             @{@"icon":@"home_pay_2",@"text":@"购卡"}
             ];
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
    self.contentView.backgroundColor = RGBHex(@"#f76b71");
    
    NSArray *items = [HomePayCell items];
    
    for (int i = 0; i < items.count; i ++) {
        UIView *view = [self viewWithIcon:[UIImage imageNamed:items[i][@"icon"]]
                                     text:items[i][@"text"] index:i];
        [self.contentView addSubview:view];
    }
}

- (void)setLayout
{
    
}

- (void)setData
{
    UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [self.contentView setUserInteractionEnabled:YES];
    [self.contentView addGestureRecognizer:tapGes];
}

- (UIView *)viewWithIcon:(UIImage *)img text:(NSString *)text index:(int)idx{
    
    TwoSubView *view = [[TwoSubView alloc] init];
    [view setUserInteractionEnabled:NO];
    view.backgroundColor = [UIColor clearColor];
    view.frame = CGRectMake(idx * SCREEN_WIDTH / 3,0,SCREEN_WIDTH / 3,90);
    
    view.imgView.frame = CGRectMake(0,12,img.size.width,img.size.height);
    view.imgView.image = img;
    [view.imgView setCenterXEqualSuper];
    
    view.sub2.frame = CGRectMake(0,view.imgView.bottom,view.width,26);
    [view.sub2 setText:text];
    view.sub2.font = [UIFont systemFontOfSize:12];
    [view.sub2 setTextColor:[UIColor whiteColor]];
    
    return view;
}

//时间选择
-(void)tapAction:(UIGestureRecognizer*)gesRec
{
    CGPoint point = [gesRec locationInView:gesRec.view.superview];
    
    int idx = 0;
    //付款
    if (point.x <= SCREEN_WIDTH/3){
        idx = 0;
    }
    //银联卡
    else if (point.x <= SCREEN_WIDTH/3 * 2){
        idx = 1;
    }
    //购云猴卡
    else{
        idx = 2;
    }
    
    if (_didSelect) {
        _didSelect(self,idx);
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
