//
//  UIButton+Additions.m
//  Kurrent
//
//  Created by liangpingxian on 15/7/29.
//  Copyright (c) 2015年 Kurrent. All rights reserved.
//

#import "UIButton+Additions.h"
#import "NSString+Additions.h"
#import <objc/runtime.h>
//#import "DeviceManager.h"


@implementation UIButton (Additions)

+ (UIButton *)upImageDownTitleButtonWithFrame:(CGRect)frame imageName:(NSString *)imageName title:(NSString *)title
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    UIImage *Image = [UIImage imageNamed:imageName];
    UIImageView *imageView = (UIImageView *)[button viewWithTag:8888];
    if (!imageView) {
        imageView = [[UIImageView alloc] initWithFrame:CGRectMake((frame.size.width - Image.size.width) / 2, 5, Image.size.width, Image.size.height)];
        [button addSubview:imageView];
    }
    imageView.image = Image;
    
    UILabel *titleLabel = (UILabel *)[button viewWithTag:9999];
    if (!titleLabel) {
        titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, imageView.frame.origin.y + imageView.frame.size.height, frame.size.width, 20)];
        titleLabel.font = [UIFont systemFontOfSize:14];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.textColor = RGBA(153, 153, 153, 1);
        titleLabel.tag = 9999;
        [button addSubview:titleLabel];
    }
    titleLabel.text = title;
    
    [button setExclusiveTouch:YES];
    return button;
}


+ (UIButton *)buttonWithImage:(NSString *)aImage
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    if(aImage.length > 0){
        [button setImage:[UIImage imageNamed:aImage] forState:UIControlStateNormal];
    }
    
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

    button.frame = CGRectMake(0, 0, 44, 44);
    button.titleLabel.font = [UIFont systemFontOfSize:15.f];
    [button setExclusiveTouch:YES];
    return button;
}


+ (UIButton *)buttonWithTitle:(NSString *)title image:(NSString *)aImage
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    if(aImage.length > 0){
        [button setImage:[UIImage imageNamed:aImage] forState:UIControlStateNormal];
    }
        
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    button.frame = CGRectMake(0, 0, 44, 44);
    button.titleLabel.font = [UIFont systemFontOfSize:15.f];
    [button setExclusiveTouch:YES];
    return button;
}

- (void)setTitle:(NSString *)title image:(NSString *)aImage
{
    UIImage *image = nil;
    
    if (aImage.length > 0) {
        image = [UIImage imageNamed:aImage];
    }
    
    [self setTitle:title forState:UIControlStateNormal];
    
//    if (image) {
        [self setImage:image forState:UIControlStateNormal];
//    }
    
    CGFloat width = [title widthWithFont:self.titleLabel.font];
    
    CGRect frame = self.frame;
    frame.size.width  = width + (image ? frame.size.height : 0);
    self.frame = frame;
    
}


//点击不改变
+ (UIButton *)buttonWithState:(NSString *)title image:(NSString *)image Color:(UIColor *)color{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    if(![image isEqualToString:@""]){
        [button setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateHighlighted];
    }
    button.titleLabel.font = [UIFont systemFontOfSize:15.f];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateHighlighted];
    [button setTitleColor:color forState:UIControlStateNormal];
    [button setTitleColor:color forState:UIControlStateHighlighted];
    [button setExclusiveTouch:YES];
    button.frame = CGRectMake(0, 0, 50, 30);
    return button;
    
}

+ (UIButton *)buttonWithCenterImage:(NSString *)aImage frame:(CGRect)frame{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    if(aImage.length > 0){
        UIImage *Images = [UIImage imageNamed:aImage];
        [button setImage:Images forState:UIControlStateNormal];
        [button setImage:Images forState:UIControlStateHighlighted];
    }
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    button.frame = frame;
    [button setExclusiveTouch:YES];
    return button;
    
}

+ (UIButton *)buttonWithImage:(NSString *)aImage title:(NSString *)title
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    if(aImage.length > 0){
        [button setBackgroundImage:[UIImage imageNamed:aImage] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:aImage] forState:UIControlStateHighlighted];
    }
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateHighlighted];
    button.titleLabel.font = [UIFont systemFontOfSize:13.f];
    [button setExclusiveTouch:YES];
    button.frame = CGRectMake(0, 0, 70, 30);
    return button;
}

+ (UIButton *)buttonWithImage:(NSString *)aImage bImage:(NSString *)bImage
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    if(aImage.length > 0){
        [button setBackgroundImage:[UIImage imageNamed:aImage] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:bImage] forState:UIControlStateHighlighted];
    }
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [button setExclusiveTouch:YES];
    button.frame = CGRectMake(0, 0, 70, 30);
    return button;
}

+ (UIButton *)buttonWithImage:(NSString *)title finishedSelectedImage:(NSString *)FinishedSelectedImage finishedUnselectedImage:(NSString *)FinishedUnselectedImage
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    if(![FinishedSelectedImage isEqualToString:@""])
        [button setBackgroundImage:[UIImage imageNamed:FinishedSelectedImage] forState:UIControlStateNormal];
    
    if (![FinishedUnselectedImage isEqualToString:@""])
        [button setBackgroundImage:[UIImage imageNamed:FinishedUnselectedImage] forState:UIControlStateHighlighted];
    
    [button.titleLabel setFont:[UIFont boldSystemFontOfSize:28.0]];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateHighlighted];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [button setTitleShadowColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [button setTitleShadowColor:[UIColor darkGrayColor] forState:UIControlStateHighlighted];
    [button.titleLabel setShadowOffset:CGSizeMake(0, -0.5)];
    
    [button setExclusiveTouch:YES];
    button.frame = CGRectMake(0, 0, 70, 30);
    return button;
}

