//
//  DDHGravityPushAnimator.h
//  ViewControllerTransitionPlayground
//
//  Created by dasdom on 16.04.14.
//  Copyright (c) 2014 dasdom. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DDHGravityAnimator : NSObject

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext;
- (void)animateWithFromViewController:(UIViewController*)fromViewController toViewController:(UIViewController*)toViewController transitionContext:(id<UIViewControllerContextTransitioning>)transitionContext;

@end
