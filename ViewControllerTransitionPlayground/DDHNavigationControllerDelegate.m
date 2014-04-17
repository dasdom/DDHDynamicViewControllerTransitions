//
//  DDHAnimator.m
//  ViewControllerTransitionPlayground
//
//  Created by dasdom on 15.04.14.
//  Copyright (c) 2014 dasdom. All rights reserved.
//

#import "DDHNavigationControllerDelegate.h"
#import "DDHSnapPushAnimator.h"
#import "DDHSnapPopAnimator.h"
#import "DDHGravityPushAnimator.h"

@interface DDHNavigationControllerDelegate ()
@end

@implementation DDHNavigationControllerDelegate

#pragma mark - UINavigationControllerDelegate
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    if (operation == UINavigationControllerOperationPush) {
        return [[DDHGravityPushAnimator alloc] init];
    } else {
        return [[DDHSnapPopAnimator alloc] init];
    }
}

@end
