//
//  ICCreature+ICGenerateRandomString.m
//  Creature1
//
//  Created by Anna P. on 25.04.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#import "NSString+ICGenerateRandomString.h"

@implementation NSString (ICGenerateRandomString)

+ (NSString *)generateRandomStringWithLength:(NSUInteger)length {

    NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    NSMutableString *randomString = [NSMutableString stringWithCapacity:length];
    
    for (NSUInteger i = 0; i < length; ++i) {
        [randomString appendFormat:@"%C", [letters characterAtIndex:arc4random() % [letters length]]];
    }
    
    return randomString;
}

@end
