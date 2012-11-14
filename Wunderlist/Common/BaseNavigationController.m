//
//  BaseNavigationController.m
//  Wunderlist
//
//  Created by Chan Soon Park on 12. 9. 21..
//  Copyright (c) 2012년 Chan Soon Park. All rights reserved.
//

#import "BaseNavigationController.h"

@implementation BaseNavigationController

- (id)initWithRootViewController:(UIViewController *)rootViewController
{
    self = [super initWithRootViewController:rootViewController];
    if (self) {
        [self.navigationBar setBarStyle:UIBarStyleBlack];
    }
    return self;
}

@end
