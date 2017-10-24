//
//  PhotoSearchResultTests.m
//  ios-objc-flickr-apiTests
//
//  Created by OkuderaYuki on 2017/10/21.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

@import XCTest;
#import "DummyResponse.h"
#import "PhotoSearchResult.h"

@interface PhotoSearchResultTests : XCTestCase

@end

@implementation PhotoSearchResultTests

/**
 レスポンスデータをPhotoSearchResultにマッピングするテスト
 */
- (void)testMapping {
    NSDictionary <NSString *, id> *dummyResponse = [DummyResponse photosSearchApiJSONDictionary];
    PhotoSearchResult *response = [MTLJSONAdapter modelOfClass:PhotoSearchResult.class
                                            fromJSONDictionary:dummyResponse
                                                         error:nil];
    
    NSString *stat = response.stat;
    XCTAssertEqualObjects(stat, @"ok");
    Photos *photos = response.photos;
    
    NSInteger page = photos.page;
    XCTAssertEqual(page, 1);
    NSInteger pages = photos.pages;
    XCTAssertEqual(pages, 3409);
    NSInteger perpage = photos.perpage;
    XCTAssertEqual(perpage, 50);
    NSArray <Photo *> *photo = photos.photo;
    
    NSInteger farm = photo.firstObject.farm;
    XCTAssertEqual(farm, 5);
    NSString *server = photo.firstObject.server;
    XCTAssertEqualObjects(server, @"4453");
    NSString *photoId = photo.firstObject.id;
    XCTAssertEqualObjects(photoId, @"37111227204");
    NSString *secret = photo.firstObject.secret;
    XCTAssertEqualObjects(secret, @"eef48af510");
}

@end
