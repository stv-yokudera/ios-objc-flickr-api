//
//  UIViewController+Alert.m
//  ios-objc-flickr-api
//
//  Created by OkuderaYuki on 2017/10/17.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

#import "UIViewController+Alert.h"

@implementation UIViewController (Alert)
- (void)showOkAlert:(NSString *)title
            message:(NSString *)message
  completionHandler:(void (^)(UIAlertAction *action))completionHandler {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:[NSString localizedWithKey:@"ALERT_OK"]
                                                       style:UIAlertActionStyleDefault
                                                     handler:completionHandler];
    [alert addAction:okAction];
    [self presentViewController:alert animated:YES completion:nil];
}
@end
