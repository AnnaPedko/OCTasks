//
//  ICLocation.h
//  Creature1
//
//  Created by Anna P. on 20.05.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ICRoom.h"

@protocol ICLocation <NSObject>
@property (nonatomic, retain)   ICRoom  *room;

@end
