//
//  Tweet.h
//  iOSChallenge
//
//  Created by Attila Tamas on 14/06/14.
//  Copyright (c) 2014 Attila Tamas. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tweet : NSObject

@property (nonatomic) NSString *ID;
@property (nonatomic) NSString *text;

+ (NSArray *)tweetsFromArray:(NSArray *)array;

@end
