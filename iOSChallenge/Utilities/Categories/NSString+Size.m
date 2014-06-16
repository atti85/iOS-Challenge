//
//  NSString+Size.m
//  iOSChallenge
//
//  Created by Attila Tamas on 15/06/14.
//  Copyright (c) 2014 Attila Tamas. All rights reserved.
//

#import "NSString+Size.h"

@implementation NSString (Size)
- (CGSize)sizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size {
    CGSize textSize = [self boundingRectWithSize:size options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: font} context:nil].size;
    
    return CGSizeMake(ceilf(textSize.width), ceilf(textSize.height));
}

@end
