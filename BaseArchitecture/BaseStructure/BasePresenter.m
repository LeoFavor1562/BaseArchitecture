//
//  BasePst.m
//  MVPDemo
//
//  Created by coder on 2019/3/4.
//  Copyright © 2019年 coder. All rights reserved.
//

#import "BasePresenter.h"

@interface BasePresenter ()

@property (nonatomic, weak) BaseVC *VC;

@end

@implementation BasePresenter

- (instancetype)initWithVC:(BaseVC *)VC {
    self = [super init];
    if (self) {
        self.VC = VC;
    }
    return self;
}

- (BaseVC *)currentVC {
    return self.VC;
}

- (void)loadWithURL:(NSString *)urlString withParams:(NSDictionary *)params {
    [[self modelClassForURLTag:urlString] requestURL:urlString withParams:params tag:urlString success:^(id obj, NSString *tag) {
        [self handleObj:obj WithTag:tag];
    } fail:^(NSString *tag) {
        [self fail:tag];
    } empty:^(NSString *tag) {
        [self empty:tag];
    } error:^(NSString *tag) {
        [self error:tag];
    }];
}

- (Class<BaseModelProtocol>)modelClassForURLTag:(NSString *)tag {
    return [BaseModel class];
}

- (void)handleObj:(id)obj WithTag:(NSString *)tag {
    void (^successBlock)(id, NSString *) = ^(id obj, NSString *tag) {
        [self success:obj tag:tag];
    };
    
    Class aClass = [self modelClassForURLTag:tag];
    if ([obj isKindOfClass:[NSArray class]]) {
        NSArray *tmpArray = obj;
        if (tmpArray.count > 0) {
            if ([tmpArray.firstObject isMemberOfClass:aClass]) {
                successBlock(obj, tag);
            }else {
                [self empty:tag];
            }
        }else {
            [self empty:tag];
        }
    }else if ([obj isKindOfClass:[BaseModel class]]) {
        if ([obj isMemberOfClass:aClass]) {
            successBlock(obj, tag);
        }else {
            [self empty:tag];
        }
    }else {
        if ([obj isKindOfClass:[NSString class]]) {
            successBlock(obj, tag);
        }else {
            [self empty:tag];
        }
    }
}

- (void)success:(id)obj tag:(NSString *)tag {
    [self.VC reloadViews:tag];
}

- (void)fail:(NSString *)tag {
    [self.VC fail:tag];
}

- (void)empty:(NSString *)tag {
    [self.VC empty:tag];
}

- (void)error:(NSString *)tag {
    [self.VC error:tag];
}

- (NSInteger)listCount {
    return self.baseArray.count;
}

- (void)setCell:(UITableViewCell *)cell ForIndex:(NSIndexPath *)indexPath {
    
}

@end
