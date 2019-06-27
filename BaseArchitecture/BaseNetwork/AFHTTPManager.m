

//
//  AFHTTPManager.m
//  KSD
//
//  Created by unispeed on 2018/4/28.
//  Copyright © 2018年 Ding. All rights reserved.
//

#import "AFHTTPManager.h"

@implementation AFHTTPManager


+ (AFHTTPManager *)sharedClient{
    static AFHTTPManager *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [AFHTTPManager manager];
    });
    return _sharedClient;
}

@end
