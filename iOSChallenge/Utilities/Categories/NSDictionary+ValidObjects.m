//
//  NSDictionary+ValidObjects.m
//  iOSChallenge
//
//  Created by Attila Tamas on 14/06/14.
//  Copyright (c) 2014 Attila Tamas. All rights reserved.
//

#import "NSDictionary+ValidObjects.h"

@implementation NSDictionary (ValidObjects)

- (NSString *)stringForKey:(NSString *)key {
    NSString *result = nil;
    
    id object = [self objectForKey:key];
    if ([object isKindOfClass:[NSString class]] && ![object isEqual:[NSNull null]] && ((NSString *)object).length != 0) {
        result = (NSString *)object;
    }
    
    return result;
}

- (int)intForKey:(NSString *)key {
    int result = 0;
    
    id object = [self objectForKey:key];
    if ([object isKindOfClass:[NSNumber class]] && ![object isEqual:[NSNull null]]) {
        result = [object intValue];
    } else if ([self isValidNumber:object]) {
        result = [object intValue];
    }
    
    return result;
}

- (unsigned long int)unsignedLongIntForKey:(NSString *)key {
    unsigned long int result = 0;
    
    id object = [self objectForKey:key];
    if ([object isKindOfClass:[NSNumber class]] && ![object isEqual:[NSNull null]]) {
        result = [object unsignedLongValue];
    } else if ([self isValidNumber:object]) {
        result = (unsigned long int)[object integerValue];
    }
    
    return result;
}

- (BOOL)boolForKey:(NSString *)key {
    BOOL result = NO;
    
    id object = [self objectForKey:key];
    if ([object isKindOfClass:[NSNumber class]] && ![object isEqual:[NSNull null]]) {
        result = [object boolValue];
    }
    
    return result;
}

- (double)doubleForKey:(NSString *)key {
    double result = 0.0;
    
    id object = [self objectForKey:key];
    if ([object isKindOfClass:[NSNumber class]] && ![object isEqual:[NSNull null]]) {
        result = [object doubleValue];
    } else if ([self isValidNumber:object]) {
        result = [object doubleValue];
    }
    
    return result;
}

- (float)floatForKey:(NSString *)key {
    float result = 0.0;
    
    id object = [self objectForKey:key];
    if ([object isKindOfClass:[NSNumber class]] && ![object isEqual:[NSNull null]]) {
        result = [object floatValue];
    } else if ([self isValidNumber:object]) {
        result = [object floatValue];
    }
    
    return result;
}

- (NSNumber *)numberForKey:(id)key {
    NSNumber *result = nil;
    
    id object = [self objectForKey:key];
    if ([object isKindOfClass:[NSNumber class]] && ![object isEqual:[NSNull null]] ) {
        result = (NSNumber *)object;
    } else if ([self isValidNumber:object]) {
        result = [NSNumber numberWithDouble:[object doubleValue]];
    }
    
    return result;
}

- (NSDictionary *)dictionaryForKey:(NSString *)key {
    NSDictionary *result = nil;
    
    id object = [self objectForKey:key];
    if ([object isKindOfClass:[NSDictionary class]] && ![object isEqual:[NSNull null]]) {
        result = (NSDictionary *)object;
    }
    
    return result;
}

- (NSArray *)arrayForKey:(NSString *)key {
    NSArray *result = nil;
    
    id object = [self objectForKey:key];
    if ([object isKindOfClass:[NSArray class]] && ![object isEqual:[NSNull null]]) {
        result = (NSArray *)object;
    }
    
    return result;
}

- (NSMutableArray *)mutableArrayForKey:(NSString *)key {
    NSMutableArray *result = nil;
    
    id object = [self objectForKey:key];
    if ([object isKindOfClass:[NSMutableArray class]] && ![object isEqual:[NSNull null]]) {
        result = (NSMutableArray *)object;
    }
    
    return result;
}

- (NSDate *)dateForKey:(NSString *)key {
    NSDate *result = nil;
    
    id object = [self objectForKey:key];
    if ([object isKindOfClass:[NSDate class]] && ![object isEqual:[NSNull null]]) {
        result = (NSDate *)object;
    }
    
    return result;
}

- (id)objectForKey:(NSString *)key withClass:(Class)aClass {
    id result = nil;
    
    id object = [self objectForKey:key];
    if ([object isKindOfClass:aClass] && ![object isEqual:[NSNull null]]) {
        result = object;
    }
    
    return result;
}

- (BOOL)hasValidObjectForKey:(NSString *)key {
    BOOL result = NO;
    
    id object = [self objectForKey:key];
    if (![object isEqual:[NSNull null]]) {
        result = YES;
    }
    return result;
}

- (BOOL)isValidNumber:(id)object {
    BOOL isValidNumber = NO;
    
    if ([object isKindOfClass:[NSString class]]) {
        NSScanner *scanner = [NSScanner scannerWithString:(NSString *)object];
        double valDouble;
        isValidNumber = [scanner scanDouble:&valDouble] && [scanner isAtEnd];
        if (isValidNumber) return YES;
        
        NSInteger valInt;
        isValidNumber = [scanner scanInteger:&valInt] && [scanner isAtEnd];
    }
    
    return isValidNumber;
}


@end
