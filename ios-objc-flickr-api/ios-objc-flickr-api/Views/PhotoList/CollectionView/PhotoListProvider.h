//
//  PhotoListProvider.h
//  ios-objc-flickr-api
//
//  Created by OkuderaYuki on 2017/10/20.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

@import Foundation;
#import "Photo.h"

@interface PhotoListProvider : NSObject <UICollectionViewDataSource>
- (void)add:(NSArray <Photo *> *)photos;
- (void)append:(NSArray <Photo *> *)photos;
@end
