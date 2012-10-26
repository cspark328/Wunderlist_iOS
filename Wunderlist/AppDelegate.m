//
//  AppDelegate.m
//  Wunderlist
//
//  Created by Chan Soon Park on 12. 10. 23..
//  Copyright (c) 2012년 Chan Soon Park. All rights reserved.
//

#import "AppDelegate.h"
#import "UserManager.h"
#import "User.h"

@implementation AppDelegate

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    
    BOOL result = [self isLogin];
    NSLog(@"is login : %@", result ? @"YES" : @"NO");
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (Boolean)isLogin
{
    NSAutoreleasePool* pool = [NSAutoreleasePool new];
    
    UserManager* userManager = [UserManager new];
    [userManager deleteUsers];
    [userManager insertUserForId:@"cspark328" withPassword:@"1q2w3e"];
    
    
    NSArray* users = [userManager getUsers];
    
    NSLog(@"user count : %d", [users count]);
    
    if ([users count]) {
        NSLog(@"user exist");
        for (User* user in users) {
            NSLog(@"id : %@, password : %@, isLater : %@", user.userId, user.password, user.isLater);
        }
    }
    
    [userManager release];
    
    [pool drain];
    
    return YES;
}

@end
