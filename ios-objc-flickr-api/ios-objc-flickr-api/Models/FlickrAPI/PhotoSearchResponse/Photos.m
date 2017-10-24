//
//  Photos.m
//  ios-objc-flickr-api
//
//  Created by OkuderaYuki on 2017/10/19.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

#import "Photos.h"

@implementation Photos

+ (NSDictionary <NSString *, NSString *> *)JSONKeyPathsByPropertyKey {
    return @{@"page" : @"page",
             @"pages" : @"pages",
             @"perpage" : @"perpage",
             @"photo" : @"photo"};
}

+ (NSValueTransformer *)photoJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:Photo.class];
}
@end
