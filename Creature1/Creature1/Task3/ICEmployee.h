//
//  ICEmployee.h
//  Creature1
//
//  Created by Anna P. on 03.05.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ICEmployee : NSObject

@property (nonatomic, assign) NSUInteger money;
@property (nonatomic, assign) NSUInteger salary;
@property (nonatomic, assign) NSUInteger experience;

- (void) performEmployeeSpecificOperation:(id) value;

@end
