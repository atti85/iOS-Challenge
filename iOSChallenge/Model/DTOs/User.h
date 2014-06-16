//
//  User.h
//  iOSChallenge
//
//  Created by Attila Tamas on 14/06/14.
//  Copyright (c) 2014 Attila Tamas. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic) NSString *ID;
@property (nonatomic) NSString *screenName;
@property (nonatomic) NSString *name;
@property (nonatomic) NSURL *profileImageUrl;

- (id)initWithDictionary:(NSDictionary *)dictionary;

@end
