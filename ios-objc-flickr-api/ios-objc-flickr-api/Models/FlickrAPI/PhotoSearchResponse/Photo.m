//
//  Photo.m
//  ios-objc-flickr-api
//
//  Created by OkuderaYuki on 2017/10/19.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

#import "Photo.h"

@implementation Photo

+ (NSDictionary <NSString *, NSString *> *)JSONKeyPathsByPropertyKey {
    return @{@"farm" : @"farm",
             @"server" : @"server",
             @"id" : @"id",
             @"secret" : @"secret"};
}

@end
