//
//  ICCarWash.h
//  Creature1
//
//  Created by Anna P. on 03.05.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#import "ICBuilding.h"
#import "ICFinancialFlow.h"

@interface ICCarWash : ICBuilding <ICFinancialFlow>

@property (nonatomic, assign) NSUInteger money;
@property (nonatomic, assign) NSUInteger price;
@property (nonatomic,copy) NSArray *carGarage;



@end
