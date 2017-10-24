//
//  PhotoSearchAPI.m
//  ios-objc-flickr-api
//
//  Created by OkuderaYuki on 2017/10/19.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

#import "PhotoSearchAPI.h"

#import "APIClient.h"
#import "NetworkConnection.h"
#import "PhotoSearchParamsBuilder.h"

@interface PhotoSearchAPI () <APIClientProtocol>
@property (nonatomic, getter=isLoading) BOOL loading;
@property (nonatomic) NSInteger requestCount;
@property (nonatomic) NSInteger totalCount;
@end

@implementation PhotoSearchAPI

#pragma mark - Initializer

- (instancetype)init {
    self = [super init];
    if (self) {
        self.requestCount = 1;
        self.totalCount = 1;
    }
    return self;
}

#pragma mark - Request count management

- (NSInteger)current {
    return self.requestCount;
}

- (void)reset {
    self.requestCount = 1;
}

- (void)increment {
    self.requestCount += 1;
}

- (void)updateTotal:(NSInteger)total {
    self.totalCount = total;
}

- (BOOL)isMoreRequest {
    return self.totalCount > self.requestCount * PhotoSearchPerPage;
}

#pragma mark - Requestability
- (BOOL)waiting {
    return self.isLoading;
}

#pragma mark - Execute request

- (void)loadWithTags:(NSString *)tags {
    
    if (![NetworkConnection isReachableWithHostName:[PhotoSearchAPI hostName]]) {
        // オフライン
        [self.loadable offlineThen];
        return;
    }
    
    self.loading = YES;
    
    NSDictionary *parameters = [PhotoSearchParamsBuilder buildWithTags:tags page:[self current]];
    
    __weak typeof(self) weakSelf = self;
    [APIClient getRequest:[PhotoSearchAPI baseUrlString]
               parameters:parameters
                  success:^(id result) {
                      
                      PhotoSearchResult *response = [MTLJSONAdapter modelOfClass:PhotoSearchResult.class
                                                              fromJSONDictionary:result
                                                                           error:nil];
                      if (response.photos.photo.count == 0) {
                          // レスポンス0件
                          [weakSelf.loadable emptyThen];
                          weakSelf.loading = NO;
                          return;
                      }
                      
                      // レスポンス1件以上
                      [weakSelf.loadable loadedThen:response];
                      weakSelf.loading = NO;
                  }
                  failure:^(NSError *error) {
                      // エラー
                      [weakSelf.loadable errorThen];
                      weakSelf.loading = NO;
                  }];
    
}

- (void)nextloadWithTags:(NSString *)tags {
    [self increment];
    [self loadWithTags:tags];
}

#pragma mark - APIClientProtocol

+ (NSString *)baseUrlString {
    return @"https://api.flickr.com/services/rest";
}

+ (NSString *)hostName {
    return @"api.flickr.com";
}

@end