///左右位置
+ (UIButton *)buttonWithImageTitle:(NSString *)LeftImage title:(NSString *)title frame:(CGRect)frame
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    button.titleLabel.font = [UIFont systemFontOfSize:17];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    UIImage *LeftIcon = [UIImage imageNamed:LeftImage];
    [button setImage:LeftIcon forState:UIControlStateNormal];
    [button setImage:LeftIcon forState:UIControlStateHighlighted];
    button.imageEdgeInsets = UIEdgeInsetsMake(2, -(frame.size.width - button.imageView.frame.size.width - button.titleLabel.bounds.size.width+15), 3,5);
    button.titleLabel.numberOfLines = 0;
    [button setExclusiveTouch:YES];
    return button;
}

+ (UIButton *)buttonWithTitleImage:(NSString *)LeftImage title:(NSString *)title frame:(CGRect)frame{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    //    button.titleLabel.frame=CGRectMake(frame.origin.x,frame.origin.y,frame.size.width-20,frame.size.height);
    //    [button.titleLabel setBackgroundColor:[UIColor redColor]];
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    UIImage *LeftIcon = [UIImage imageNamed:LeftImage];
    [button setImage:LeftIcon forState:UIControlStateNormal];
    button.imageEdgeInsets = UIEdgeInsetsMake(0, frame.size.width - (LeftIcon.size.width + 5), 0,0);
    
    [button setExclusiveTouch:YES];
    return button;
}

//上图片下文字
+ (UIButton *)buttonWithUpImageNextTilte:(NSString *)imagePath title:(NSString *)title frame:(CGRect)frame{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    UIImage *Image = [UIImage imageNamed:imagePath];
    UIImageView *imageView = (UIImageView *)[button viewWithTag:8888];
    if (!imageView) {
        imageView = [[UIImageView alloc] initWithFrame:CGRectMake((frame.size.width - Image.size.width) / 2, 5, Image.size.width, Image.size.height)];
        [button addSubview:imageView];
    }
    imageView.image = Image;
    
    UILabel *titleLabel = (UILabel *)[button viewWithTag:9999];
    if (!titleLabel) {
        titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, imageView.frame.origin.y + imageView.frame.size.height, frame.size.width, 20)];
        titleLabel.font = [UIFont systemFontOfSize:14];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.textColor = RGBA(153, 153, 153, 1);
        titleLabel.tag = 9999;
        [button addSubview:titleLabel];
    }
    titleLabel.text = title;
    
    [button setExclusiveTouch:YES];
    return button;
}

//圆角边框回复按钮
+ (UIButton *)buttonWithComments:(CGRect)frame{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button setTitle:@"我也说一句..." forState:UIControlStateNormal];
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [button setTitleEdgeInsets:UIEdgeInsetsMake(0, 5, 0, 0)];
    button.titleLabel.font = [UIFont systemFontOfSize:17];
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 4;
    button.layer.borderWidth =.5;
    button.layer.borderColor = [UIColor colorWithRed:220.0/255.0 green:220.0/255.0 blue:220.0/255.0 alpha:1].CGColor;
    [button setExclusiveTouch:YES];
    return button;
}

//圆角按钮
+ (id)buttonWithFillet:(NSString *)title frame:(CGRect)frame{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    button.titleLabel.font = [UIFont systemFontOfSize:17];
    
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateHighlighted];
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 4;
    [button setExclusiveTouch:YES];
    return button;
}

//圆角按钮
+ (id)buttonWithFillet:(NSString *)title frame:(CGRect)frame titleColor:(UIColor *)color mode:(UIControlContentHorizontalAlignment)mode{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateHighlighted];
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 4;
    [button setTitleColor:color forState:UIControlStateNormal];
    [button setTitleColor:color forState:UIControlStateHighlighted];
    if (mode == UIControlContentHorizontalAlignmentLeft)
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    button.contentHorizontalAlignment = mode;
    [button setExclusiveTouch:YES];
    return button;
}

+ (id)buttonWithFillet:(NSString *)aImage title:(NSString *)title frame:(CGRect)frame{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    if(aImage.length > 0){
        [button setBackgroundImage:[UIImage imageNamed:aImage] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:aImage] forState:UIControlStateHighlighted];
    }
    button.frame = frame;
    button.titleLabel.font = [UIFont systemFontOfSize:17];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateHighlighted];
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 4;
    [button setExclusiveTouch:YES];
    return button;
}

//蓝色按钮
+ (id)buttonFont{
    //搜索按钮图片
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *img = [UIImage imageNamed:@""];
    UIImage *img1 = [UIImage imageNamed:@""];
    //拉伸图片
    img = [img resizableImageWithCapInsets:UIEdgeInsetsMake(20, 10, 20, 10)];
    img1 = [img1 resizableImageWithCapInsets:UIEdgeInsetsMake(20, 10, 20, 10)];
    [button1.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [button1 setBackgroundImage:img forState:UIControlStateNormal];
    [button1 setBackgroundImage:img1 forState:UIControlStateHighlighted];
    button1.backgroundColor = RGBA(255, 154, 20, 1);
    
//    if ([DeviceManager deviceType] == kDeviceTypeIPhone6Plus) {
//        [button1.titleLabel setFont:[UIFont systemFontOfSize:19]];
//        
//    }
//    if ([DeviceManager deviceType] == kDeviceTypeIPhone6) {
//        [button1.titleLabel setFont:[UIFont systemFontOfSize:17]];
//    }
    return button1;
}




@end
