//
//  Tweet.m
//  iOSChallenge
//
//  Created by Attila Tamas on 14/06/14.
//  Copyright (c) 2014 Attila Tamas. All rights reserved.
//

#import "Tweet.h"

#define kDictKeyIDStr           @"id_str"
#define kDictKeyText            @"text"

@implementation Tweet

- (id)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    
    if (self) {
        _ID = [dictionary stringForKey:kDictKeyIDStr];
        _text = [dictionary stringForKey:kDictKeyText];
    }
    
    return self;
}

+ (NSArray *)tweetsFromArray:(NSArray *)array {
    NSMutableArray *tweets;
    if (array && [array isKindOfClass:[NSArray class]]) {
        tweets = [[NSMutableArray alloc] initWithCapacity:array.count];
        for (NSDictionary *dict in array) {
            Tweet *tweet = [[Tweet alloc] initWithDictionary:dict];
            [tweets addObject:tweet];
        }
    }
    
    return tweets;
}

@end
