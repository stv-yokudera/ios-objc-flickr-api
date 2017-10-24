//
//  PhotoCell.m
//  ios-objc-flickr-api
//
//  Created by OkuderaYuki on 2017/10/20.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

#import "PhotoCell.h"

@implementation PhotoCell
+ (CGSize)cellSize {
    
    CGFloat margin = 10;
    CGSize screenSize = UIScreen.mainScreen.bounds.size;
    CGFloat screenPerWidth = 3;
    CGFloat screenPerHeight = 5;
    
    CGFloat cellWidth = (screenSize.width - margin) / screenPerWidth;
    CGFloat cellHeight = (screenSize.height - margin) / screenPerHeight;
    
    return CGSizeMake(cellWidth, cellHeight);
}
@end
