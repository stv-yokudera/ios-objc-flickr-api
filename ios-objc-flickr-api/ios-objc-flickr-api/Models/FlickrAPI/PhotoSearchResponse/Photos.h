//
//  Photos.h
//  ios-objc-flickr-api
//
//  Created by OkuderaYuki on 2017/10/19.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

@import Foundation;
@import Mantle;
#import "Photo.h"

@interface Photos : MTLModel<MTLJSONSerializing>
@property (nonatomic) NSInteger page;
@property (nonatomic) NSInteger pages;
@property (nonatomic) NSInteger perpage;
@property (nonatomic) NSArray <Photo *> *photo;
@end
