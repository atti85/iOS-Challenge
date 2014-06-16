//
//  NSString+Size.h
//  iOSChallenge
//
//  Created by Attila Tamas on 15/06/14.
//  Copyright (c) 2014 Attila Tamas. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Size)

- (CGSize)sizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size;

@end
