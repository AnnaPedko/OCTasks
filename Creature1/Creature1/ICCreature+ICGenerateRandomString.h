//
//  ICCreature+ICGenerateRandomString.h
//  Creature1
//
//  Created by Anna P. on 25.04.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#import "ICCreature.h"

@interface ICCreature (ICGenerateRandomString)

- (NSString *)generateRandomStringWithLength:(NSUInteger)length;

@end
