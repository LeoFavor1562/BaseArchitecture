//
//  BaseDefine.h
//  BaseDemo
//
//  Created by coder on 2019/6/24.
//  Copyright © 2019 coder. All rights reserved.
//

#ifndef BaseDefine_h
#define BaseDefine_h

//屏幕宽度
#define SCREEN_WIDTH  [[UIScreen mainScreen] bounds].size.width
//屏幕高度
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height
//顶部安全区域
#define SafeAreaGuideTop ((@available(iOS 11.0, *)) ? [UIApplication sharedApplication].keyWindow.safeAreaInsets.top : 0.0)
//底部安全区域
#define SafeAreaGuideBottom ((@available(iOS 11.0, *)) ? [UIApplication sharedApplication].keyWindow.safeAreaInsets.bottom : 0.0)

//打印日志
#ifdef DEBUG
#   define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#   define DLog(...)
#endif

//弱引用
#define WeakSelf __weak typeof(self) wself = self;

//宽度一定，求高
#define STRING_SIZE_FONT_HEIGHT(_width_, _string_, _fsize_) [_string_ boundingRectWithSize:CGSizeMake(_width_, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:_fsize_]} context:nil].size;
//高度一定，求宽
#define STRING_SIZE_FONT_WIDTH(_height_, _string_, _fsize_) [_string_ boundingRectWithSize:CGSizeMake(MAXFLOAT, _height_) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:_fsize_]} context:nil].size;
//判断字符串是否为nil
#define STRING_judge(str) (!(str == nil || [str isKindOfClass:[NSNull class]] )?str:@"")
//判断字符串是否为nil或null
#define IsNilOrNull(_ref)   (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]))
//判断字符串是否为空
#define IsStrEmpty(_ref)    (((_ref) == nil) || ([(_ref) isKindOfClass:[NSNull class]]) ||([(_ref) isEqual:@""]))

#endif /* BaseDefine_h */
