//
//  DDHTransitionAnimator.m
//  ViewControllerTransitionPlayground
//
//  Created by Dominik Hauser on 17.04.14.
//  Copyright (c) 2014 Dominik Hauser <dominik.hauser@dasdom.de>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.


#import "DDHTransitionAnimator.h"

@implementation DDHTransitionAnimator

#pragma mark - UIViewControllerAnimatedTransitioning
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    // Should be implemented by subclasses. The duration depends on the compexity of the
    // dynamic animation.
    return 1.0f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    __block UIDynamicAnimator *animator = [self animateForTransitionContext:transitionContext];
    
    // Wait some time. The time is hardcoded for every specific animation and is equal to the
    // transitionDuration. After this duration the animator is nilled and the transitionContext
    // is completed.
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)([self transitionDuration:transitionContext] * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        animator = nil;
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    });
}

#pragma mark - dynamic animator
/**
 *  This method is meant to be implemented by subclasses. Sub classes should prepare the views, 
 *  create animator and add dynamic behaviors.
 *
 *  @param transitionContext the transitionContext
 *
 *  @return dynamic animator which is added to one of the views
 */
- (UIDynamicAnimator*)animateForTransitionContext:(id<UIViewControllerContextTransitioning>)transitionContext {
    // Has to be implemented by subclasses
    return nil;
}

@end
