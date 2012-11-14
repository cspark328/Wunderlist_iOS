//
//  LoginViewController.h
//  Wunderlist
//
//  Created by Chan Soon Park on 12. 9. 11..
//  Copyright (c) 2012년 Chan Soon Park. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UserManager;

@interface LoginViewController : UIViewController<UIAlertViewDelegate>

@property(nonatomic, retain) UIButton* loginButton;
@property(nonatomic, retain) UIButton* registerButton;
@property(nonatomic, retain) UIButton* laterButton;

@property(nonatomic, retain) UserManager* userManager;

@end
