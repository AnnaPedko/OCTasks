//
//  ICRangeAlphabet.h
//  Creature1
//
//  Created by Anna P. on 26.05.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#import "ICAlphabet.h"

@interface ICRangeAlphabet : ICAlphabet
@property (nonatomic, readonly) NSRange range;

- (instancetype)initWithRange:(NSRange)range;

@end
