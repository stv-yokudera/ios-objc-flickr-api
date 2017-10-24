//
//  DummyResponse.h
//  ios-objc-flickr-apiTests
//
//  Created by OkuderaYuki on 2017/10/21.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

@import Foundation;

@interface DummyResponse : NSObject

/**
 検索APIのダミーレスポンス
 
 @return ダミーレスポンス
 */
+ (NSDictionary <NSString *, id> *)photosSearchApiJSONDictionary;
@end
