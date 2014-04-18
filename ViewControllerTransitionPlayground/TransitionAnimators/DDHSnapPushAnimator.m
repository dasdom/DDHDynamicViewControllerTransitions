//
//  DDHAnimator.m
//  ViewControllerTransitionPlayground
//
//  Created by dasdom on 15.04.14.
//  Copyright (c) 2014 dasdom. All rights reserved.
//

#import "DDHSnapPushAnimator.h"

@implementation DDHSnapPushAnimator

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.8f;
}

- (UIDynamicAnimator*)animateForTransitionContext:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    toViewController.view.frame = CGRectOffset(fromViewController.view.frame, 0.6f*fromViewController.view.frame.size.width, 0);
    
    [[transitionContext containerView] addSubview:toViewController.view];
    
    UIDynamicAnimator *animator = [[UIDynamicAnimator alloc] initWithReferenceView:[transitionContext containerView]];
    UISnapBehavior* snapBehavior = [[UISnapBehavior alloc] initWithItem:toViewController.view snapToPoint:fromViewController.view.center];
    [animator addBehavior:snapBehavior];
    
    return animator;
}

@end
