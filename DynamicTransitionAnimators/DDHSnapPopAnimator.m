//
//  DDHPopTransitionAnimator.m
//  ViewControllerTransitionPlayground
//
//  Created by Dominik Hauser on 16.04.14.
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


#import "DDHSnapPopAnimator.h"

@implementation DDHSnapPopAnimator

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.8f;
}

/**
 *  Prepare views, create animator and add behaviors.
 *
 *  @param transitionContext the transitionContext
 *
 *  @return dynamic animator
 */
- (UIDynamicAnimator*)animateForTransitionContext:(id<UIViewControllerContextTransitioning>)transitionContext {
    // Get the view controllers for the transition
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    // Add the view of the toViewController to the containerView below the fromViewControllers view
    [[transitionContext containerView] insertSubview:toViewController.view atIndex:0];
    
    // Create animator
    UIDynamicAnimator *animator = [[UIDynamicAnimator alloc] initWithReferenceView:[transitionContext containerView]];
   
    // Add behaviors
    UISnapBehavior* snapBehavior = [[UISnapBehavior alloc] initWithItem:fromViewController.view snapToPoint:CGPointMake(1.6f*fromViewController.view.frame.size.width, fromViewController.view.center.y)];
    
    [animator addBehavior:snapBehavior];
    
    return animator;
}

@end