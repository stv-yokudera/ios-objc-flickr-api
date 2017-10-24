//
//  FlickrBaseParamsBuilder.m
//  ios-objc-flickr-api
//
//  Created by OkuderaYuki on 2017/10/17.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

#import "FlickrBaseParamsBuilder.h"

@implementation FlickrBaseParamsBuilder
+ (NSDictionary <NSString *, NSString *>*)build {
    return @{@"method" : @"flickr.photos.search",
             @"api_key" : @"92f3fd8101d1d3a3613339d37c0452b9",
             @"nojsoncallback" : @"1",
             @"format": @"json"};
}
@end
