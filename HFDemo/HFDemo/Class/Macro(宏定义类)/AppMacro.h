//
//  AppMacro.h
//  BBGWallet
//
//  Created by Zick.Zhao on 2017/8/10.
//  Copyright © 2017年 HappinessFamily. All rights reserved.
//

#ifndef AppMacro_h
#define AppMacro_h

//#define printf(X, ...) //禁用所有C代码打印

///禁用函数
#define _DEPRECATED __attribute__((deprecated))
#define _DEPRECATED_T(X) __attribute__((deprecated(X)))
#define _DEPRECATED_IOS(_intro, _dep, X) __attribute__((deprecated(X)))

/// 屏幕高度
#ifndef SCREEN_HEIGHT
#define SCREEN_HEIGHT         [[UIScreen mainScreen] bounds].size.height
#endif
/// 屏幕宽度
#ifndef SCREEN_WIDTH
#define SCREEN_WIDTH          [[UIScreen mainScreen] bounds].size.width
#endif

/// 状态栏高度
#ifndef STATUSBAR_HEIGHT
#define STATUSBAR_HEIGHT      20.0f
#endif

/// 导航栏栏高度
#ifndef NAVGATION_HEIGHT
#define NAVGATION_HEIGHT      44.0f
#endif

/// 导航栏底部
#ifndef NAVGATION_BOTTOM
#define NAVGATION_BOTTOM      (NAVGATION_HEIGHT + STATUSBAR_HEIGHT)
#endif

/// 实际展示高度
#ifndef VIEW_HEIGHT
#define VIEW_HEIGHT           (SCREEN_HEIGHT - NAVGATION_BOTTOM)
#endif


#define RGBA(r,g,b,a)         [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]
#define RGB(r,g,b)            [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
//#88d142 0x88d142 0X88d142  88d142 都行
#define RGBHex(hexString)      [UIColor colorWithHexString:hexString]

//相同rgb
#define RGBSame(c)              RGBA(c,c,c,1)

///rect
#define _X_(rect) rect.origin.x
#define _Y_(rect) rect.origin.y
#define _W_(rect) rect.size.width
#define _H_(rect) rect.size.height

///app键盘消失
#define kDismissAppKeyboardFunction [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];

/**
 *  kFont kBFont
 */
#define kFont(fontSize)   [UIFont systemFontOfSize:fontSize]
#define kBFont(fontSize)  [UIFont boldSystemFontOfSize:fontSize]

/**
 *  ss
 */
#define SS(source) (([source isKindOfClass:[NSNull class]]?@"":source) == nil?@"":(NSString*)source)

/**
 Synthsize a weak or strong reference.
 
 Example:
 @weakify(self)
 [self doSomething^{
 @strongify(self)
 if (!self) return;
 ...
 }];
 
 */


//#if !__has_include(<ReactiveCocoa/extobjc/RACEXTScope.h>)

#if 1
#import "RACEXTScope.h"
#else

#ifndef weakify
#if DEBUG
#if __has_feature(objc_arc)
#define weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
#endif
#else
#if __has_feature(objc_arc)
#define weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
#endif
#endif
#endif

#ifndef strongify
#if DEBUG
#if __has_feature(objc_arc)
#define strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) autoreleasepool{} __typeof__(object) object = block##_##object;
#endif
#else
#if __has_feature(objc_arc)
#define strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) try{} @finally{} __typeof__(object) object = block##_##object;
#endif
#endif
#endif

#endif

 


#endif /* AppMacro_h */
