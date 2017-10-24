//
//  UIViewController+Alert.h
//  ios-objc-flickr-api
//
//  Created by OkuderaYuki on 2017/10/17.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

@import UIKit;

@interface UIViewController (Alert)
- (void)showOkAlert:(NSString *)title
            message:(NSString *)message
  completionHandler:(void (^)(UIAlertAction *action))completionHandler;
    @end
