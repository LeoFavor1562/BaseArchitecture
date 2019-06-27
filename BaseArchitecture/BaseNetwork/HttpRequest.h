//
//  HttpRequest.h
//  KSD
//
//  Created by unispeed on 2018/3/26.
//  Copyright © 2018年 Ding. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class BaseVC;

@interface HttpRequest : NSObject

+ (void)requestPost:(NSString *)urlPath withParameters:(NSDictionary *)parameters success:(void(^)(NSDictionary *resultDic))success fail:(void(^)(void))failBlc empty:(void(^)(void))emptyBlc error:(void(^)(void))errorBlc;

+ (void)requestPost:(NSString *)urlPath withImage:(UIImage*)image withParameters:(NSDictionary *)parameters success:(void(^)(NSDictionary *resultDic))success fail:(void(^)(void))failBlc empty:(void(^)(void))emptyBlc error:(void(^)(void))errorBlc;

@end
