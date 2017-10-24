//
//  PhotoSearchParamsBuilder.m
//  ios-objc-flickr-api
//
//  Created by OkuderaYuki on 2017/10/19.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

#import "PhotoSearchParamsBuilder.h"
#import "FlickrBaseParamsBuilder.h"

@implementation PhotoSearchParamsBuilder

const NSInteger PhotoSearchPerPage = 50;
+ (NSDictionary <NSString *, NSString *>*)buildWithTags:(NSString *)tags
                                                   page:(NSInteger)page {
    NSMutableDictionary <NSString *, NSString *>*params = [[FlickrBaseParamsBuilder build] mutableCopy];
    params[@"page"] = [NSString stringWithFormat:@"%ld", (long)page];
    params[@"per_page"] = [NSString stringWithFormat:@"%ld", (long)PhotoSearchPerPage];
    params[@"tags"] = tags;
    return params;
}
@end
