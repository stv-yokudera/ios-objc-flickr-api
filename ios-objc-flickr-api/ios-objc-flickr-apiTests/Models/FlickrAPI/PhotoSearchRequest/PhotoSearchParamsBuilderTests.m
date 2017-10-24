//
//  PhotoSearchParamsBuilderTests.m
//  ios-objc-flickr-apiTests
//
//  Created by OkuderaYuki on 2017/10/21.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

@import XCTest;
#import "PhotoSearchParamsBuilder.h"

@interface PhotoSearchParamsBuilderTests : XCTestCase

@end

@implementation PhotoSearchParamsBuilderTests

/**
 ページ・検索タグを指定して、写真検索APIのパラメータを生成する処理のテスト
 */
- (void)testBuildWithTags {
    NSInteger page = 1;
    NSString *tags = @"cat";
    
    NSDictionary <NSString *, id>*parameters = [PhotoSearchParamsBuilder buildWithTags:tags page:page];
    
    XCTAssertEqual([parameters[@"page"] integerValue], 1);
    XCTAssertEqual([parameters[@"per_page"] integerValue], 50);
    XCTAssertEqualObjects(parameters[@"tags"], @"cat");
}

@end
