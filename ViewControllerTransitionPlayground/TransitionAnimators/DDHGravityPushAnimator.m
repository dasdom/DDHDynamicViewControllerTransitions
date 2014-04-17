//
//  DDHGravityPushAnimator.m
//  ViewControllerTransitionPlayground
//
//  Created by dasdom on 17.04.14.
//  Copyright (c) 2014 dasdom. All rights reserved.
//

#import "DDHGravityPushAnimator.h"

@implementation DDHGravityPushAnimator

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    toViewController.view.frame = CGRectOffset(fromViewController.view.frame, 0.0f, -1.0f*fromViewController.view.frame.size.height);
    
    [[transitionContext containerView] addSubview:toViewController.view];
    
    [self animateWithFromViewController:fromViewController toViewController:toViewController transitionContext:transitionContext];
}

@end
