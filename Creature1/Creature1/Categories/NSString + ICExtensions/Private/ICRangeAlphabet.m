//
//  ICRangeAlphabet.m
//  Creature1
//
//  Created by Anna P. on 26.05.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#import "ICRangeAlphabet.h"

@interface ICRangeAlphabet()
@property (nonatomic, assign) NSRange range;

@end

@implementation ICRangeAlphabet

#pragma mark - 
#pragma mark Initializations and Deallocations

- (instancetype)initWithRange:(NSRange)range {
    self = [super init];
    if (self) {
        self.range = range;
    }
    
    return self;

}

#pragma mark -
#pragma mark Public

- (NSUInteger)count {
    return self.range.length;
}

- (NSString *)stringAtIndex:(NSUInteger)index {
    NSRange range = self.range;
    
    NSAssert(index < range.length, NSRangeException);
    
    return [NSString stringWithFormat:@"%c", (unichar)(range.location + index)];
}

@end
