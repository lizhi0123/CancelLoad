//
//  QKRequestManager.m
//  CancalLoad
//
//  Created by Sunny on 1/4/19.
//  Copyright © 2019年 Sunny. All rights reserved.
//

#import "QKRequestManager.h"

#import "QKProgressHUD.h"
#import <objc/runtime.h>

@implementation QKRequestManager


-(AFHTTPSessionManager *)httpSessionManager{
    if (!_httpSessionManager) {
        _httpSessionManager = [[AFHTTPSessionManager alloc] init];
        [_httpSessionManager.requestSerializer setTimeoutInterval:60];

    }
    return  _httpSessionManager;
}

-(NSURLSessionDataTask *)getRequestWithUrl:(NSString*)url controller:(UIViewController *)controller{
    
    QKProgressHUD *hud = [self cancelationExampleWithController:controller];
    NSURLSessionDataTask *dataTask = [self.httpSessionManager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"成功" message:nil preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [hud hideAnimated:NO];
        }] ];
        [controller presentViewController:alert animated:YES completion:^{
            ;
        }];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSInteger code =   error.code;
        NSLog(@"errorcode = %ld",(long)code);
        NSString *title = @"失败";
        if (code == NSURLErrorCancelled) {
            NSLog(@"被取消");
             title = @"取消成功";
        }
       
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:nil preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [hud hideAnimated:YES];
        }] ];
        [controller presentViewController:alert animated:YES completion:^{
            ;
        }];
    }];
    hud.sessionDataTask = dataTask;
    return dataTask;
}


- (QKProgressHUD *)cancelationExampleWithController:(UIViewController *)controller {
    QKProgressHUD *hud = [QKProgressHUD showHUDAddedTo:controller.view animated:YES];
    
    // Set the determinate mode to show task progress.
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.label.text = NSLocalizedString(@"Loading...", @"HUD loading title");
    
    // Configure the button.
    [hud.button setTitle:NSLocalizedString(@"Cancel", @"HUD cancel button title") forState:UIControlStateNormal];
    objc_setAssociatedObject(hud.button, "hud", hud, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [hud.button addTarget:self action:@selector(cancelWork:) forControlEvents:UIControlEventTouchUpInside];
    

    return hud;
}
-(void)cancelWork:(id)button{
    QKProgressHUD *hud = objc_getAssociatedObject(button, "hud");
    [hud hideAnimated:YES];
    [hud.sessionDataTask cancel];
}
//[[AFHTTPSessionManager manager] GET:@"http:www.baidu.com" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
//
//} success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//
//} failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//
//}];

@end
