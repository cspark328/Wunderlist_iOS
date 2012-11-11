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

@implementation AppDelegate

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    
    if ([self isFirstRun]) {
        [self recordFirstRun];
        [self initToDo];
        NSLog(@"최초 실행이므로 로그인 창을 띄운다.");
    } else {
        if ([self hasUser]) {
            NSArray* tabs = [self getTabs];
            if (tabs) {
                NSLog(@"저장된 탭정보로 todo목록을 띄운다.");
            } else {
                NSLog(@"기본 탭정보로 todo목록을 띄운다.");
            }
        } else {
            NSLog(@"사용자 정보가 없으므로 로그인 창을 띄운다.");
        }
    }
    
    self.window.backgroundColor = [UIColor whiteColor];
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

- (BOOL)hasUser
{
    NSAutoreleasePool* pool = [NSAutoreleasePool new];
    
    UserManager* userManager = [UserManager new];
    
    NSArray* users = [userManager getUsers];
    int count = [users count];
    
//    if ([users count]) {
//        for (User* user in users) {
//            NSLog(@"id : %@, password : %@, isLater : %@", user.userId, user.password, user.isLater ? @"YES" : @"NO");
//        }
//    }
    
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

- (NSArray *)getTabs
{
    return nil;
}

@end
