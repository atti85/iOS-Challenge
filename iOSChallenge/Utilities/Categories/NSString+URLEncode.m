//
//  NSString+URLEncoding.m
//  IdeaFlasher Authentication
//
//  Created by Christian Hansen on 24/11/12.
//  Copyright (c) 2012 Kwamecorp. All rights reserved.
//

#import "NSString+URLEncode.h"

@implementation NSString (URLEncode)


- (NSString *)utf8AndURLEncode
{
    return (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(NULL,
                                                                                 (CFStringRef)self,
                                                                                 NULL,
                                                                                 (CFStringRef)@"!*'\"();:@&=+$,/?%#[]% ",
                                                                                 CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding)));
}

- (NSString *)utf8AndURLDecode {
    NSMutableString *string = [NSMutableString stringWithString:self];
    
    // Reserved Characters in HTML
    [string replaceOccurrencesOfString:@"&quot;" withString:@"\"" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&apos;" withString:@"'" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&amp;" withString:@"&" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&lt;" withString:@"<" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&gt;" withString:@">" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    
    // ISO 8859-1 Symbols
    [string replaceOccurrencesOfString:@"&iexcl;" withString:@"¡" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&cent;" withString:@"¢" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&pound;" withString:@"£" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&curren;" withString:@"¤" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&yen;" withString:@"¥" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&brvbar;" withString:@"¦" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&sect;" withString:@"§" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&uml;" withString:@"¨" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&copy;" withString:@"©" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&ordf;" withString:@"ª" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&laquo;" withString:@"«" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&not;" withString:@"¬" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&shy;" withString:@"    " options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&reg;" withString:@"®" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&macr;" withString:@"¯" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&deg;" withString:@"°" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&plusmn;" withString:@"±" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&sup2;" withString:@"²" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&sup3;" withString:@"³" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&acute;" withString:@"´" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&micro;" withString:@"µ" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&para;" withString:@"¶" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&middot;" withString:@"·" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&cedil;" withString:@"¸" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&sup1;" withString:@"¹" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&ordm;" withString:@"º" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&raquo;" withString:@"»" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&frac14;" withString:@"¼" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&frac12;" withString:@"½" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&frac34;" withString:@"¾" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&iquest;" withString:@"¿" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&times;" withString:@"×" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&divide;" withString:@"÷" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    
    // ISO 8859-1 Characters
    [string replaceOccurrencesOfString:@"&Agrave;" withString:@"À" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&Aacute;" withString:@"Á" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&Acirc;" withString:@"Â" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&Atilde;" withString:@"Ã" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&Auml;" withString:@"Ä" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&Aring;" withString:@"Å" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&AElig;" withString:@"Æ" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&Ccedil;" withString:@"Ç" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&Egrave;" withString:@"È" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&Eacute;" withString:@"É" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&Ecirc;" withString:@"Ê" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&Euml;" withString:@"Ë" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&Igrave;" withString:@"Ì" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&Iacute;" withString:@"Í" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&Icirc;" withString:@"Î" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&Iuml;" withString:@"Ï" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&ETH;" withString:@"Ð" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&Ntilde;" withString:@"Ñ" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&Ograve;" withString:@"Ò" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&Oacute;" withString:@"Ó" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&Ocirc;" withString:@"Ô" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&Otilde;" withString:@"Õ" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&Ouml;" withString:@"Ö" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&Oslash;" withString:@"Ø" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&Ugrave;" withString:@"Ù" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&Uacute;" withString:@"Ú" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&Ucirc;" withString:@"Û" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&Uuml;" withString:@"Ü" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&Yacute;" withString:@"Ý" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&THORN;" withString:@"Þ" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&szlig;" withString:@"ß" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&agrave;" withString:@"à" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&aacute;" withString:@"á" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&acirc;" withString:@"â" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&atilde;" withString:@"ã" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&auml;" withString:@"ä" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&aring;" withString:@"å" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&aelig;" withString:@"æ" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&ccedil;" withString:@"ç" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&egrave;" withString:@"è" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&eacute;" withString:@"é" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&ecirc;" withString:@"ê" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&euml;" withString:@"ë" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&igrave;" withString:@"ì" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&iacute;" withString:@"í" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&icirc;" withString:@"î" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&iuml;" withString:@"ï" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&eth;" withString:@"ð" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&ntilde;" withString:@"ñ" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&ograve;" withString:@"ò" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&oacute;" withString:@"ó" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&ocirc;" withString:@"ô" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&otilde;" withString:@"õ" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&ouml;" withString:@"ö" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&oslash;" withString:@"ø" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&ugrave;" withString:@"ù" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&uacute;" withString:@"ú" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&ucirc;" withString:@"û" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&uuml;" withString:@"ü" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&yacute;" withString:@"ý" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&thorn;" withString:@"þ" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    [string replaceOccurrencesOfString:@"&yuml;" withString:@"ÿ" options:NSLiteralSearch range:NSMakeRange(0, string.length)];
    
    return string;
}


+ (NSString *)getUUID
{
    CFUUIDRef uuid = CFUUIDCreate(NULL);
    NSString *uuidStr = (__bridge_transfer NSString *)CFUUIDCreateString(NULL, uuid);
    CFRelease(uuid);
    return uuidStr;
}


+ (NSString *)getNonce
{
    // uuid is simplified a bit, also the full uuid can be used as nonce
    NSString *uuid = [self getUUID];
    return [[uuid substringToIndex:10] stringByReplacingOccurrencesOfString:@"-" withString:@""].lowercaseString;
}

@end
