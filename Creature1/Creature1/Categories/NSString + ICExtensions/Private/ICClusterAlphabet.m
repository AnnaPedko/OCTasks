//
//  ICClusterAlphabet.m
//  Creature1
//
//  Created by Anna P. on 26.05.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#import "ICClusterAlphabet.h"
@interface ICClusterAlphabet()
@property (nonatomic, retain)   NSArray   *alphabets;
@property (nonatomic, assign)   NSUInteger  count;

- (NSUInteger)countWithAlphabets:(NSArray *)alphabets;

@end

@implementation ICClusterAlphabet

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.alphabets = nil;
    
    [super dealloc];
}

- (instancetype)initWithAlphabets:(NSArray *)alphabets {
    self = [super init];
    if (self) {
        self.alphabets = alphabets;
        self.count = [self countWithAlphabets:alphabets];
    }
    
    return self;
}

#pragma mark -
#pragma mark Public

- (NSString *)stringAtIndex:(NSUInteger)index {
    NSUInteger count = self.count;
    NSUInteger iteratedIndex = index;
    
    NSAssert(index < count, NSRangeException);
    
    for (ICAlphabet *alphabet in self.alphabets) {
        count = [alphabet count];
        
        if (iteratedIndex < count){
            return alphabet[iteratedIndex];
        }
        
        iteratedIndex -=count;
    }
    
    return nil;
}

- (NSString *)string {
    NSMutableString *string = [NSMutableString stringWithCapacity:[self count]];
    for (ICAlphabet *alphabet in self.alphabets) {
        [string appendString:[alphabet string]];
    }
    
    return [[string copy]autorelease];
}

#pragma mark -
#pragma mark Private

- (NSUInteger)countWithAlphabets:(NSArray *)alphabets {
    NSUInteger count = 0;
    for (ICAlphabet *alphabet in alphabets) {
        count += [alphabet count];
    }
    
    return count;
}

@end