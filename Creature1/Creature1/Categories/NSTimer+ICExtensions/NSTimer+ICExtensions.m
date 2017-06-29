//
//  NSTimer+ICExtensions.m
//  Creature1
//
//  Created by Anna P. on 30.06.17.
//  Copyright © 2017 Anna P. All rights reserved.
//

#import "NSTimer+ICExtensions.h"

@implementation NSTimer (ICExtensions)

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)ti
                                     weakTarget:(id)aTarget
                                   selector:(SEL)aSelector
                                   userInfo:(id)userInfo
                                    repeats:(BOOL)yesOrNo {

    return  [NSTimer scheduledTimerWithTimeInterval:ti
                                             target:[[ICTimerWeakReference alloc] initWithTarget:aTarget selector:aSelector]
                                           selector:aSelector
                                           userInfo:userInfo
                                            repeats:yesOrNo];
}

@end
