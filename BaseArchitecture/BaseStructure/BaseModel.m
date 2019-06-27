//
//  BaseModel.m
//  KSD
//
//  Created by unispeed on 2018/3/26.
//  Copyright © 2018年 Ding. All rights reserved.
//

#import "BaseModel.h"
#import "BasePresenter.h"
#import "HttpRequest.h"
#import "MJExtension.h"

@interface BaseModel ()

@end

@implementation BaseModel

- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}


+ (void)ManualRequestURL:(NSString *)urlString withParams:(NSDictionary *)params tag:(NSString *)tag success:(void (^)(NSDictionary *, NSString *))success fail:(void (^)(NSString *))fail empty:(void (^)(NSString *))empty error:(void (^)(NSString *))error {
    [HttpRequest requestPost:urlString withParameters:params success:^(NSDictionary *resultDic) {
        success(resultDic, tag);
    } fail:^{
        fail(tag);
    } empty:^{
        empty(tag);
    } error:^{
        error(tag);
    }];
}

+ (void)requestURL:(NSString *)urlString withParams:(NSDictionary *)params tag:(NSString *)tag success:(void(^)(id, NSString *))success fail:(void(^)(NSString *))fail empty:(void(^)(NSString *))empty error:(void(^)(NSString *))error {
    [HttpRequest requestPost:urlString withParameters:params success:^(NSDictionary *resultDic) {
        
        id result = resultDic[@"result"];
        id resultObj;
        if ([result isKindOfClass:[NSDictionary class]]) {
            resultObj = [self mj_objectWithKeyValues:result];
        }else if ([result isKindOfClass:[NSArray class]]) {
            resultObj = [self mj_objectArrayWithKeyValuesArray:result];
        }else {
            resultObj = result;
        }
        success(resultObj, tag);
        
    } fail:^{
        fail(tag);
    } empty:^{
        empty(tag);
    } error:^{
        error(tag);
    }];
}

+ (void)ManualRequestURL:(NSString *)urlString withImage:(UIImage *)image withParams:(NSDictionary *)params tag:(NSString *)tag success:(void (^)(NSDictionary *, NSString *))success fail:(void (^)(NSString *))fail empty:(void (^)(NSString *))empty error:(void (^)(NSString *))error {
    [HttpRequest requestPost:urlString withImage:image withParameters:params success:^(NSDictionary *resultDic) {
        
        success(resultDic, tag);
        
    } fail:^{
        fail(tag);
    } empty:^{
        empty(tag);
    } error:^{
        error(tag);
    }];
}


+ (void)requestURL:(NSString *)urlString withImage:(UIImage *)image withParams:(NSDictionary *)params tag:(NSString *)tag success:(void (^)(id, NSString *))success fail:(void (^)(NSString *))fail empty:(void (^)(NSString *))empty error:(void (^)(NSString *))error {
    [HttpRequest requestPost:urlString withImage:image withParameters:params success:^(NSDictionary *resultDic) {
        
        id result = resultDic[@"result"];
        id resultObj;
        if ([result isKindOfClass:[NSDictionary class]]) {
            resultObj = [self mj_objectWithKeyValues:result];
        }else if ([result isKindOfClass:[NSArray class]]) {
            resultObj = [self mj_objectArrayWithKeyValuesArray:result];
        }else {
            resultObj = result;
        }
        success(resultObj, tag);
        
    } fail:^{
        fail(tag);
    } empty:^{
        empty(tag);
    } error:^{
        error(tag);
    }];
}


@end
