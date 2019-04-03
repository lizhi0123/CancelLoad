//
//  QKRequestManager.h
//  CancalLoad
//
//  Created by Sunny on 1/4/19.
//  Copyright © 2019年 Sunny. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

NS_ASSUME_NONNULL_BEGIN

@interface QKRequestManager : NSObject

@property(nonatomic,strong)AFHTTPSessionManager *httpSessionManager;

-(NSURLSessionDataTask *)getRequestWithUrl:(NSString*)url controller:(UIViewController *)controller;

@end

NS_ASSUME_NONNULL_END
