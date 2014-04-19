//
//  DDHAnimator.m
//  ViewControllerTransitionPlayground
//
//  Created by Dominik Hauser on 15.04.14.
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


#import "DDHNavigationControllerDelegate.h"
#import "DDHSnapPushAnimator.h"
#import "DDHSnapPopAnimator.h"
#import "DDHGravityPushAnimator.h"
#import "DDHGravityPopAnimator.h"
#import "DDHGravityRotationPushAnimator.h"
#import "DDHGravityRotationPopAnimator.h"

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
            return [[DDHGravityRotationPopAnimator alloc] init];
        }
    }
}

@end
