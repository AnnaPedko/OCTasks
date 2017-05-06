//
//  ICRandomInRange.m
//  Creature1
//
//  Created by Anna P. on 04.05.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#include "ICRandomInRange.h"

NSUInteger ICRandomInRange(NSRange range) {
    NSUInteger max = range.length;
    NSUInteger min = range.location;
        
    return (arc4random() % (max - min + 1)) + min;
}


