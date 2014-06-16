//
//  ServerClient.h
//  iOSChallenge
//
//  Created by Attila Tamas on 15/06/14.
//  Copyright (c) 2014 Attila Tamas. All rights reserved.
//

#import <Foundation/Foundation.h>

@class OAToken;

@interface ServerClient : NSObject

@property (nonatomic) OAToken *oaToken;

- (NSURLRequest *)requestForTweetsLoad:(NSDictionary *)parameters;
- (NSURLRequest *)requestForUserDetails:(NSDictionary *)parameters;

@end
