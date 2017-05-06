//
//  ICCreature+ICGenerateRandomString.h
//  Creature1
//
//  Created by Anna P. on 25.04.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ICGenerateRandomString)

+ (id)alphabetWithUnicodeRange:(NSRange)range;
+ (id)lowercaseLetterAlphabet;
+ (id)capitalizedLetterAplphabet;
+ (id)letterAlphabet;
+ (id)numericalAlphabet;
+ (id)alphanumericalAlphabet;
+ (id)generateRandomStringWithLength:(NSUInteger)length alphabet:(NSString *)alphabet;
+ (id)generateRandomStringWithLength:(NSUInteger)length;
+ (id)randomString;


@end
