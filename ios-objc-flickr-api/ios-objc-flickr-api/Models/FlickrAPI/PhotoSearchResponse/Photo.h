//
//  Photo.h
//  ios-objc-flickr-api
//
//  Created by OkuderaYuki on 2017/10/19.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

@import Foundation;
@import Mantle;

@interface Photo : MTLModel<MTLJSONSerializing>
@property (nonatomic) NSInteger farm;
@property (nonatomic) NSString *server;
@property (nonatomic) NSString *id;
@property (nonatomic) NSString *secret;
@end
