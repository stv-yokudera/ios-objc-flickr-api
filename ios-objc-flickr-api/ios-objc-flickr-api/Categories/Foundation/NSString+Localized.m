//
//  NSString+Localized.m
//  ios-objc-flickr-api
//
//  Created by OkuderaYuki on 2017/10/17.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

#import "NSString+Localized.h"

@implementation NSString (Localized)
+ (instancetype)localizedWithKey:(NSString *)key {
    return NSLocalizedString(key, nil);
}
@end
