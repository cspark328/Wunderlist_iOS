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
    
    // 앱 최초 실행 시 기본 TODO를 셋팅한다.
    BOOL isFirstRun = [self isFirstRun];
    NSLog(@"is first run : %@", isFirstRun ? @"YES" : @"NO");
    if (isFirstRun) {
        [self recordFirstRun];
        [self initToDo];
    }
    
    // 사용자 정보가 없을 경우 로그인 창을 띄운다.
    // 사용자 정보가 있을 경우 core data 내용이 있으면 업로드 및 todo목록을 띄운다.
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (BOOL)isFirstRun
{
    BOOL isFirstRun = YES;
    
    NSAutoreleasePool* pool = [NSAutoreleasePool new];
    
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    NSLog(@"is first run : %@", [userDefaults stringForKey:@"firstRun"]);
    
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
    [todoManager initToDo];
    
    [pool drain];
}

- (Boolean)hasUser
{
    NSAutoreleasePool* pool = [NSAutoreleasePool new];
    
    UserManager* userManager = [UserManager new];
//    [userManager deleteUsers];
//    [userManager insertUserForId:@"cspark328" withPassword:@"1q2w3e"];
    
    NSArray* users = [userManager getUsers];
    
    if ([users count]) {
        for (User* user in users) {
            NSLog(@"id : %@, password : %@, isLater : %@", user.userId, user.password, user.isLater ? @"YES" : @"NO");
        }
    }
    
    [userManager release];
    
    [pool drain];
    
    return YES;
}

@end
