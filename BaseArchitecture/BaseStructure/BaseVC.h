//
//  BaseVC.h
//  KSD
//
//  Created by unispeed on 2018/3/26.
//  Copyright © 2018年 Ding. All rights reserved.
//

#import <UIKit/UIKit.h>
#import  <objc/runtime.h>

@protocol BaseVCProtocol <NSObject>

@optional
- (void)loadWithURL:(NSString *)urlString withParams:(NSDictionary *)params;

@end

@interface BaseVC : UIViewController


- (void)reloadViews:(NSString *)tag;
- (void)fail:(NSString *)tag;
- (void)empty:(NSString *)tag;
- (void)error:(NSString *)tag;


@end
