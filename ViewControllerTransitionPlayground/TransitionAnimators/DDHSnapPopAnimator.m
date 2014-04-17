//
//  DDHPopTransitionAnimator.m
//  ViewControllerTransitionPlayground
//
//  Created by dasdom on 16.04.14.
//  Copyright (c) 2014 dasdom. All rights reserved.
//

#import "DDHSnapPopAnimator.h"

@interface DDHSnapPopAnimator ()
@property (nonatomic) UIDynamicAnimator* animator;
@end

@implementation DDHSnapPopAnimator

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.5f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
        
    [[transitionContext containerView] insertSubview:toViewController.view atIndex:0];
    
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:[transitionContext containerView]];
    UISnapBehavior* snapBehavior = [[UISnapBehavior alloc] initWithItem:fromViewController.view snapToPoint:CGPointMake(1.6f*fromViewController.view.frame.size.width, fromViewController.view.center.y)];
    [self.animator addBehavior:snapBehavior];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.animator = nil;
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    });
}

@end