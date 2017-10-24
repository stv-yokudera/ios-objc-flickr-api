//
//  PhotoImageURLBuilderTests.m
//  ios-objc-flickr-apiTests
//
//  Created by OkuderaYuki on 2017/10/21.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

@import XCTest;
#import "PhotoImageURLBuilder.h"

@interface PhotoImageURLBuilderTests : XCTestCase

@end

@implementation PhotoImageURLBuilderTests

/**
 Photoオブジェクトを指定して、画像のURLを生成する処理のテスト
 */
- (void)testBuildWithPhoto {
    
    Photo *photo = [[Photo alloc] init];
    photo.farm = 5;
    photo.server = @"4453";
    photo.id = @"37111227204";
    photo.secret = @"eef48af510";
    
    NSString *imageUrlString = [PhotoImageURLBuilder buildWithPhoto:photo];
    XCTAssertEqualObjects(imageUrlString,
                          @"https://farm5.staticflickr.com/4453/37111227204_eef48af510.jpg]");
}

@end
