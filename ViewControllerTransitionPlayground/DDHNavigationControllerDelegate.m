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
#import "DDHGravityPopAnimator.h"
#import "DDHGravityRotationPushAnimator.h"

@interface DDHNavigationControllerDelegate ()
@property (nonatomic, assign) NSInteger selectedRow;
@end

@implementation DDHNavigationControllerDelegate

#pragma mark - UINavigationControllerDelegate
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    if (operation == UINavigationControllerOperationPush) {
        NSIndexPath *indexPath = [((UITableViewController*)fromVC).tableView indexPathForSelectedRow];
        self.selectedRow = indexPath.row;
        if (self.selectedRow == 0) {
            return [[DDHSnapPushAnimator alloc] init];
        } else if (self.selectedRow == 1) {
            return [[DDHGravityPushAnimator alloc] init];
        } else {
            return [[DDHGravityRotationPushAnimator alloc] init];
        }
    } else {
        if (self.selectedRow == 0) {
            return [[DDHSnapPopAnimator alloc] init];
        } else if (self.selectedRow == 1) {
            return [[DDHGravityPopAnimator alloc] init];
        } else {
            return [[DDHSnapPopAnimator alloc] init];
        }
    }
}

@end
