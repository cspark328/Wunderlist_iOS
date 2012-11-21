//
//  AppDelegate.m
//  Wunderlist
//
//  Created by Chan Soon Park on 12. 10. 23..
//  Copyright (c) 2012년 Chan Soon Park. All rights reserved.
//

#import "AppDelegate.h"
#import "ToDoManager.h"
#import "UserManager.h"
#import "ToDo.h"
#import "User.h"
#import "LoginViewController.h"
#import "TabBarViewController.h"

@implementation AppDelegate

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    
    UIViewController* viewController = nil;
    
    if ([self isFirstRun]) {
        [self recordFirstRun];
        [self initToDo];
        
        NSLog(@"최초 실행이므로 로그인 창을 띄운다.");
        viewController = [LoginViewController new];
    } else {
        User* user = [self getUser];
        
        if (user) {
            viewController = [[TabBarViewController alloc] initWithTabOrder:user.tabOrder];
        } else {
            NSLog(@"사용자 정보가 없으므로 로그인 창을 띄운다.");
            viewController = [LoginViewController new];
        }
        
        [user release];
    }
    
    [self.window setRootViewController:viewController];
    [viewController release];
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (BOOL)isFirstRun
{
    BOOL isFirstRun = YES;
    
    NSAutoreleasePool* pool = [NSAutoreleasePool new];
    
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    
    if ([userDefaults objectForKey:@"firstRun"])
        isFirstRun = NO;
    
    [pool drain];
    
    return isFirstRun;
}

- (void)recordFirstRun
{
    NSAutoreleasePool* pool = [NSAutoreleasePool new];
    
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    
    if (![userDefaults objectForKey:@"firstRun"])
        [userDefaults setObject:[NSDate date] forKey:@"firstRun"];
    
    [userDefaults synchronize];
    
    [pool drain];
}

- (void)initToDo
{
    NSAutoreleasePool* pool = [NSAutoreleasePool new];
    
    ToDoManager* todoManager = [ToDoManager new];
    
    [todoManager deleteToDos];
    [todoManager initToDo];
    
    [pool drain];
}

- (User *)getUser
{
    User* user = nil;
    
    NSAutoreleasePool* pool = [NSAutoreleasePool new];
    
    UserManager* userManager = [UserManager new];
    
    NSArray* users = [userManager getUsers];
    
    if ([users count]) {
        user = [[users objectAtIndex:0] retain];
        NSLog(@"user retainCount : %i", [user retainCount]);
    }
    
    [userManager release];
    
    [pool drain];
    
    return user;
}

#pragma mark - 나중에 삭제해야함
- (BOOL)hasUser
{
    NSAutoreleasePool* pool = [NSAutoreleasePool new];
    
    UserManager* userManager = [UserManager new];
    
    NSArray* users = [userManager getUsers];
    int count = [users count];
    
    [userManager deleteUsers];
    [userManager insertUserForId:@"cspark328" withPassword:@"123qwe"];
    
    [userManager release];
    
    [pool drain];
    
    return count;
}

- (void)getToDos
{
    NSAutoreleasePool* pool = [NSAutoreleasePool new];
    
    ToDoManager* todoManager = [ToDoManager new];
    
    NSArray* todos = [todoManager getToDos];
    
    if ([todos count]) {
        for (ToDo* todo in todos) {
            NSLog(@"isStarred : %@, name : %@", todo.isStarred == [NSNumber numberWithInt:1] ? @"YES" : @"NO", todo.name);
        }
    }
    
    [todoManager release];
    
    [pool drain];
}

@end
