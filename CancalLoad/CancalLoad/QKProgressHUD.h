//
//  QKProgressHUD.h
//  CancalLoad
//
//  Created by Sunny on 2/4/19.
//  Copyright © 2019年 Sunny. All rights reserved.
//

#import "MBProgressHUD.h"
#import <MBProgressHUD/MBProgressHUD.h>

NS_ASSUME_NONNULL_BEGIN

@interface QKProgressHUD : MBProgressHUD
@property(nonatomic,weak)NSURLSessionDataTask *sessionDataTask;

@end

NS_ASSUME_NONNULL_END
