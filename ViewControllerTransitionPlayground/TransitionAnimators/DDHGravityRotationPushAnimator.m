//
//  DDHGravityRotationPushAnimator.m
//  ViewControllerTransitionPlayground
//
//  Created by dasdom on 18.04.14.
//  Copyright (c) 2014 dasdom. All rights reserved.
//

#import "DDHGravityRotationPushAnimator.h"

@implementation DDHGravityRotationPushAnimator

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 1.5f;
}

- (UIDynamicAnimator*)animateForTransitionContext:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    CGPoint center = toViewController.view.center;

    toViewController.view.frame = CGRectOffset(toViewController.view.frame, toViewController.view.frame.size.width, -toViewController.view.frame.size.height-100);
    toViewController.view.transform = CGAffineTransformMakeRotation(-M_1_PI);

    [[transitionContext containerView] addSubview:toViewController.view];
    
    UIDynamicAnimator *animator = [[UIDynamicAnimator alloc] initWithReferenceView:[transitionContext containerView]];
    
    UIGravityBehavior *gravity = [[UIGravityBehavior alloc] initWithItems:@[toViewController.view]];
    
    UIAttachmentBehavior *attachment1 = [[UIAttachmentBehavior alloc] initWithItem:toViewController.view offsetFromCenter:UIOffsetMake(-center.x, -center.y) attachedToAnchor:CGPointMake(0.0f, -10.0f)];
    attachment1.length = 10.0f;
    
    UIAttachmentBehavior *attachment2 = [[UIAttachmentBehavior alloc] initWithItem:toViewController.view offsetFromCenter:UIOffsetMake(-center.x+100.0f, -center.y) attachedToAnchor:CGPointMake(0.0f, -10.0f)];
    attachment2.length = 100.5f;
    
    UIDynamicItemBehavior *propertiesBehavior = [[UIDynamicItemBehavior alloc] initWithItems:@[toViewController.view]];
    propertiesBehavior.elasticity = 0.2;
    
    UIPushBehavior *pushBehavior = [[UIPushBehavior alloc] initWithItems:@[toViewController.view] mode:UIPushBehaviorModeInstantaneous];
    pushBehavior.angle = M_PI_2;
    pushBehavior.magnitude = 100.0;
    
    UICollisionBehavior *collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[toViewController.view]];
    [collisionBehavior addBoundaryWithIdentifier:@"LeftBoundary" fromPoint:CGPointMake(-1.0f, 100.0f) toPoint:CGPointMake(-1.0f, fromViewController.view.frame.size.height)];
    
    [animator addBehavior:gravity];
    [animator addBehavior:attachment1];
    [animator addBehavior:attachment2];
    [animator addBehavior:propertiesBehavior];
    [animator addBehavior:pushBehavior];
    [animator addBehavior:collisionBehavior];
    
    return animator;
}

@end
