//
//  OAuth1Controller.h
//  Simple-OAuth1
//
//  Created by Christian Hansen on 02/12/12.
//  Copyright (c) 2012 Christian-Hansen. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "OAuthConsumer.h"

@interface OAuth1Controller : NSObject <UIWebViewDelegate>

@property (nonatomic) OAToken *accessToken;

- (void)loginWithCompletionhandler:(void (^)(NSDictionary *result, NSError *error))block;
- (void)handleLoginCallback:(NSString *)callback;

+ (NSURLRequest *)preparedRequestForPath:(NSString *)path
                              parameters:(NSDictionary *)parameters
                              HTTPmethod:(NSString *)method
                              oauthToken:(NSString *)oauth_token
                             oauthSecret:(NSString *)oauth_token_secret;

@end
