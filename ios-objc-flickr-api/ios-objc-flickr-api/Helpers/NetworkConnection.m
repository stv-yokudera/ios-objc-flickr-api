//
//  NetworkConnection.m
//  ios-objc-flickr-api
//
//  Created by OkuderaYuki on 2017/10/17.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

#import "NetworkConnection.h"
#import "Reachability.h"

@implementation NetworkConnection
+ (BOOL)isReachableWithHostName:(NSString *)hostName {
    Reachability *reachability = [Reachability reachabilityWithHostName:hostName];
    return [reachability isReachable];
}
@end
