//
//  NSObject+BlockAdditions.m
//  iOSChallenge
//
//  Created by Attila Tamas on 14/06/14.
//  Copyright (c) 2014 Attila Tamas. All rights reserved.
//

#import "NSObject+BlockAdditions.h"

@implementation NSObject (BlockAdditions)

- (void)performBlockOnMainThread:(void (^)(void))block {
    dispatch_async(dispatch_get_main_queue(), block);
}

- (void)performBlockOnMainThread:(void (^)(void))block afterDelay:(NSTimeInterval)delay {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, delay * NSEC_PER_SEC), dispatch_get_main_queue(), block);
}

- (void)performAsyncBlock:(void (^)(void))block {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block);
}

@end
