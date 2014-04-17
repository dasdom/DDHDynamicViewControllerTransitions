//
//  DDHGravityPushAnimator.m
//  ViewControllerTransitionPlayground
//
//  Created by dasdom on 16.04.14.
//  Copyright (c) 2014 dasdom. All rights reserved.
//

#import "DDHGravityAnimator.h"

@interface DDHGravityAnimator ()
@property (nonatomic) UIDynamicAnimator* animator;
@end

@implementation DDHGravityAnimator

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.5f;
}

- (void)animateWithFromViewController:(UIViewController*)fromViewController toViewController:(UIViewController*)toViewController transitionContext:(id<UIViewControllerContextTransitioning>)transitionContext {
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:[transitionContext containerView]];
    UIGravityBehavior *gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[toViewController.view]];
    
    UICollisionBehavior *collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[toViewController.view]];
    [collisionBehavior addBoundaryWithIdentifier:@"BotomBoundary" fromPoint:CGPointMake(0.0f, fromViewController.view.frame.size.height+1) toPoint:CGPointMake(fromViewController.view.frame.size.width, fromViewController.view.frame.size.height+1)];
    
    UIDynamicItemBehavior *propertiesBehavior = [[UIDynamicItemBehavior alloc] initWithItems:@[toViewController.view]];
    propertiesBehavior.elasticity = 0.3;
    
    UIPushBehavior *pushBehavior = [[UIPushBehavior alloc] initWithItems:@[toViewController.view] mode:UIPushBehaviorModeInstantaneous];
    pushBehavior.angle = M_PI_2;
    pushBehavior.magnitude = 100.0;
    
    [self.animator addBehavior:pushBehavior];
    [self.animator addBehavior:propertiesBehavior];
    [self.animator addBehavior:collisionBehavior];
    [self.animator addBehavior:gravityBehavior];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.animator = nil;
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    });

}

@end
