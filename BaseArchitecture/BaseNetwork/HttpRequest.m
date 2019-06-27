//
//  HttpRequest.m
//  KSD
//
//  Created by unispeed on 2018/3/26.
//  Copyright © 2018年 Ding. All rights reserved.
//

#import "HttpRequest.h"
#import "ObjectHasUtil.h"
#import "HttpU.h"

@implementation HttpRequest


+ (void)requestPost:(NSString *)urlPath withParameters:(NSDictionary *)parameters success:(void (^)(NSDictionary *))success fail:(void (^)(void))failBlc empty:(void (^)(void))emptyBlc error:(void (^)(void))errorBlc {
    HttpU *http = [[HttpU alloc] init];
    [http requestPost:urlPath withParameters:parameters completedBlock:^(id responseObject) {
        if ([ObjectHasUtil parseSuccess:responseObject]) {
            //获得提示消息
//            NSString *message = [ObjectHasUtil parseMsg:responseObject];
            //获得code
//            NSString *code = [ObjectHasUtil parseCode:responseObject];
            NSDictionary *dic = [ObjectHasUtil parseResponse:responseObject];
            if (dic != nil && ([dic isKindOfClass:[NSDictionary class]] || [dic isKindOfClass:[NSArray class]])) {
                success(dic);
            }else {
                emptyBlc();
            }
        }else {
            failBlc();
        }
    } failureBlock:^(NSError *error) {
        errorBlc();
    }];
}

+ (void)requestPost:(NSString *)urlPath withImage:(UIImage *)image withParameters:(NSDictionary *)parameters success:(void (^)(NSDictionary *))success fail:(void (^)(void))failBlc empty:(void (^)(void))emptyBlc error:(void (^)(void))errorBlc {
    HttpU *http = [[HttpU alloc] init];
    [http requestPost:urlPath withImage:image andParam:parameters completedBlock:^(id responseObject) {
        if ([ObjectHasUtil parseSuccess:responseObject]) {
            //获得提示消息
//            NSString *message = [ObjectHasUtil parseMsg:responseObject];
            //获得code
//            NSString *code = [ObjectHasUtil parseCode:responseObject];
            NSDictionary *dic = [ObjectHasUtil parseResponse:responseObject];
            if (dic != nil &&[ dic isKindOfClass:[NSDictionary class]]) {
                success(dic);
            }else {
                emptyBlc();
            }
        }else {
            failBlc();
        }
    } failureBlock:^(NSError *error) {
        errorBlc();
    }];
}


@end
