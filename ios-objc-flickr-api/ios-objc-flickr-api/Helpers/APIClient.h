//
//  APIClient.h
//  ios-objc-flickr-api
//
//  Created by OkuderaYuki on 2017/10/17.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

@import Foundation;

typedef void (^APISuccess)(id responseObject);
typedef void (^APIFailure)(NSError *error);

@protocol APIClientProtocol
+ (NSString *)baseUrlString;
+ (NSString *)hostName;
@end

@interface APIClient : NSObject

/**
 GETリクエスト
 @param urlString リクエストURL
 @param parameters リクエストパラメータ
 @param success 成功時のハンドラー (void (^)(id responseObject))
 @param failure 失敗時のハンドラー (void (^)(NSError *error))
 */
+ (void)getRequest:(NSString *)urlString
        parameters:(id)parameters
           success:(APISuccess)success
           failure:(APIFailure)failure;
@end
