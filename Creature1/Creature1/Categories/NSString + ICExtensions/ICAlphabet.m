//
//  ICAlphabet.m
//  Creature1
//
//  Created by Anna P. on 26.05.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#import "ICAlphabet.h"

#import "ICRangeAlphabet.h"
#import "ICClusterAlphabet.h"
#import "ICStringsAlphabet.h"

#import "NSString+ICGenerateRandomString.h"

NSRange ICMakeAlphabetRange(unichar leftBoundary, unichar rightBoundary) {
    unichar min = MIN(leftBoundary, rightBoundary);
    unichar max = MAX(leftBoundary, rightBoundary);
    
    return NSMakeRange(min, max - min + 1);
}

@implementation ICAlphabet

#pragma mark - 
#pragma mark Class methods

+ (instancetype)alphabetWithRange:(NSRange)range {
    return [[[ICRangeAlphabet alloc]initWithRange:range]autorelease];
}

+ (instancetype)alphabetWithStrings:(NSArray *)strings {
    return [[[ICStringsAlphabet alloc]initWithStrings:strings]autorelease];
}

+ (instancetype)alphabetWithAlphabets:(NSArray *)alphabets {
    return [[[ICClusterAlphabet alloc]initWithAlphabets:alphabets]autorelease];
}

+ (instancetype)alphabetWithSympol:(NSString *)string {
    return [self alphabetWithStrings:[string symbols]];
}

#pragma mark - 
#pragma mark Intitializations and Deallocations

- (instancetype)initWithRange:(NSRange)range {
    [self release];
    
    return [[ICRangeAlphabet alloc]initWithRange:range];
}

- (instancetype)initWithAlphabets:(NSArray *)alphabets {
    [self release];
    
    return [[ICClusterAlphabet alloc]initWithAlphabets:alphabets];;
}

- (instancetype)initWithStrings:(NSArray *)strings {
    [self release];
    
    return [[ICStringsAlphabet alloc]initWithStrings:strings];;
}

- (instancetype)initWithSymbol:(NSString *)string {
    return [self initWithStrings:[string symbols]];
}

#pragma mark -
#pragma mark Public

- (NSUInteger)count {
    [self doesNotRecognizeSelector:_cmd];

    return 0;
}
- (NSString *)stringAtIndex:(NSUInteger)index {
    [self doesNotRecognizeSelector:_cmd];

    return nil;
}

- (NSString *)objectAtIndexedSubscript:(NSUInteger)idx {
    return [self stringAtIndex:idx];
}

- (NSString *)string {
    NSMutableString *string = [NSMutableString stringWithCapacity:[self count]];
    for (NSString *symbol in self) {
        [string appendString:symbol];
    }
    
    return [[string copy]autorelease];
}

#pragma mark -
#pragma mark NSFastEnumeration

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state
                                  objects:(id *)stackbuf
                                    count:(NSUInteger)resultLength
{
    state->mutationsPtr = (unsigned long *)self;
    NSUInteger length = MIN(state -> state + resultLength,[self count]);
    resultLength = length - resultLength;
    
    if (0 != resultLength) {
        for (NSUInteger index = 0; index < resultLength; index++) {
            stackbuf[index] = self[index + state ->state];
        }
    }

    state ->itemsPtr = stackbuf;
    state ->state +=resultLength;
    return resultLength;
}

@end
