//
//  PhotoListProvider.m
//  ios-objc-flickr-api
//
//  Created by OkuderaYuki on 2017/10/20.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

@import SDWebImage.UIImageView_WebCache;
#import "PhotoListProvider.h"
#import "PhotoCell.h"
#import "PhotoImageURLBuilder.h"

@interface PhotoListProvider ()
@property (nonatomic) NSMutableArray <Photo *> *photos;
@end

@implementation PhotoListProvider

#pragma mark - Initializer

- (void)add:(NSArray <Photo *> *)photos {
    self.photos = [photos mutableCopy];
}

- (void)append:(NSArray <Photo *> *)photos {
    [self.photos addObjectsFromArray:photos];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
    return self.photos.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    PhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[PhotoCell identifier]
                                                                forIndexPath:indexPath];
    NSString *imageUrlString = [PhotoImageURLBuilder buildWithPhoto:self.photos[indexPath.row]];
    NSURL *imageUrl = [NSURL URLWithString:imageUrlString];
    [cell.imageView sd_setImageWithURL:imageUrl];
    return cell;
}

@end
