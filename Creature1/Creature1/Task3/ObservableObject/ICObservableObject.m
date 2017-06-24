//
//  ICObservableObject.m
//  Creature1
//
//  Created by Anna P. on 02.06.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#import "ICObservableObject.h"

@interface ICObservableObject ()
@property (nonatomic, retain)   NSHashTable  *mutableObservers;

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
        self.mutableObservers = [NSHashTable weakObjectsHashTable];
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
            
        [self notifyOfState:state];
    }
}

#pragma mark -
#pragma mark Public

- (void)addObserver:(id)observer {
    @synchronized (self) {
        [self.mutableObservers addObject:observer];
    }
}

- (void)removeObserver:(id)observer {
    @synchronized (self) {
        [self.mutableObservers removeObject:observer];
    }
}

- (void)removeObservers {
    @synchronized (self) {
        [self.mutableObservers removeAllObjects];
    }
}

- (BOOL)isObservedByObjects:(id)observer {
    @synchronized (self) {
        return [self.mutableObservers containsObject:observer];
    }
}

- (void)addObservers:(NSArray *)observers {
    @synchronized (self) {
        for (id observer in observers) {
            [self.mutableObservers addObject:observer];
        }
    }
}

#pragma mark -
#pragma mark Private

- (SEL)selectorForState:(NSUInteger)state {
    [self doesNotRecognizeSelector:_cmd];
    
    return NULL;
}

- (void)notifyOfChangingStateWithSelector:(SEL)selector {
    NSHashTable *observers = self.mutableObservers;
    for (id observer in observers) {
        if ([observer respondsToSelector:selector]) {
            [observer performSelector:selector withObject:self];
        }
    }
}

- (void)notifyOfState:(NSUInteger)state {
    NSLog(@"%@ object changes state to %lu", self, state);
    @synchronized (self) {
        [self notifyOfChangingStateWithSelector:[self selectorForState:state]];
    }
}

@end
