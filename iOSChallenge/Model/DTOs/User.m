//
//  User.m
//  iOSChallenge
//
//  Created by Attila Tamas on 14/06/14.
//  Copyright (c) 2014 Attila Tamas. All rights reserved.
//

#import "User.h"

#define kDictKeyIDStr           @"id_str"
#define kDictKeyScreenName      @"screen_name"
#define kDictKeyName            @"name"
#define kKeyDescription         @"description"
#define kDictKeyProfileImageUrl @"profile_image_url_https"

#define kStringNormal           @"normal"
#define kStringBigger           @"bigger"

@implementation User

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    
    if (self) {
        _ID = [dictionary stringForKey:kDictKeyIDStr];
        _screenName = [dictionary stringForKey:kDictKeyScreenName];
        _name = [dictionary stringForKey:kDictKeyName];
        _profileImageUrl = [NSURL URLWithString:[[dictionary stringForKey:kDictKeyProfileImageUrl] stringByReplacingOccurrencesOfString:kStringNormal withString:kStringBigger]];
    }
    return self;
}
@end
