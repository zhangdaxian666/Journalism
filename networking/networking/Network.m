//
//  Network.m
//  networking
//
//  Created by slcf888 on 2017/12/13.
//  Copyright © 2017年 slcf888. All rights reserved.
//

#import "Network.h"
#import <AFNetworking.h>

@implementation Network

- (void)getDataWithUrlString:(NSString *)urlString
{
    AFHTTPSessionManager *manager =[AFHTTPSessionManager manager];
    NSURL *url =[NSURL URLWithString:urlString];
    [manager GET:url.absoluteString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        _Block(responseObject); //请求成功
        NSLog(@"%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}
@end
