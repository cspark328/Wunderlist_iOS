//
//  TabBarViewController.m
//  Wunderlist
//
//  Created by Chan Soon Park on 12. 9. 11..
//  Copyright (c) 2012년 Chan Soon Park. All rights reserved.
//

#import "TabBarViewController.h"
#import "ListTableViewController.h"
#import "ListsTableViewController.h"
#import "SettingsTableViewController.h"
#import "BaseNavigationController.h"

@implementation TabBarViewController

- (id)initWithTabOrder:(NSArray *)tabOrder
{
    self = [super init];
    if (self) {
        NSAutoreleasePool* pool = [NSAutoreleasePool new];
        
        ListsTableViewController* listsTableViewController = [ListsTableViewController new];
        BaseNavigationController* listsNavigationController = [[BaseNavigationController alloc] initWithRootViewController:listsTableViewController];
        [listsNavigationController.tabBarItem setImage:[UIImage imageNamed:@""]];
        [listsNavigationController.tabBarItem setTitle:listsTableViewController.title];
        [listsTableViewController release];
        
        ListTableViewController* starredTableViewController = [ListTableViewController new];
        BaseNavigationController* starredNavigationController = [[BaseNavigationController alloc] initWithRootViewController:starredTableViewController];
        [starredTableViewController release];
        
        [starredNavigationController.tabBarItem setImage:[UIImage imageNamed:@""]];
        [starredNavigationController.tabBarItem setTitle:@"별표시됨"];
        
        ListTableViewController* todayTableViewController = [ListTableViewController new];
        BaseNavigationController* todayNavigationController = [[BaseNavigationController alloc] initWithRootViewController:todayTableViewController];
        [todayTableViewController release];
        
        [todayNavigationController.tabBarItem setImage:[UIImage imageNamed:@""]];
        [todayNavigationController.tabBarItem setTitle:@"오늘"];
        
        ListTableViewController* overdueTableViewController = [ListTableViewController new];
        BaseNavigationController* overdueNavigationController = [[BaseNavigationController alloc] initWithRootViewController:overdueTableViewController];
        [overdueTableViewController release];
        
        [overdueNavigationController.tabBarItem setImage:[UIImage imageNamed:@""]];
        [overdueNavigationController.tabBarItem setTitle:@"기한경과"];
        
        ListTableViewController* allTableViewController = [ListTableViewController new];
        BaseNavigationController* allTableNavigationController = [[BaseNavigationController alloc] initWithRootViewController:allTableViewController];
        [allTableViewController release];
        
        [allTableNavigationController.tabBarItem setImage:[UIImage imageNamed:@""]];
        [allTableNavigationController.tabBarItem setTitle:@"전부"];
        
        ListTableViewController* doneTableViewController = [ListTableViewController new];
        BaseNavigationController* doneNavigationController = [[BaseNavigationController alloc] initWithRootViewController:doneTableViewController];
        [doneTableViewController release];
        
        [doneNavigationController.tabBarItem setImage:[UIImage imageNamed:@""]];
        [doneNavigationController.tabBarItem setTitle:@"완료됨"];
        
        ListTableViewController* tomorrowTableViewController = [ListTableViewController new];
        BaseNavigationController* tomorrowNavigationController = [[BaseNavigationController alloc] initWithRootViewController:tomorrowTableViewController];
        [tomorrowTableViewController release];
        
        [tomorrowNavigationController.tabBarItem setImage:[UIImage imageNamed:@""]];
        [tomorrowNavigationController.tabBarItem setTitle:@"내일"];
        
        ListTableViewController* next7DaysTableViewController = [ListTableViewController new];
        BaseNavigationController* next7DaysNavigationController = [[BaseNavigationController alloc] initWithRootViewController:next7DaysTableViewController];
        [next7DaysTableViewController release];
        
        [next7DaysNavigationController.tabBarItem setImage:[UIImage imageNamed:@""]];
        [next7DaysNavigationController.tabBarItem setTitle:@"다음 7일"];
        
        ListTableViewController* laterTableViewController = [ListTableViewController new];
        BaseNavigationController* laterNavigationController = [[BaseNavigationController alloc] initWithRootViewController:laterTableViewController];
        [laterTableViewController release];
        
        [laterNavigationController.tabBarItem setImage:[UIImage imageNamed:@""]];
        [laterNavigationController.tabBarItem setTitle:@"향후"];
        
        ListTableViewController* noDueDateTableViewController = [ListTableViewController new];
        BaseNavigationController* noDueDateNavigationController = [[BaseNavigationController alloc] initWithRootViewController:noDueDateTableViewController];
        [noDueDateTableViewController release];
        
        [noDueDateNavigationController.tabBarItem setImage:[UIImage imageNamed:@""]];
        [noDueDateNavigationController.tabBarItem setTitle:@"예정일 없음"];
        
        SettingsTableViewController* settingsTableViewController = [SettingsTableViewController new];
        BaseNavigationController* settingsNavigationController = [[BaseNavigationController alloc] initWithRootViewController:settingsTableViewController];
        [settingsTableViewController release];
        
        [settingsNavigationController.tabBarItem setImage:[UIImage imageNamed:@""]];
        [settingsNavigationController.tabBarItem setTitle:@"설정"];
        
        if (tabOrder == NULL) {
            NSLog(@"탭 순서가 없으므로 기본 순서로 로딩한다.");
        } else {
            NSLog(@"저장된 탭 순서로 로딩한다.");
        }
        
        self.viewControllers = [NSArray arrayWithObjects:listsNavigationController, starredNavigationController, todayNavigationController, overdueNavigationController, allTableNavigationController, doneNavigationController, tomorrowNavigationController, next7DaysNavigationController, laterNavigationController, noDueDateNavigationController, settingsNavigationController, nil];
        
        [self.moreNavigationController.navigationBar setBarStyle:UIBarStyleBlack];
        
        [listsNavigationController release];
        [starredNavigationController release];
        [todayNavigationController release];
        [overdueNavigationController release];
        [allTableNavigationController release];
        [doneNavigationController release];
        [tomorrowNavigationController release];
        [next7DaysNavigationController release];
        [laterNavigationController release];
        [noDueDateNavigationController release];
        [settingsNavigationController release];
        
        [pool drain];
    }
    return self;
}

@end
