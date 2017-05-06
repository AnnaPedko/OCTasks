//
//  ICCreature+ICGenerateRandomString.m
//  Creature1
//
//  Created by Anna P. on 25.04.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#import "NSString+ICGenerateRandomString.h"

@implementation NSString (ICGenerateRandomString)

static const NSUInteger ICDefaultStringLength = 30;

+ (id)lowercaseLetterAlphabet {
    return [self alphabetWithUnicodeRange:NSMakeRange('a',
                                                    'z' - 'a')];
}

+ (id)capitalizedLetterAplphabet {
    return [self alphabetWithUnicodeRange:NSMakeRange('A',
                                                      'Z' - 'A')];
}

+ (id)letterAlphabet {
    NSMutableString *randomString = [NSMutableString stringWithString:[self lowercaseLetterAlphabet]];
    [randomString appendString:[self capitalizedLetterAplphabet]];
    
    return [self stringWithString:randomString];
}

+ (id)numericalAlphabet {
        return [self alphabetWithUnicodeRange:NSMakeRange('1',
                                                          '9' - '0')];
}

+ (id)alphanumericalAlphabet {
    NSMutableString *randomString = [NSMutableString stringWithString:[self numericalAlphabet]];
    [randomString appendString:[self letterAlphabet]];
    
    return [self stringWithString:randomString];
}

+(id)alphabetWithUnicodeRange:(NSRange)range {
    NSMutableString *randomString = [NSMutableString string];
    for (unichar character = range.location; character < NSMaxRange(range); ++character) {
        [randomString appendFormat:@"%c",character];
    }
    
    return [self stringWithString:randomString];
}

+ (id)generateRandomStringWithLength:(NSUInteger)length alphabet:(NSString *)alphabet {
    NSMutableString *randomString = [NSMutableString stringWithCapacity:length];
    NSUInteger alphabetLength = [alphabet length];
    
    for (NSUInteger i = 0; i < length; ++i) {
        [randomString appendFormat:@"%C", [alphabet characterAtIndex:arc4random() % (u_int32_t)alphabetLength]];
    }
    
    return [self stringWithString:(randomString)];
}

+ (id)randomString {
    return [self generateRandomStringWithLength:arc4random_uniform(ICDefaultStringLength)];
}

+ (id)generateRandomStringWithLength:(NSUInteger)length {
    NSMutableString *randomString = [NSMutableString string];
    [randomString appendString: [self generateRandomStringWithLength: length alphabet: [self letterAlphabet]]];
    
    return [self stringWithString:randomString];
}

@end
