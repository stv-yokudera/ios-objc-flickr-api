//
//  DummyResponse.m
//  ios-objc-flickr-apiTests
//
//  Created by OkuderaYuki on 2017/10/21.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

#import "DummyResponse.h"

@implementation DummyResponse

+ (NSDictionary <NSString *, id> *)photosSearchApiJSONDictionary {
    NSBundle *testBundle = [NSBundle bundleForClass:self];
    NSString *jsonPath = [testBundle pathForResource:@"photos_search" ofType:@"json"];
    NSFileHandle *fileHandle = [NSFileHandle fileHandleForReadingAtPath:jsonPath];
    NSData *jsonData = [fileHandle readDataToEndOfFile];
    
    return [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:nil];
}
@end
