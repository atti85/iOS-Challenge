//
//  ServerManager.h
//  iOSChallenge
//
//  Created by Attila Tamas on 14/06/14.
//  Copyright (c) 2014 Attila Tamas. All rights reserved.
//

#import "ServerManagerDelegate.h"

@class OAToken;

@interface ServerManager : NSObject

@property (nonatomic) OAToken *oaToken;
@property (nonatomic, weak) id<ServerManagerDelegate> delegate;

- (void)loadTweets;
- (void)loadUserDetailsForUser:(User *)user;

@end
