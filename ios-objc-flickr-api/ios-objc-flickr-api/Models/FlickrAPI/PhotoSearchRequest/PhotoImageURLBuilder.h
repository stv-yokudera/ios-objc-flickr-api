//
//  PhotoImageURLBuilder.h
//  ios-objc-flickr-api
//
//  Created by OkuderaYuki on 2017/10/19.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

@import Foundation;
#import "Photo.h"

@interface PhotoImageURLBuilder : NSObject
+ (NSString *)buildWithPhoto:(Photo *)photo;
@end
