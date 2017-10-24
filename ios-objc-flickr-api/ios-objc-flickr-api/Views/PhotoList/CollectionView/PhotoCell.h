//
//  PhotoCell.h
//  ios-objc-flickr-api
//
//  Created by OkuderaYuki on 2017/10/20.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

@import UIKit;

@interface PhotoCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
+ (CGSize)cellSize;
@end
