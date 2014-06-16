//
//  DataManager.h
//  iOSChallenge
//
//  Created by Attila Tamas on 14/06/14.
//  Copyright (c) 2014 Attila Tamas. All rights reserved.
//

@class User;

@interface DataManager : NSObject

@property (nonatomic, readonly) User *user;
@property (nonatomic, readonly) NSArray *tweets;

+ (id)sharedInstance;

#pragma mark - Login
- (void)connectToTwitterAccount;
- (BOOL)handleOpenURL:(NSURL *)url;

@end
