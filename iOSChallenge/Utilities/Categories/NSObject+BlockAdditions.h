//
//  NSObject+BlockAdditions.h
//  iOSChallenge
//
//  Created by Attila Tamas on 14/06/14.
//  Copyright (c) 2014 Attila Tamas. All rights reserved.
//

@interface NSObject (BlockAdditions)

- (void)performBlockOnMainThread:(void (^)(void))block;
- (void)performBlockOnMainThread:(void (^)(void))block afterDelay:(NSTimeInterval)delay;
- (void)performAsyncBlock:(void (^)(void))block;

@end
