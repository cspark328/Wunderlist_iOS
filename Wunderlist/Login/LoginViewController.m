//
//  LoginViewController.m
//  Wunderlist
//
//  Created by Chan Soon Park on 12. 9. 11..
//  Copyright (c) 2012년 Chan Soon Park. All rights reserved.
//

#import "LoginViewController.h"
#import "TabBarViewController.h"
#import "SpinnerView.h"

@implementation LoginViewController

- (id)init
{
    self = [super init];
    if (self) {
        NSAutoreleasePool* pool = [NSAutoreleasePool new];
        
        [self.view setBackgroundColor:[UIColor brownColor]];
        
        _loginButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_loginButton setFrame:CGRectMake(10, 10, 200, 50)];
        [_loginButton setTitle:@"로그인" forState:UIControlContentHorizontalAlignmentCenter];
        [_loginButton addTarget:self action:@selector(didClickLoginButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_loginButton];
        
        _registerButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_registerButton setFrame:CGRectMake(10, 70, 200, 50)];
        [_registerButton setTitle:@"지금 등록하기" forState:UIControlContentHorizontalAlignmentCenter];
        [_registerButton addTarget:self action:@selector(didClickJoinButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_registerButton];
        
        _laterButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_laterButton setFrame:CGRectMake(10, 130, 200, 50)];
        [_laterButton setTitle:@"나중에" forState:UIControlContentHorizontalAlignmentCenter];
        [_laterButton addTarget:self action:@selector(didClickLaterButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_laterButton];
        
        [pool drain];
    }
    return self;
}

#pragma mark - Alert view delegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        TabBarViewController* tabBarController = [TabBarViewController new];
        [self presentViewController:tabBarController animated:NO completion:nil];
        [tabBarController release];
        
        return;
    }
    
    if (buttonIndex == 1) {
        NSLog(@"지금 등록하기");
        return;
    }
}

#pragma mark - Button Action

- (void)didClickLoginButton:(id)sender
{
    NSLog(@"didClickLoginButton");
}

- (void)didClickJoinButton:(id)sender
{
    NSLog(@"didClickJoinButton");
}

- (void)didClickLaterButton:(id)sender
{
    NSString* title = @"등록하지 않으셨습니까?";
    NSString* message = @"놀라운 모든 기능들을 사용하시려면 무료 Wunderlist 계정에 등록하세요. 중요한 작업에 대하여 이메일 및 푸시 통보를 이용하거나 친구 및 동료들과 목록과 작업을 공유하실 수 있습니다. 귀하의 데이터는 절대로 안전합니다!";
    NSString* nowJoinButtonTitle = @"지금 등록하기";
    NSString* laterButtonTitle = @"향후";
    
    UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:laterButtonTitle otherButtonTitles:nowJoinButtonTitle, nil];
    [alertView show];
    [alertView release];
}

@end
