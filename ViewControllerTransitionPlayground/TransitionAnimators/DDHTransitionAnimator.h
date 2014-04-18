//
//  DDHSnapAnimator.h
//  ViewControllerTransitionPlayground
//
//  Created by dasdom on 17.04.14.
//  Copyright (c) 2014 dasdom. All rights reserved.
//

#import <Foundation/Foundation.h>

//@protocol DDHAnimatorDelegate <NSObject>
//- (UIDynamicAnimator*)animatorForTransitionContext:(id<UIViewControllerContextTransitioning>)transitionContext;
//@end

@interface DDHTransitionAnimator : NSObject <UIViewControllerAnimatedTransitioning>
//@property (nonatomic, strong) id<DDHAnimatorDelegate> delegate;

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext;
//- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext;
- (UIDynamicAnimator*)animateForTransitionContext:(id<UIViewControllerContextTransitioning>)transitionContext;

@end
