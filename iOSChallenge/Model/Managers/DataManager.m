//
//  DataManager.m
//  iOSChallenge
//
//  Created by Attila Tamas on 14/06/14.
//  Copyright (c) 2014 Attila Tamas. All rights reserved.
//

#import "DataManager.h"
#import "OAuth1Controller.h"
#import "ServerManager.h"
#import "User.h"

#define kOATokenUserDefProvider         @"twitter"
#define kOATokenUserDefPrefix           @"prefix"

@interface DataManager () < ServerManagerDelegate>

@property (nonatomic) OAuth1Controller *oauthManager;
@property (nonatomic) ServerManager *serverManager;
@property (nonatomic) OAToken *oaToken;

@end

@implementation DataManager

+ (id)sharedInstance {
    SHARED_INSTANCE_USING_BLOCK(^{
        return [[self alloc] init];
    });
}


- (id)init {
    self = [super init];
    if (self) {
        _oauthManager = [[OAuth1Controller alloc] init];
        
        _serverManager = [[ServerManager alloc] init];
        _serverManager.delegate = self;
        
        _oaToken = [[OAToken alloc] initWithUserDefaultsUsingServiceProviderName:kOATokenUserDefProvider prefix:kOATokenUserDefPrefix];
        
    }
    
    return self;
}

#pragma mark - Login

- (void)connectToTwitterAccount {
    _oauthManager = [[OAuth1Controller alloc] init];
    [_oauthManager loginWithCompletionhandler:^(NSDictionary *resultDict, NSError *error) {
        if (resultDict && !error) {
            self.oaToken = self.oauthManager.accessToken;
            self.serverManager.oaToken = self.oaToken;
            [self.oaToken storeInUserDefaultsWithServiceProviderName:kOATokenUserDefProvider prefix:kOATokenUserDefPrefix];
            
            NSString *screenName = [resultDict stringForKey:@"screen_name"];
            NSString *userID = [resultDict stringForKey:@"user_id"];
            
            // create logged in user object
            _user = [[User alloc] init];
            _user.ID = userID;
            _user.screenName = screenName;
            [self loadAutenticatedUserDetails];
           
            [NotificationCenter postNotificationName:kNotificationDidFinishLogin object:nil];
            
            [self loadTweets];
        } else {
            [NotificationCenter postNotificationName:kNotificationDidFailLogin object:nil];
        }

    }];
}

- (BOOL)handleOpenURL:(NSURL *)url {
    NSString *URLString = [url absoluteString];
    [self.oauthManager handleLoginCallback:URLString];
    
    return YES;
}

#pragma mark - Load

- (void)loadTweets {
    [self.serverManager loadTweets];
}

- (void)didFinishLoadingTweets:(NSArray *)tweets {
    _tweets = tweets;
    
    [NotificationCenter postNotificationName:kNotificationDidFinishLoadingTweets object:nil];
}

- (void)didFailLoadingTweets:(NSError *)error {
    [NotificationCenter postNotificationName:kNotificationDidFailLoadingTweets object:error];
}

- (void)loadAutenticatedUserDetails {
    [self.serverManager loadUserDetailsForUser:self.user];
}

- (void)didFinishLoadingUserDetails:(User *)user {
    _user = user;
    
    [NotificationCenter postNotificationName:kNotificationDidFinishLoadingUserDetails object:nil];
}

- (void)didFailLoadingUserDetails:(NSError *)error {
    [NotificationCenter postNotificationName:kNotificationDidFailLoadingUserDetails object:error];
}

@end
