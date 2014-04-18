//
//  DDHGravityPopAnimator.m
//  ViewControllerTransitionPlayground
//
//  Created by dasdom on 18.04.14.
//  Copyright (c) 2014 dasdom. All rights reserved.
//

#import "DDHGravityPopAnimator.h"

@implementation DDHGravityPopAnimator

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 1.5f;
}

- (UIDynamicAnimator*)animateForTransitionContext:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    [[transitionContext containerView] insertSubview:toViewController.view atIndex:0];
    
    UIDynamicAnimator *animator = [[UIDynamicAnimator alloc] initWithReferenceView:[transitionContext containerView]];
    UIGravityBehavior *gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[fromViewController.view]];
    
//    UICollisionBehavior *collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[toViewController.view]];
//    [collisionBehavior addBoundaryWithIdentifier:@"BotomBoundary" fromPoint:CGPointMake(0.0f, fromViewController.view.frame.size.height+1) toPoint:CGPointMake(fromViewController.view.frame.size.width, fromViewController.view.frame.size.height+1)];
    
//    UIDynamicItemBehavior *propertiesBehavior = [[UIDynamicItemBehavior alloc] initWithItems:@[toViewController.view]];
//    propertiesBehavior.elasticity = 0.3;
    
    UIPushBehavior *pushBehavior = [[UIPushBehavior alloc] initWithItems:@[fromViewController.view] mode:UIPushBehaviorModeInstantaneous];
    pushBehavior.angle = M_PI_2;
    pushBehavior.magnitude = 100.0;
    [pushBehavior setTargetOffsetFromCenter:UIOffsetMake(30.0f, 0.0f) forItem:fromViewController.view];

    
    [animator addBehavior:pushBehavior];
//    [animator addBehavior:propertiesBehavior];
//    [animator addBehavior:collisionBehavior];
    [animator addBehavior:gravityBehavior];
    
    return animator;
}

@end
