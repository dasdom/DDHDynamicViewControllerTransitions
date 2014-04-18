//
//  DDHSnapAnimator.m
//  ViewControllerTransitionPlayground
//
//  Created by dasdom on 17.04.14.
//  Copyright (c) 2014 dasdom. All rights reserved.
//

#import "DDHTransitionAnimator.h"

@implementation DDHTransitionAnimator

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    // Should be implemented by subclasses
    return 1.0f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    __block UIDynamicAnimator *animator = [self animateForTransitionContext:transitionContext];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)([self transitionDuration:transitionContext] * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        animator = nil;
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    });
}

- (UIDynamicAnimator*)animateForTransitionContext:(id<UIViewControllerContextTransitioning>)transitionContext {
    // Has to be implemented by subclasses
    return nil;
}

@end
