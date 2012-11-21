//
//  DetailTableViewController.m
//  Wunderlist
//
//  Created by Chan Soon Park on 12. 9. 21..
//  Copyright (c) 2012년 Chan Soon Park. All rights reserved.
//

#import "DetailTableViewController.h"
#import "DetailTableViewCell.h"
#import "EditTextTableViewController.h"
#import "DueDateTableViewController.h"

@interface DetailTableViewController ()

@end

@implementation DetailTableViewController

- (id)init
{
    self = [super init];
    if (self) {
        NSAutoreleasePool* pool = [NSAutoreleasePool new];
        
        self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
        
        _shareBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(didClickShareBarButton:)];
        [self.navigationItem setRightBarButtonItem:_shareBarButtonItem animated:YES];
        
        _deleteTodoButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_deleteTodoButton setFrame:CGRectMake(10, 10, 100, 30)];
        [_deleteTodoButton setTitle:@"작업 삭제" forState:UIControlStateNormal];
        [_deleteTodoButton addTarget:self action:@selector(didClickDeleteTodoButton:) forControlEvents:UIControlEventTouchUpInside];
        
        _footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 100)];
        [_footerView setBackgroundColor:[UIColor clearColor]];
        [_footerView addSubview:_deleteTodoButton];
        
        [self.tableView setTableFooterView:_footerView];
        
        [pool drain];
    }
    return self;
}

- (void)dealloc
{
    [_footerView release];
    
    [super dealloc];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
        return 1;
    else if (section == 1)
        return 5;
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    
    DetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        if (section == 0) {
            cell = [[[DetailTableViewCell alloc] initWithStyle:DetailTableViewCellStyleTitle reuseIdentifier:CellIdentifier] autorelease];
        } else if (section == 1) {
            cell = [[[DetailTableViewCell alloc] initWithStyle:DetailTableViewCellStyleValue1 reuseIdentifier:CellIdentifier] autorelease];
            if (row == 0) {
                [cell.textLabel setText:@"노트"];
                [cell.detailTextLabel setText:@"노트 없음"];
            } else if (row == 1) {
                [cell.textLabel setText:@"예정일"];
                [cell.detailTextLabel setText:@"날짜 없음"];
            } else if (row == 2) {
                [cell.textLabel setText:@"알림"];
                [cell.detailTextLabel setText:@"알림 없음"];
            } else if (row == 3) {
                [cell.textLabel setText:@"목록"];
                [cell.detailTextLabel setText:@"받은 편지함"];
            } else if (row == 4) {
                cell = [[[DetailTableViewCell alloc] initWithStyle:DetailTableViewCellStyleSwitch reuseIdentifier:CellIdentifier] autorelease];
                [cell.textLabel setText:@"별표시됨"];
            }
        }
    }
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    
    NSLog(@"section : %d, row : %d", section, row);
    
    if (section == 1) {
        if (row == 0) {
            EditTextTableViewController* viewController = [EditTextTableViewController new];
            [self.navigationController pushViewController:viewController animated:YES];
        }
        
        if (row == 1) {
            DueDateTableViewController* viewController = [DueDateTableViewController new];
            [self.navigationController pushViewController:viewController animated:YES];
        }
    }
}

#pragma mark - Action sheet delegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"actionSheet %d", buttonIndex);
}

#pragma mark - Button action

- (void)didClickShareBarButton:(id)sender
{
    UIActionSheet* shareActionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"취소" destructiveButtonTitle:nil otherButtonTitles:@"Facebook", @"Email", @"SMS", nil];
    [shareActionSheet showFromTabBar:self.navigationController.tabBarController.tabBar];
    [shareActionSheet release];
}

- (void)didClickDeleteTodoButton:(id)sender
{
    NSLog(@"didClickDeleteTodoButton");
}

@end
