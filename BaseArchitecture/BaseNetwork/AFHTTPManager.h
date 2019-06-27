//
//  AFHTTPManager.h
//  KSD
//
//  Created by unispeed on 2018/4/28.
//  Copyright © 2018年 Ding. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface AFHTTPManager : AFHTTPSessionManager

/**
 Creates and returns an `AFHTTPSessionManager` 单例.
 */
+ (AFHTTPManager *)sharedClient;

@end
