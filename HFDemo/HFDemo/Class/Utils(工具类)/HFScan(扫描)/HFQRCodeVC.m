//
//  HFQRCodeVC.m
//  HFDemo
//
//  Created by smallsevenk on 2017/8/29.
//  Copyright © 2017年 HappinessFamily. All rights reserved.
//

#import "HFQRCodeVC.h"
#import "LCQrcodeUtil.h"

@interface HFQRCodeVC ()

@end

@implementation HFQRCodeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *qrCodeImg =  [LCQRCodeUtil createQRimageString:@"test" sizeWidth:300 fillColor:[UIColor orangeColor]];
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,qrCodeImg.size.width,qrCodeImg.size.height)];
    imgView.image = qrCodeImg;
    imgView.top = 100;
    [self.view addSubview:imgView];
    [imgView setCenterXEqualSuper];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

