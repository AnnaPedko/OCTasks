//
//  ICStringsAlphabet.h
//  Creature1
//
//  Created by Anna P. on 26.05.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#import "ICAlphabet.h"

@interface ICStringsAlphabet : ICAlphabet
@property (nonatomic, readonly)   NSArray *strings;

- (instancetype)initWithStrings:(NSArray *)strings;

@end
