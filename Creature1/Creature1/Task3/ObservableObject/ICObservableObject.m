//
//  ICObservableObject.m
//  Creature1
//
//  Created by Anna P. on 02.06.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#import "ICObservableObject.h"

@interface ICObservableObject ()
@property (nonatomic, retain)   NSMutableSet    *mutableObservers;

- (void)notifyOfChangingStateWithSelector:(SEL)selector;

@end

@implementation ICObservableObject

@dynamic observers;

#pragma mark - 
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.mutableObservers = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.mutableObservers = [NSMutableSet set];
    }
    return self;
}

#pragma mark - 
#pragma mark Accessors

- (NSSet *)observers {
    return [[self.mutableObservers copy] autorelease];
}

- (void)setState:(NSUInteger)state {
    if (state != _state) {
        _state = state;
        
        [self notifyOfChangingStateWithSelector:[self selectorForState:state]];
    }
}
#pragma mark -
#pragma mark Public

- (void)addObserver:(id)observer {
    [self.mutableObservers addObject:observer];
}

- (void)removeObserver:(id)observer {
    [self.mutableObservers removeObject:observer];
}

- (BOOL)isObserverdByObjects:(id)observer {
    return [self.mutableObservers containsObject:observer];
}

#pragma mark - 
#pragma mark Private

- (SEL)selectorForState:(NSUInteger)state {
    [self doesNotRecognizeSelector:_cmd];
    
    return NULL;
}

- (void)notifyOfChangingStateWithSelector:(SEL)selector {
    NSMutableSet *observers = self.mutableObservers;
    for (id observer in observers) {
        if ([observer respondsToSelector:selector]) {
            [observer performSelector:selector withObject:self];
        }
    }
}


@end