//
//  BaseModel.h
//  KSD
//
//  Created by unispeed on 2018/3/26.
//  Copyright © 2018年 Ding. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class BasePresenter;
//@class BaseVC;

@protocol BaseModelProtocol <NSObject>

+ (void)ManualRequestURL:(NSString *)urlString withParams:(NSDictionary *)params tag:(NSString *)tag success:(void(^)(NSDictionary *result, NSString *tag))success fail:(void(^)(NSString *tag))fail empty:(void(^)(NSString *tag))empty error:(void(^)(NSString *tag))error;

+ (void)requestURL:(NSString *)urlString withParams:(NSDictionary *)params tag:(NSString *)tag success:(void(^)(id obj, NSString *tag))success fail:(void(^)(NSString *tag))fail empty:(void(^)(NSString *tag))empty error:(void(^)(NSString *tag))error;

+ (void)ManualRequestURL:(NSString *)urlString withImage:(UIImage *)image withParams:(NSDictionary *)params tag:(NSString *)tag success:(void(^)(NSDictionary *result, NSString *tag))success fail:(void(^)(NSString *tag))fail empty:(void(^)(NSString *tag))empty error:(void(^)(NSString *tag))error;

+ (void)requestURL:(NSString *)urlString withImage:(UIImage *)image withParams:(NSDictionary *)params tag:(NSString *)tag success:(void(^)(id obj, NSString *tag))success fail:(void(^)(NSString *tag))fail empty:(void(^)(NSString *tag))empty error:(void(^)(NSString *tag))error;

@end

@interface BaseModel : NSObject <BaseModelProtocol>

@property (nonatomic, weak) BasePresenter *presenter;

@end
