//
//  FlickrBaseParamsBuilderTests.m
//  ios-objc-flickr-apiTests
//
//  Created by OkuderaYuki on 2017/10/21.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

@import XCTest;
#import "FlickrBaseParamsBuilder.h"

@interface FlickrBaseParamsBuilderTests : XCTestCase

@end

@implementation FlickrBaseParamsBuilderTests

/**
 Flickr APIの基底パラメータを生成する処理のテスト
 */
- (void)testBuild {
    
    NSDictionary <NSString *, NSString *>*parameters = [FlickrBaseParamsBuilder build];
    XCTAssertEqualObjects(parameters[@"method"], @"flickr.photos.search");
    XCTAssertEqualObjects(parameters[@"api_key"], @"92f3fd8101d1d3a3613339d37c0452b9");
    XCTAssertEqualObjects(parameters[@"nojsoncallback"], @"1");
    XCTAssertEqualObjects(parameters[@"format"], @"json");
}

@end
