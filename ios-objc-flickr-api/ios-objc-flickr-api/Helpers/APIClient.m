//
//  APIClient.m
//  ios-objc-flickr-api
//
//  Created by OkuderaYuki on 2017/10/17.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

#import "APIClient.h"
#import "AFNetworking.h"

@implementation APIClient

+ (void)getRequest:(NSString *)urlString
        parameters:(id)parameters
           success:(APISuccess)success
           failure:(APIFailure)failure {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:urlString
      parameters:parameters
        progress:nil
         success:^(NSURLSessionDataTask *task, id responseObject) {
             DLOG(@"api success: %@", responseObject)
             success(responseObject);
         }
         failure:^(NSURLSessionDataTask *task, NSError *error) {
             failure(error);
         }];
}
@end
