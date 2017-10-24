//
//  UICollectionViewCell+Identifier.m
//  ios-objc-flickr-api
//
//  Created by OkuderaYuki on 2017/10/21.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

#import "UICollectionViewCell+Identifier.h"

@implementation UICollectionViewCell (Identifier)
+ (NSString *)identifier {
    return NSStringFromClass([self class]);
}
@end
