//
//  ICCarWash.h
//  Creature1
//
//  Created by Anna P. on 03.05.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ICEmployee.h"

@interface ICCarWash : NSObject <ICEmployeeObserver>
@property (nonatomic, assign)   NSUInteger  money;

- (void)washCars;

@end
