//
//  PhotoSearchAPITests.m
//  ios-objc-flickr-apiTests
//
//  Created by OkuderaYuki on 2017/10/21.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

@import XCTest;
#import "PhotoSearchAPI.h"

@interface PhotoSearchAPITests : XCTestCase <PhotoSearchLoadable>
@property (nonatomic) PhotoSearchAPI *photoSearchAPI;
@property (nonatomic) XCTestExpectation *asyncExpectation;
@end

@implementation PhotoSearchAPITests

- (void)setUp {
    [super setUp];
    self.photoSearchAPI = [[PhotoSearchAPI alloc] init];
    self.photoSearchAPI.loadable = self;
}

/**
 検索タグに「Dog」を設定して、検索した時のテスト
 */
- (void)testLoadWithTagsCats {
    
    self.asyncExpectation = [self expectationWithDescription:@"データが1件以上返却されること"];
    [self.photoSearchAPI loadWithTags:@"Dog"];
    
    [self waitForExpectationsWithTimeout:2.0 handler:^(NSError *error) {
        XCTAssertNil(error);
    }];
}

#pragma mark - PhotoSearchLoadable

- (void)loadedThen:(PhotoSearchResult *)response {
    XCTAssertNotNil(response);
    [self.asyncExpectation fulfill];
}

- (void)emptyThen {
    XCTFail(@"検索結果0件");
}

- (void)offlineThen {
    XCTFail(@"通信環境がオフライン");
}

- (void)errorThen {
    XCTFail(@"エラー");
}

@end
