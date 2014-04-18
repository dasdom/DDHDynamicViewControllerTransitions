//
//  DDHGravityPushAnimator.m
//  ViewControllerTransitionPlayground
//
//  Created by dasdom on 17.04.14.
//  Copyright (c) 2014 dasdom. All rights reserved.
//

#import "DDHGravityPushAnimator.h"

@implementation DDHGravityPushAnimator

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 1.5f;
}

- (UIDynamicAnimator*)animateForTransitionContext:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    toViewController.view.frame = CGRectOffset(fromViewController.view.frame, 0.0f, -1.0f*fromViewController.view.frame.size.height);
    
    [[transitionContext containerView] addSubview:toViewController.view];
    
    UIDynamicAnimator *animator = [[UIDynamicAnimator alloc] initWithReferenceView:[transitionContext containerView]];
    UIGravityBehavior *gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[toViewController.view]];
    
    UICollisionBehavior *collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[toViewController.view]];
    [collisionBehavior addBoundaryWithIdentifier:@"BotomBoundary" fromPoint:CGPointMake(0.0f, fromViewController.view.frame.size.height+1) toPoint:CGPointMake(fromViewController.view.frame.size.width, fromViewController.view.frame.size.height+1)];
    
    UIDynamicItemBehavior *propertiesBehavior = [[UIDynamicItemBehavior alloc] initWithItems:@[toViewController.view]];
    propertiesBehavior.elasticity = 0.2;
    
    UIPushBehavior *pushBehavior = [[UIPushBehavior alloc] initWithItems:@[toViewController.view] mode:UIPushBehaviorModeInstantaneous];
    pushBehavior.angle = M_PI_2;
    pushBehavior.magnitude = 100.0;
    
    [animator addBehavior:pushBehavior];
    [animator addBehavior:propertiesBehavior];
    [animator addBehavior:collisionBehavior];
    [animator addBehavior:gravityBehavior];
    
    return animator;
}

@end
