//
//  UIAlertView+CategoryKit.h
//   
//
//  Created by xujun on 14-3-15.
//  Copyright (c) 2014 xujun. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^CompleteBlock) (NSInteger buttonIndex);

@interface UIAlertView (CategoryKit)


- (void)showAlertViewWithCompleteBlock:(CompleteBlock)block;

@end

NS_ASSUME_NONNULL_END
