//
//  ICCreature+ICGenerateRandomString.h
//  Creature1
//
//  Created by Anna P. on 25.04.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ICGenerateRandomString)

+ (instancetype)alphabetWithUnicodeRange:(NSRange)range;
+ (instancetype)lowercaseLetterAlphabet;
+ (instancetype)capitalizedLetterAplphabet;
+ (instancetype)letterAlphabet;
+ (instancetype)numericalAlphabet;
+ (instancetype)alphanumericalAlphabet;
+ (instancetype)randomStringWithLength:(NSUInteger)length alphabet:(NSString *)alphabet;
+ (instancetype)randomStringWithLength:(NSUInteger)length;
+ (instancetype)randomString;
+ (instancetype)randomName;

- (NSArray *)symbols;

@end
