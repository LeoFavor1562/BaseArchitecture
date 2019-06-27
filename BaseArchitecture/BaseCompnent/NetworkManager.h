//
//  NetworkManager.h
//  BaseDemo
//
//  Created by coder on 2019/6/24.
//  Copyright © 2019 coder. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NetworkManager : NSObject

+ (id)shareManager;
/**
 设置get请求的path，需要在app初始化时设置
 */
- (void)setGetRequestsPaths:(NSArray <NSString *>*)getPaths;
/**
 判断是否是个get请求
 */
- (BOOL)isGetRequest:(NSString *)url;
/**
 检测网络环境
 */
- (void)monitorNetworking;

- (BOOL)haveNetwork;
- (BOOL)isWiFi;

@end

NS_ASSUME_NONNULL_END
