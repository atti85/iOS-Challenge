//
//  NSString+URLEncoding.h
//  IdeaFlasher Authentication
//
//  Created by Christian Hansen on 24/11/12.
//  Copyright (c) 2012 Kwamecorp. All rights reserved.
//

@interface NSString (URLEncode)

- (NSString *)utf8AndURLEncode;
- (NSString *)utf8AndURLDecode;
+ (NSString *)getNonce;

@end
