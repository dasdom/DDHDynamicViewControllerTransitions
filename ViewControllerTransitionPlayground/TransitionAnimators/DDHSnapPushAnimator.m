//
//  DDHAnimator.m
//  ViewControllerTransitionPlayground
//
//  Created by dasdom on 15.04.14.
//  Copyright (c) 2014 dasdom. All rights reserved.
//

#import "DDHSnapPushAnimator.h"

@interface DDHSnapPushAnimator ()
@property (nonatomic) UIDynamicAnimator* animator;
@end

@implementation DDHSnapPushAnimator

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.5f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    toViewController.view.frame = CGRectOffset(fromViewController.view.frame, 0.6f*fromViewController.view.frame.size.width, 0);
    
    [[transitionContext containerView] addSubview:toViewController.view];
    
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:[transitionContext containerView]];
    UISnapBehavior* snapBehavior = [[UISnapBehavior alloc] initWithItem:toViewController.view snapToPoint:fromViewController.view.center];
    [self.animator addBehavior:snapBehavior];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.animator = nil;
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    });
}

@end
