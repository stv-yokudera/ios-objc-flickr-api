//
//  PhotoSearchParamsBuilder.h
//  ios-objc-flickr-api
//
//  Created by OkuderaYuki on 2017/10/19.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

@import Foundation;

@interface PhotoSearchParamsBuilder : NSObject

extern const NSInteger PhotoSearchPerPage;
+ (NSDictionary <NSString *, NSString *>*)buildWithTags:(NSString *)tags
                                                   page:(NSInteger)page;
@end
