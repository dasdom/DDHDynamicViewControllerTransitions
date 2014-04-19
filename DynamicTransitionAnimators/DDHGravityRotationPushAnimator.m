//
//  DDHGravityRotationPushAnimator.m
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


#import "DDHGravityRotationPushAnimator.h"

@implementation DDHGravityRotationPushAnimator

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
    
    // Prepare the view of the toViewController
    CGPoint center = toViewController.view.center;

    toViewController.view.frame = CGRectOffset(toViewController.view.frame, toViewController.view.frame.size.width, -toViewController.view.frame.size.height-100);
    toViewController.view.transform = CGAffineTransformMakeRotation(-M_1_PI);

    // Add the view of the toViewController to the containerView
    [[transitionContext containerView] addSubview:toViewController.view];
    
    // Create animator
    UIDynamicAnimator *animator = [[UIDynamicAnimator alloc] initWithReferenceView:[transitionContext containerView]];
    
    // Add behaviors
    UIGravityBehavior *gravity = [[UIGravityBehavior alloc] initWithItems:@[toViewController.view]];
    
    CGPoint anchorPoint = CGPointMake(0.0f, -10.0f);
    UIAttachmentBehavior *attachment1 = [[UIAttachmentBehavior alloc] initWithItem:toViewController.view offsetFromCenter:UIOffsetMake(-center.x, -center.y) attachedToAnchor:anchorPoint];
    attachment1.length = 10.0f;
    
    UIAttachmentBehavior *attachment2 = [[UIAttachmentBehavior alloc] initWithItem:toViewController.view offsetFromCenter:UIOffsetMake(-center.x+100.0f, -center.y) attachedToAnchor:anchorPoint];
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
