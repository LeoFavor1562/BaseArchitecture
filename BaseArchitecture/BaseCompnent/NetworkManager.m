//
//  NetworkManager.m
//  BaseDemo
//
//  Created by coder on 2019/6/24.
//  Copyright © 2019 coder. All rights reserved.
//

#import "NetworkManager.h"
#import "AFNetworking.h"

@interface NetworkManager ()

@property (nonatomic, strong) NSArray *getGetPaths;
@property (nonatomic, assign) BOOL haveNetwork;
@property (nonatomic, assign) BOOL isWiFi;

@end

@implementation NetworkManager

static NetworkManager *networkManager = nil;
+ (id)shareManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        networkManager = [[self alloc] init];
    });
    return networkManager;
}

+ (id)alloc {
    @synchronized (self) {
        if (!networkManager) {
            return [super alloc];
        }
    }
    return networkManager;
}

- (void)setGetRequestsPaths:(NSArray <NSString *>*)getPaths {
    if ([getPaths isKindOfClass:[NSArray class]]) {
        _getGetPaths = getPaths;
    }
}

- (BOOL)isGetRequest:(NSString *)url {
    for (NSString *getPath in _getGetPaths) {
        if ([url containsString:getPath]) {
            return YES;
        }
    }
    return NO;
}

- (void)monitorNetworking {
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        if (status == AFNetworkReachabilityStatusReachableViaWWAN || status == AFNetworkReachabilityStatusReachableViaWiFi) {
            self.haveNetwork = YES;
            if (status == AFNetworkReachabilityStatusReachableViaWiFi) {
                self.isWiFi = YES;
            } else {
                self.isWiFi = NO;
            }
        }else {
            self.haveNetwork = NO;
            self.isWiFi = NO;
        }
    }];
}

- (BOOL)haveNetwork {
    return _haveNetwork;
}

- (BOOL)isWiFi {
    return _isWiFi;
}

@end
