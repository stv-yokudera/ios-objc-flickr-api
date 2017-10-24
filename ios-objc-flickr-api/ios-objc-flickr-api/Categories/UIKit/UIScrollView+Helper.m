//
//  UIScrollView+Helper.m
//  ios-objc-flickr-api
//
//  Created by OkuderaYuki on 2017/10/21.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

#import "UIScrollView+Helper.h"

@implementation UIScrollView (Helper)
- (BOOL)isScrollEnd {
    return self.contentOffset.y >= (self.contentSize.height - self.bounds.size.height);
}

- (void)scrollToTop {
    [self setContentOffset:CGPointZero animated:YES];
}
@end
