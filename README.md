# DDHDynamicViewControllerTransitions

[![Version](http://cocoapod-badges.herokuapp.com/v/DDHDynamicViewControllerTransitions/badge.png)](http://cocoadocs.org/docsets/DDHDynamicViewControllerTransitions)
[![Platform](http://cocoapod-badges.herokuapp.com/p/DDHDynamicViewControllerTransitions/badge.png)](http://cocoadocs.org/docsets/DDHDynamicViewControllerTransitions)

Custom view controller transitions using `UIDynamic` behaviors.

## Usage

Create an instance of `DDHNavigationControllerDelegate` and make it the delegate of you navigation controller.

Example:

```objc
#import "DDHAppDelegate.h"
#import "DDHFirstViewController.h"
#import "DDHNavigationControllerDelegate.h"

@interface DDHAppDelegate ()
@property (nonatomic, strong) DDHNavigationControllerDelegate *navigationControllerDelegate;
@end

@implementation DDHAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    DDHFirstViewController *firstViewController = [[DDHFirstViewController alloc] initWithNibName:@"DDHFirstViewController" bundle:nil];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:firstViewController];
    
    self.navigationControllerDelegate = [[DDHNavigationControllerDelegate alloc] initWithTransitionType:1];
    navigationController.delegate = self.navigationControllerDelegate;
    
    self.window.rootViewController = navigationController;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

```

**Important**: The navigation controller assigns it's delegate. Therefore you will need a reference to the navigation controller delegate somewhere. Eighther in Interface Builder of in code like in the example.

To change the transition type on the fly set the transitionType of the navigation controller delegate.

### Using a storyboard

```objc
#import "DDHNavigationControllerDelegate.h"

...

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ((DDHNavigationControllerDelegate*)self.navigationController.delegate).transitionType = DDH_TRANSITION_TYPE_GRAVITY;
}
```

### Without a storyboard

```objc
#import "DDHNavigationControllerDelegate.h"

...

- (void)pushSecondViewController {
    ((DDHNavigationControllerDelegate*)self.navigationController.delegate).transitionType = DDH_TRANSITION_TYPE_GRAVITY;

    DDHSecondViewController *secondViewController = [[DDHSecondViewController alloc] initWithNibName:@"DDHSecondViewController" bundle:nil];
    [self.navigationController pushViewController:secondViewController animated:YES];
}
```

If you don't want to include the header file into your code you can use Key-Value-Coding:

```objc
[(NSObject*)self.navigationController.delegate setValue:@1 forKey:@"transitionType"];
```

## Requirements

ARC and iOS7.

## Installation

### Using CocoaPods

DDHDynamicViewControllerTransitions is available through [CocoaPods](http://cocoapods.org), to install
it simply add the following line to your Podfile:

    pod "DDHDynamicViewControllerTransitions"

### Manual

Download the project and add the files `DDHNavigationControllerDelegate.{h,m}` and the directory `DynamicTransitionAnimators` to your project.

## Author

Dominik Hauser, dominik.hauser@dasdom.de

## License

DDHDynamicViewControllerTransitions is available under the MIT license. See the LICENSE file for more info.

