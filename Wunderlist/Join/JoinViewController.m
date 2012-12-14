//
//  JoinViewController.m
//  Wunderlist
//
//  Created by 박찬순 on 12. 12. 5..
//  Copyright (c) 2012년 Chan Soon Park. All rights reserved.
//

#import "JoinViewController.h"
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
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        [cell setSelectionStyle:UITableViewCellEditingStyleNone];
        
        if (section == 0) {
            if (row == 0) {
                [cell.textLabel setText:@"이메일"];
                
                UITextField* textField = [[UITextField alloc] initWithFrame:CGRectMake(100, 10, 180, 30)];
                [textField setPlaceholder:@"필수"];
                [textField setKeyboardType:UIKeyboardTypeEmailAddress];
                [textField setReturnKeyType:UIReturnKeyNext];
                [textField setBackgroundColor:[UIColor clearColor]];
                [textField setTextAlignment:NSTextAlignmentLeft];
                
                [cell addSubview:textField];
                [textField release];
            } else if (row == 1) {
                [cell.textLabel setText:@"비밀번호"];
                
                UITextField* textField = [[UITextField alloc] initWithFrame:CGRectMake(100, 10, 180, 30)];
                [textField setPlaceholder:@"필수"];
                [textField setBackgroundColor:[UIColor clearColor]];
                [textField setTextAlignment:NSTextAlignmentLeft];
                [textField setSecureTextEntry:YES];
                
                [cell addSubview:textField];
                [textField release];
            } else if (row == 2) {
                [cell.textLabel setText:@"소식지 받기"];
                
                UISwitch* getNewsletterSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
                [getNewsletterSwitch addTarget:self action:@selector(didClickGetNewsletterSwitch:) forControlEvents:UIControlEventTouchUpInside];
                [cell setAccessoryView:getNewsletterSwitch];
                [getNewsletterSwitch release];
            }
        } else if (section == 1) {
            [cell.textLabel setText:@"지금 등록하기"];
            [cell.textLabel setTextAlignment:NSTextAlignmentCenter];
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


- (void)didClickGetNewsletterSwitch:(id)sender
{
    NSLog(@"didClickGetNewsletterSwitch");
}

@end
