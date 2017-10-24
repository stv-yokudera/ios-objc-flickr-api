//
//  PhotoSearchResult.m
//  ios-objc-flickr-api
//
//  Created by OkuderaYuki on 2017/10/19.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

#import "PhotoSearchResult.h"

@implementation PhotoSearchResult
+ (NSDictionary <NSString *, NSString *> *)JSONKeyPathsByPropertyKey {
    return @{@"stat" : @"stat",
             @"photos" : @"photos"};
}
@end
