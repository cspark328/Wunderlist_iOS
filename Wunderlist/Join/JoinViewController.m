//
//  JoinViewController.m
//  Wunderlist
//
//  Created by 박찬순 on 12. 12. 5..
//  Copyright (c) 2012년 Chan Soon Park. All rights reserved.
//

#import "JoinViewController.h"
#import "JoinTableViewCell.h"
#import "BaseNavigationController.h"

@implementation JoinViewController

- (id)init
{
    self = [super init];
    if (self) {
        NSAutoreleasePool* pool = [NSAutoreleasePool new];
        
        [self.navigationItem setTitle:@"등록"];
        
        self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
        
        _commandButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(didClickCommandButton:)];
        [self.navigationItem setRightBarButtonItem:_commandButtonItem animated:YES];
        
        [pool drain];
    }
    return self;
}

- (void)dealloc
{
    [_commandButtonItem release];
    
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
        return 3;
    else if (section == 1)
        return 1;
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    
    JoinTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        if (section == 0) {
            cell = [[[JoinTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
            if (row == 0) {
                [cell.textLabel setText:@"이메일"];
                [cell.detailTextLabel setText:@"노트 없음"];
            } else if (row == 1) {
                [cell.textLabel setText:@"비밀번호"];
                [cell.detailTextLabel setText:@"날짜 없음"];
            } else if (row == 2) {
                [cell.textLabel setText:@"소식지 받기"];
                [cell.detailTextLabel setText:@"알림 없음"];
            }
        } else if (section == 1) {
            cell = [[[JoinTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
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
            
        }
        
        if (row == 1) {
            
        }
    }
}

#pragma mark - Button action

- (void)didClickCommandButton:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
