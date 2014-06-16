//
//  ServerClient.m
//  iOSChallenge
//
//  Created by Attila Tamas on 15/06/14.
//  Copyright (c) 2014 Attila Tamas. All rights reserved.
//

#import "ServerClient.h"
#import "OAuth1Controller.h"

#define kBaseUrl    @"https://api.twitter.com/1.1/"

@implementation ServerClient

#pragma mark - Public

- (NSURLRequest *)requestForTweetsLoad:(NSDictionary *)parameters {
    NSString *urlString = [kBaseUrl stringByAppendingString:@"statuses/home_timeline.json"];
    
    return [self requestWithUrl:urlString parameters:parameters];
}

- (NSURLRequest *)requestForUserDetails:(NSDictionary *)parameters;{
    NSString *urlString = [kBaseUrl stringByAppendingString:@"users/show.json"];
    
    return [self requestWithUrl:urlString parameters:parameters];
}

#pragma mark - Private

- (NSURLRequest *)requestWithUrl:(NSString *)url parameters:(NSDictionary *)parameters {
    OAConsumer *consumer = [[OAConsumer alloc] initWithKey:CONSUMER_KEY secret:CONSUMER_SECRET];
    
    OAMutableURLRequest *request = [[OAMutableURLRequest alloc] initWithURL:[NSURL URLWithString:url] consumer:consumer token:self.oaToken realm:nil signatureProvider:nil timeoutInterval:30.0];
    [request setHTTPMethod:@"GET"];
    
    NSMutableArray *params = [[NSMutableArray alloc] init];
    for (NSString *key in [parameters allKeys]) {
        NSString *value = [parameters stringForKey:key];
        if (!value) {
            value = [NSString stringWithFormat:@"%@", [parameters objectForKey:key]];
        }
        OARequestParameter *param = [[OARequestParameter alloc] initWithName:key value:value];
        [params addObject:param];
    }
    [request setParameters:params];
    [request prepare];
    
    return request;
}

@end
