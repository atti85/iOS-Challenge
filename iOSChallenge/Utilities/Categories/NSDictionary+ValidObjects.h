//
//  NSDictionary+ValidObjects.h
//  iOSChallenge
//
//  Created by Attila Tamas on 14/06/14.
//  Copyright (c) 2014 Attila Tamas. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (ValidObjects)

- (NSString *)stringForKey:(NSString *)key;
- (int)intForKey:(NSString *)key;
- (unsigned long int)unsignedLongIntForKey:(NSString *)key;
- (BOOL)boolForKey:(NSString *)key;
- (double)doubleForKey:(NSString *)key;
- (float)floatForKey:(NSString *)key;
- (NSNumber *)numberForKey:(id)key;
- (NSDictionary *)dictionaryForKey:(NSString *)key;
- (NSArray *)arrayForKey:(NSString *)key;
- (NSMutableArray *)mutableArrayForKey:(NSString *)key;
- (NSDate *)dateForKey:(NSString *)key;
- (id)objectForKey:(NSString *)key withClass:(Class)aClass;


- (BOOL)hasValidObjectForKey:(NSString *)key;

@end
