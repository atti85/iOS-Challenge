//
//  ServerManagerDelegate.h
//  iOSChallenge
//
//  Created by Attila Tamas on 14/06/14.
//  Copyright (c) 2014 Attila Tamas. All rights reserved.
//

#import <Foundation/Foundation.h>

@class User;

@protocol ServerManagerDelegate <NSObject>
@required
- (void)didFinishLoadingTweets:(NSArray *)tweets;
- (void)didFailLoadingTweets:(NSError *)error;
- (void)didFinishLoadingUserDetails:(User *)user;
- (void)didFailLoadingUserDetails:(NSError *)error;
@end
