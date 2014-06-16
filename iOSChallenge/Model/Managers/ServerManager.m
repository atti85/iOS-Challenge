//
//  ServerManager.m
//  iOSChallenge
//
//  Created by Attila Tamas on 14/06/14.
//  Copyright (c) 2014 Attila Tamas. All rights reserved.
//

#import "ServerManager.h"
#import "AFNetworking.h"
#import "ServerClient.h"

#import "Tweet.h"
#import "User.h"

@interface ServerManager ()

@property (nonatomic) AFHTTPRequestOperationManager *requestManager;
@property (nonatomic) ServerClient *serverClient;

@end

@implementation ServerManager

- (id)init {
    self = [super init];
    if (self) {
        _requestManager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:@"https://api.twitter.com/1.1/"]];
        _serverClient = [[ServerClient alloc] init];
    }
    
    return self;
}

- (void)loadTweets {
    AFHTTPRequestOperation *task = [self.requestManager HTTPRequestOperationWithRequest:[self.serverClient requestForTweetsLoad:@{@"count" : @(50)}]
                                                    success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                                        [self.delegate didFinishLoadingTweets:[Tweet tweetsFromArray:responseObject]];
                                                    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                                        [self.delegate didFailLoadingTweets:error];
                                                    }];
    [self.requestManager.operationQueue addOperation:task];
}

- (void)loadUserDetailsForUser:(User *)user {
    NSDictionary *parameters = user.ID ? @{@"user_id": user.ID} : @{@"screen_name": user.screenName};
    AFHTTPRequestOperation *task = [self.requestManager HTTPRequestOperationWithRequest:[self.serverClient requestForUserDetails:parameters]
                                                                                success:^(AFHTTPRequestOperation *operation, NSDictionary *responseObject) {
                                                                                    User *newUser;
                                                                                    if ([responseObject isKindOfClass:[NSDictionary class]]) {
                                                                                        newUser = [[User alloc] initWithDictionary:responseObject];
                                                                                    }
                                                                                    [self.delegate didFinishLoadingUserDetails:newUser];
                                                                                } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                                                                    [self.delegate didFailLoadingUserDetails:error];
                                                                                }];
    [self.requestManager.operationQueue addOperation:task];
}

#pragma mark - Setter

- (void)setOaToken:(OAToken *)oaToken {
    _oaToken = oaToken;
    
    self.serverClient.oaToken = oaToken;
}

@end
