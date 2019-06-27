//
//  ObjectHasUtil.m
//  IosLangTest
//
//  Created by jessie on 2018/3/16.
//  Copyright © 2018年 langzu. All rights reserved.
//

#import "ObjectHasUtil.h"
#import "NSDictionary+RequestEncoding.h"
#import "BaseDefine.h"

@implementation ObjectHasUtil
+ (BOOL)objectHasSetter:(NSObject *)object propertyName:(NSString *)propertyName
{
    NSString *setterString = [NSString stringWithFormat:@"set%@%@:",
                              [[propertyName substringToIndex:1] capitalizedString],
                              [propertyName substringFromIndex:1]];
    return [object respondsToSelector:NSSelectorFromString(setterString)];
}

+ (BOOL)objectHasGetter:(NSObject *)object propertyName:(NSString *)propertyName
{
    return [object respondsToSelector:NSSelectorFromString(propertyName)];
}

/*
 解析服务端是否返回合法结果
 */
+ (NSDictionary *)parseResponse:(NSString *)responseStr{
    
    NSData *data;
    if ([responseStr isKindOfClass:[NSDictionary class]]) {
        data = [NSJSONSerialization dataWithJSONObject:responseStr options:NSJSONWritingPrettyPrinted error:nil];
    }else{
        data = [responseStr dataUsingEncoding:NSUTF8StringEncoding];
    }
    if (IsNilOrNull(data)) {
        return nil;
    }
    NSError *error = nil;
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    
    return dictionary;
}


/*
 解析服务端是否返回合法结果
 */
+ (BOOL)parseSuccess:(NSString *)responseStr{
    
    BOOL isSuccess = NO;
    NSData *data;
    if ([responseStr isKindOfClass:[NSDictionary class]]) {
        data = [NSJSONSerialization dataWithJSONObject:responseStr options:NSJSONWritingPrettyPrinted error:nil];
    }else{
        data = [responseStr dataUsingEncoding:NSUTF8StringEncoding];
    }
    if (IsNilOrNull(data)) {
        return NO;
    }
    NSError *error = nil;
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    
//    NSNumber *success = [dictionary objectForKey:@"success"];
//    if ([success intValue] == 1) {
//        isSuccess = YES;
//    }
    NSString *code = [dictionary objectForKey:@"code"];
    if (code.intValue == 200) {
        isSuccess = YES;
    }
    
    return isSuccess;
}


/*
 解析message信息
 */
+ (NSString *)parseMsg:(id)responseStr{
    NSString *msg = @"";
    NSData *data;
    if ([responseStr isKindOfClass:[NSDictionary class]]) {
        data = [NSJSONSerialization dataWithJSONObject:responseStr options:NSJSONWritingPrettyPrinted error:nil];
    }else{
        data = [responseStr dataUsingEncoding:NSUTF8StringEncoding];
    }
    if (IsNilOrNull(data)) {
        return msg;
    }
    NSError *error = nil;
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    msg = [dictionary sd_safeObjectForKey:@"message"];
    
    return msg;
}

/*
 解析code信息
 */
+ (NSString *)parseCode:(id)responseStr{
    NSString *code = @"";
    NSData *data;
    if ([responseStr isKindOfClass:[NSDictionary class]]) {
        data = [NSJSONSerialization dataWithJSONObject:responseStr options:NSJSONWritingPrettyPrinted error:nil];
    }else{
        data = [responseStr dataUsingEncoding:NSUTF8StringEncoding];
    }
    if (IsNilOrNull(data)) {
        return code;
    }
    NSError *error = nil;
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    code = [dictionary sd_safeObjectForKey:@"code"];
    
    return code;
}



@end
