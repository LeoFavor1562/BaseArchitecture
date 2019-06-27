//
//  HttpU.h
//  IosLangTest
//
//  Created by jessie on 2018/3/19.
//  Copyright © 2018年 langzu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPManager.h"
#import "NSDictionary+RequestEncoding.h"

@interface HttpU : NSObject

@property (nonatomic, assign) int retryCount;
@property (nonatomic, assign) BOOL isCache;//是否用缓存


-(void)requestPost:(NSString *)urlPath withParameters:(NSDictionary *)param completedBlock:(void(^)(id responseObject))completedBlock failureBlock:(void(^)(NSError *error))failureBlock;

//单张图片上传
-(void)requestPost:(NSString *)urlPath withImage:(UIImage *)image andParam:(NSDictionary *)param completedBlock:(void(^)(id responseObject))completedBlock failureBlock:(void(^)(NSError *error))failureBlock;

//多张图片上传
- (void)requestPost:(NSString *)urlPath withImages:(NSArray<UIImage *> *)images andParam:(NSDictionary *)param completedBlock:(void(^)(id responseObject))completedBlock failureBlock:(void(^)(NSError *error))failureBlock;

@end
