//
//  PhotoImageURLBuilder.m
//  ios-objc-flickr-api
//
//  Created by OkuderaYuki on 2017/10/19.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

#import "PhotoImageURLBuilder.h"

@implementation PhotoImageURLBuilder
+ (NSString *)buildWithPhoto:(Photo *)photo {
    return [NSString stringWithFormat:@"https://farm%ld.staticflickr.com/%@/%@_%@.jpg]",
            (long)photo.farm,
            photo.server,
            photo.id,
            photo.secret];
}
@end
