//
//  DDHPopTransitionAnimator.m
//  ViewControllerTransitionPlayground
//
//  Created by dasdom on 16.04.14.
//  Copyright (c) 2014 dasdom. All rights reserved.
//

#import "DDHSnapPopAnimator.h"

@implementation DDHSnapPopAnimator

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.8f;
}

- (UIDynamicAnimator*)animateForTransitionContext:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    [[transitionContext containerView] insertSubview:toViewController.view atIndex:0];
    
    UIDynamicAnimator *animator = [[UIDynamicAnimator alloc] initWithReferenceView:[transitionContext containerView]];
    UISnapBehavior* snapBehavior = [[UISnapBehavior alloc] initWithItem:fromViewController.view snapToPoint:CGPointMake(1.6f*fromViewController.view.frame.size.width, fromViewController.view.center.y)];
    [animator addBehavior:snapBehavior];
    
    return animator;
}

@end