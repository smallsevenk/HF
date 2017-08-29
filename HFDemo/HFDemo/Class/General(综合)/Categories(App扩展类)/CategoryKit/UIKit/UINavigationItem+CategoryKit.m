//
//  UINavigationItem+CategoryKit.m
//  CategoryKit
//
//  Created by xujun on 15/9/7.
//  Copyright (c) 2014 xujun. All rights reserved.
//

#import "UINavigationItem+CategoryKit.h"

@implementation UINavigationItem (CategoryKit)


///增加左侧导航栏按钮
- (void)addAppLeftBarButtonItem:(UIBarButtonItem *)item
{
    if (item == nil)
        return;
    
    NSMutableArray *array = [self.leftBarButtonItems mutableCopy];
    if (array == nil) {
        array = [NSMutableArray new];
    }
    
    [array addObject:item];
    [self setAppLeftBarButtonItems:array];
}

- (void)setAppLeftBarButtonItem:(UIBarButtonItem *)leftBarButtonItem
{
    if (leftBarButtonItem) {
        [self setAppLeftBarButtonItems:@[leftBarButtonItem]];
    }
}


- (void)setAppLeftBarButtonItems:(NSArray<UIBarButtonItem *> *)items
{
    NSMutableArray *array = [NSMutableArray new];
    [items enumerateObjectsUsingBlock:^(UIBarButtonItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        UIBarButtonItem *negativeSeperator = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
//        negativeSeperator.width = (idx == 0 ? 12 : -7);
//
//        [array addObject:negativeSeperator];
        [array addObject:obj];
    }];
    self.leftBarButtonItems = array;
}
- (void)setAppLeftBarButtonItemsHidden:(BOOL)hidden//隐藏
{
    [self.leftBarButtonItems enumerateObjectsUsingBlock:^(UIBarButtonItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.customView.hidden = hidden;
    }];
}
- (void)setAppLeftBarButtonItemsHighlighted:(BOOL)highlighted//高亮
{
    [self.leftBarButtonItems enumerateObjectsUsingBlock:^(UIBarButtonItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj.customView isKindOfClass:[UIButton class]]) {
            ((UIButton *)obj.customView).highlighted = highlighted;
        }
    }];
}

///增加右侧导航栏按钮
- (void)addAppRightBarButtonItem:(UIBarButtonItem *)item
{
    if (item == nil)
        return;
    
    NSMutableArray *array = [self.rightBarButtonItems mutableCopy];
    if (array == nil) {
        array = [NSMutableArray new];
    }
    
    [array addObject:item];
    [self setAppRightBarButtonItems:array];
}

- (void)setAppRightBarButtonItem:(UIBarButtonItem *)rightBarButtonItem
{
    if (rightBarButtonItem) {
        [self setAppRightBarButtonItems:@[rightBarButtonItem]];
    }
}

- (void)setAppRightBarButtonItems:(NSArray<UIBarButtonItem *> *)items
{
    NSMutableArray *array = [NSMutableArray new];
    [items enumerateObjectsUsingBlock:^(UIBarButtonItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
//        UIBarButtonItem *negativeSeperator = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
//        negativeSeperator.width = (idx == 0 ? -12 : 0);
//        
//        [array addObject:negativeSeperator];
        [array addObject:obj];
    }];
    self.rightBarButtonItems = array;
}
- (void)setAppRightBarButtonItemsHidden:(BOOL)hidden//隐藏
{
    [self.rightBarButtonItems enumerateObjectsUsingBlock:^(UIBarButtonItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.customView.hidden = hidden;
    }];
}
- (void)setAppRightBarButtonItemsHighlighted:(BOOL)highlighted//高亮
{
    [self.rightBarButtonItems enumerateObjectsUsingBlock:^(UIBarButtonItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj.customView isKindOfClass:[UIButton class]]) {
            ((UIButton *)obj.customView).highlighted = highlighted;
        }
    }];
}


@end

#pragma mark - BarButtonItem

@implementation UIBarButtonItem (NavigationItem)

///创建
+ (instancetype)barButtonItemWithTitle:(NSString *)title
                             imageName:(NSString *)imageName
                    highlightImageName:(NSString *)highlightImageName
                                target:(id)target
                              selector:(SEL)selector
{
    UIButton *button = nil;
    
    if (imageName || highlightImageName) {
        button = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    else {
        button = [UIButton buttonWithType:UIButtonTypeSystem];
    }
    
    //    button.titleLabel.text = title;
    button.titleLabel.font = [UIFont systemFontOfSize:15.f];
    
    
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setExclusiveTouch:YES];
    
    if (target && selector) {
        [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    }
    
    if ([imageName isKindOfClass:[NSString class]] && imageName.length > 0) {
        [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    }
    else if([imageName isKindOfClass:[UIImage class]]){
        [button setImage:(id)imageName forState:UIControlStateNormal];
    }
    
    if ([highlightImageName isKindOfClass:[NSString class]] && highlightImageName.length > 0) {
        [button setImage:[UIImage imageNamed:highlightImageName] forState:UIControlStateHighlighted];
    }
    else if([highlightImageName isKindOfClass:[UIImage class]]){
        [button setImage:(id)highlightImageName forState:UIControlStateHighlighted];
    }
    
    [button sizeToFit];
    ///仅存在图片
    if (title.length == 0 &&  imageName.length != 0) {
        button.frame = CGRectMake(0, 0, MAX(CGRectGetWidth(button.frame), 25), 44);
    }
 
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}


@end

