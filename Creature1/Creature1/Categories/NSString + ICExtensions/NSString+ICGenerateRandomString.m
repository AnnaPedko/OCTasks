//
//  ICCreature+ICGenerateRandomString.m
//  Creature1
//
//  Created by Anna P. on 25.04.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#import "NSString+ICGenerateRandomString.h"

static NSRange ICRangeWithCharacter(unichar leftBoundary, unichar rightBoundary) {
    unichar min = MIN(leftBoundary, rightBoundary);
    unichar max = MAX(leftBoundary, rightBoundary);
    
    return NSMakeRange(min, max - min + 1);
}

@implementation NSString (ICGenerateRandomString)

static const NSUInteger ICDefaultStringLength = 30;

+ (instancetype)lowercaseLetterAlphabet {
    return [self alphabetWithUnicodeRange:ICRangeWithCharacter('a', 'z')];
}

+ (instancetype)capitalizedLetterAplphabet {
    return [self alphabetWithUnicodeRange:ICRangeWithCharacter('A', 'Z')];
}

+ (instancetype)letterAlphabet {
    NSMutableString *randomString = [NSMutableString stringWithString:[self lowercaseLetterAlphabet]];
    [randomString appendString:[self capitalizedLetterAplphabet]];
    
    return [self stringWithString:randomString];
}

+ (instancetype)numericalAlphabet {
    return [self alphabetWithUnicodeRange:ICRangeWithCharacter('0', '9')];
}

+ (instancetype)alphanumericalAlphabet {
    NSMutableString *randomString = [NSMutableString stringWithString:[self numericalAlphabet]];
    [randomString appendString:[self letterAlphabet]];
    
    return [self stringWithString:randomString];
}

+(instancetype)alphabetWithUnicodeRange:(NSRange)range {
    NSMutableString *randomString = [NSMutableString string];
    for (unichar character = range.location; character < NSMaxRange(range); ++character) {
        [randomString appendFormat:@"%c",character];
    }
    
    return [self stringWithString:randomString];
}

+ (instancetype)randomStringWithLength:(NSUInteger)length alphabet:(NSString *)alphabet {
    NSMutableString *randomString = [NSMutableString stringWithCapacity:length];
    NSUInteger alphabetLength = [alphabet length];
    
    for (NSUInteger i = 0; i < length; ++i) {
        [randomString appendFormat:@"%C", [alphabet characterAtIndex:arc4random_uniform((uint32_t)alphabetLength)]];
    }
    
    return [self stringWithString:(randomString)];
}

+ (instancetype)randomString {
    return [self randomStringWithLength:arc4random_uniform(ICDefaultStringLength)];
}

+ (instancetype)randomStringWithLength:(NSUInteger)length {
    NSMutableString *randomString = [NSMutableString string];
    [randomString appendString: [self randomStringWithLength: length alphabet: [self letterAlphabet]]];
    
    return [self stringWithString:randomString];
}

+ (instancetype)randomName {
    NSUInteger nameLength = 6;
    NSMutableString *randomString = [NSMutableString string];
    [randomString appendString:[self randomStringWithLength:1
                                                       alphabet:[self capitalizedLetterAplphabet]]];
    [randomString appendString:[self randomStringWithLength:nameLength
                                                   alphabet:[self lowercaseLetterAlphabet]]];
    
    return [self stringWithString:randomString];
}

- (NSArray *)symbols {
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:[self length]];
    NSUInteger length = [self length];
    
    for (NSUInteger i = 0; i < length; ++i) {
        unichar resultChar = [self characterAtIndex:i];
        [result addObject:[NSString stringWithFormat:@"%c", resultChar]];
    }

    return [[result copy]autorelease];
}

@end
