//
//  DDHDetailViewController.h
//  ViewControllerTransitionPlayground
//
//  Created by Dominik Hauser on 15.04.14.
//  Copyright (c) 2014 Dominik Hauser. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DDHDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
