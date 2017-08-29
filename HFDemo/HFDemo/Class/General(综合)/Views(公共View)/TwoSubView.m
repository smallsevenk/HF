//
//  TwoSubView.m
//  BBGWallet
//
//  Created by Zick.Zhao on 2017/8/18.
//  Copyright © 2017年 HappinessFamily. All rights reserved.
//

#import "TwoSubView.h"

@implementation TwoSubView

- (instancetype)init{
    if (self = [super init]) {
        [self setUpViews];
    }
    return self;
}

- (void)setUpViews{
    [self addSubview:self.imgView];
    [self addSubview:self.sub1];
    [self addSubview:self.sub2];
}

#pragma mark ——— Lazy

- (UIImageView *)imgView {
    
    if (!_imgView) {
        
        _imgView = [[UIImageView alloc] init];
        
    }
    
    return _imgView;
}

- (UILabel *)sub1 {
    
    if (!_sub1) {
        
        _sub1 = [UILabel new];
        _sub1.textAlignment = NSTextAlignmentCenter;
        
    }
    
    return _sub1;
}

- (UILabel *)sub2 {
    
    if (!_sub2) {
        
        _sub2 = [UILabel new];
        _sub2.textAlignment = NSTextAlignmentCenter;
        
    }
    
    return _sub2;
}

@end
