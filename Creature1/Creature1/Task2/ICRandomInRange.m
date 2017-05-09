//
//  ICRandomInRange.m
//  Creature1
//
//  Created by Anna P. on 04.05.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#include "ICRandomInRange.h"

NSUInteger ICRandomInRange(NSRange range) {
    return range.location + (arc4random_uniform((uint32_t)(NSMaxRange(range) - range.location + 1)));
}
