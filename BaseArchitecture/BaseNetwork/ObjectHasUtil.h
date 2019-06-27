//
//  ObjectHasUtil.h
//  IosLangTest
//
//  Created by jessie on 2018/3/16.
//  Copyright © 2018年 langzu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ObjectHasUtil : NSObject
+ (BOOL)objectHasSetter:(NSObject *)object propertyName:(NSString *)propertyName;
+ (BOOL)objectHasGetter:(NSObject *)object propertyName:(NSString *)propertyName;
+(NSDictionary *)parseResponse:(NSString *)responseStr;
/*
 解析服务端是否返回合法结果
 */
+(BOOL)parseSuccess:(NSString *)responseStr;
/*
 解析message信息
 */
+(NSString *)parseMsg:(id)responseStr;

+(NSString *)parseCode:(id)responseStr;


@end
