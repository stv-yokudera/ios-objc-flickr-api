//
//  PhotoSearchResult.h
//  ios-objc-flickr-api
//
//  Created by OkuderaYuki on 2017/10/19.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

@import Foundation;
@import Mantle;
#import "Photos.h"

@interface PhotoSearchResult : MTLModel<MTLJSONSerializing>
@property (nonatomic) NSString *stat;
@property (nonatomic) Photos *photos;
@end
