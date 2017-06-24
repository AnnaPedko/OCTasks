//
//  ICDispatch.m
//  Creature1
//
//  Created by Anna P. on 17.06.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#import "ICDispatch.h"
#import "NSObject+ICExtensions.h"

@interface ICDispatch ()

@property (nonatomic, retain)   ICQueue *processedObjects;
@property (nonatomic, retain)   ICQueue *processingObjects;
@property (nonatomic, retain)   NSMutableArray *mutableProcessingObjects;

@end

@implementation ICDispatch

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.processingObjects = nil;
    self.mutableProcessingObjects = nil;
    self.processedObjects = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.processingObjects = [ICQueue object];
        self.mutableProcessingObjects = [NSMutableArray object];
    }
    
    return self;
}

- (void)addWorker:(id)worker {
    @synchronized (self) {
        id workers = self.mutableProcessingObjects;
        if (![workers containsObject:worker]) {
            [workers addObject:worker];
            
            [worker addObserver:self];
            [self.processingObjects enqueue:worker];
        }
    }
}

- (void)addWorkers:(NSArray *)workers {
    for (id worker in workers) {
        [self addWorker:worker];
    }
}

- (void)removeWorker:(id)worker {
    @synchronized (self) {
        [self.mutableProcessingObjects removeObject:worker];
        [worker removeObserver:self];
        
        [self.processingObjects removeObject:worker];
    }
}

- (void)performProcessingWithObject:(id)object {
    id worker = [self.processingObjects dequeue];
    [worker processObject:object];
}

- (void)employeeReadyForProcessing:(id<ICFinancialFlow>)object {
    NSMutableArray *workers = self.mutableProcessingObjects;
     if (![workers containsObject:object]) {
         [self.processingObjects enqueue:object];
    }
    
    [self.processedObjects enqueue:object];
    [self performProcessingWithObject:object];
}

- (void)employeeDidBecomeFree:(id)object {
    NSMutableArray *workers = self.mutableProcessingObjects;
    if (![workers containsObject:object]) {
        [self.processingObjects enqueue:object];
    }
    
    [self.processingObjects enqueue:object];
    [self performProcessingWithObject:object];
}

@end
