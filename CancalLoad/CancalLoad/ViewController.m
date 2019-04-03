//
//  ViewController.m
//  CancalLoad
//
//  Created by Sunny on 1/4/19.
//  Copyright © 2019年 Sunny. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking/AFNetworking.h>
#import "QKRequestManager.h"

@interface ViewController ()

@property(nonatomic ,strong)QKRequestManager *requestManager;

@end

@implementation ViewController

-(QKRequestManager *)requestManager{
    if (!_requestManager) {
        _requestManager = [[QKRequestManager alloc] init];
    }
    return  _requestManager;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title  = @"首页";
    self.navigationController.navigationBar.backgroundColor = [UIColor redColor];
     [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)buttonClick:(id)sender {
    
//    UIStoryboard *mainBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    TipAlertController *tipAlertCtr = [mainBoard instantiateViewControllerWithIdentifier:@"TipAlertController"];
//
//    tipAlertCtr.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
//    tipAlertCtr.modalPresentationStyle = UIModalPresentationOverCurrentContext;
//    
//    
//    [self presentViewController:tipAlertCtr animated:YES completion:^{
//        ;
//    }];
    
    [self.requestManager getRequestWithUrl:@"http://v.juhe.cn/toutiao/index?type=top&key=f1db1cefce44c93b2549b592a7fe6039" controller:self];
    
//    [[AFHTTPSessionManager manager] GET:@"http:www.baidu.com" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
//
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//
//    }];
    

}


@end
