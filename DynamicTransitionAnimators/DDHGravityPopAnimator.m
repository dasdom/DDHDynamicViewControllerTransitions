//
//  DDHGravityPopAnimator.m
//  ViewControllerTransitionPlayground
//
//  Created by Dominik Hauser on 18.04.14.
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

#import "DDHGravityPopAnimator.h"

@implementation DDHGravityPopAnimator

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 1.5f;
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
    UIGravityBehavior *gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[fromViewController.view]];
    gravityBehavior.gravityDirection = CGVectorMake(0, -1);
    
    UIPushBehavior *pushBehavior = [[UIPushBehavior alloc] initWithItems:@[fromViewController.view] mode:UIPushBehaviorModeInstantaneous];
    pushBehavior.angle = 3*M_PI_2;
    pushBehavior.magnitude = 100.0;
    [pushBehavior setTargetOffsetFromCenter:UIOffsetMake(30.0f, 0.0f) forItem:fromViewController.view];

    [animator addBehavior:pushBehavior];
    [animator addBehavior:gravityBehavior];
    
    return animator;
}

@end
