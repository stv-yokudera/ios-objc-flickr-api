//
//  PhotoSearchAPI.h
//  ios-objc-flickr-api
//
//  Created by OkuderaYuki on 2017/10/19.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

@import Foundation;
#import "PhotoSearchResult.h"

/**
 APIリクエスト結果を通知するプロトコル
 */
@protocol PhotoSearchLoadable <NSObject>
- (void)loadedThen:(PhotoSearchResult *)response;
- (void)emptyThen;
- (void)offlineThen;
- (void)errorThen;
@end

@interface PhotoSearchAPI : NSObject
@property (weak, nonatomic) id<PhotoSearchLoadable>loadable;

- (NSInteger)current;
- (void)reset;
- (void)increment;
- (void)updateTotal:(NSInteger)total;
- (BOOL)isMoreRequest;
- (BOOL)waiting;

- (void)loadWithTags:(NSString *)tags;
- (void)nextloadWithTags:(NSString *)tags;
@end
