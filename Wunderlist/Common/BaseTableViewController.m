//
//  BaseTableViewController.m
//  Wunderlist
//
//  Created by Chan Soon Park on 12. 9. 21..
//  Copyright (c) 2012년 Chan Soon Park. All rights reserved.
//

#import "BaseTableViewController.h"

@implementation BaseTableViewController

- (id)init
{
    self = [super init];
    if (self) {
        NSAutoreleasePool* pool = [NSAutoreleasePool new];
        
        [self.tableView setSeparatorColor:[UIColor clearColor]];
        
        UIImageView* backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background.jpg"]];
        [self.tableView setBackgroundView:backgroundView];
        [backgroundView release];
        
        UIView* pullDownView = [[UIView alloc] initWithFrame:CGRectMake(0, -50, 320, 50)];
        
        UILabel* pullDownLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 25)];
        [pullDownLabel setText:@"동기화시 풀다운..."];
        [pullDownView addSubview:pullDownLabel];
        [pullDownLabel release];
        
        UILabel* LastTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 25, 300, 25)];
        [LastTimeLabel setText:@"최종 갱신일: 09/19/2012 2:06 PM"];
        [pullDownView addSubview:LastTimeLabel];
        [LastTimeLabel release];
        
        [self.tableView addSubview:pullDownView];
        [pullDownView release];
        
        _addHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 100)];
        
        _addContentsTextField = [[UITextField alloc] initWithFrame:CGRectMake(10, 10, 200, 50)];
        [_addContentsTextField setDelegate:self];
        [_addContentsTextField setBackgroundColor:[UIColor clearColor]];
        [_addContentsTextField setBorderStyle:UITextBorderStyleRoundedRect];
        [_addContentsTextField setReturnKeyType:UIReturnKeyDone];
        [_addContentsTextField setPlaceholder:@"새로운 목록 추가"];
        
        [_addHeaderView addSubview:_addContentsTextField];
        
        [self.tableView setTableHeaderView:_addHeaderView];
        
        _shareBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(didClickShareBarButton:)];
        _editBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(didClickEditBarButton:)];
        
        [pool drain];
    }
    return self;
}

- (void)dealloc
{
    [_addHeaderView release];
    [_addContentsTextField release];
    
    [_shareBarButtonItem release];
    [_editBarButtonItem release];
    
    [super dealloc];
}

#pragma mark - Table view data source

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"BaseTableViewController commitEditingStyle");
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    NSLog(@"BaseTableViewController moveRowAtIndexPath");
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"BaseTableViewController didSelectRowAtIndexPath %d", indexPath.row);
}

#pragma mark - Text field delegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return [_addContentsTextField resignFirstResponder];
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

- (void)didClickEditBarButton:(id)sender
{
    [self.tableView setEditing:!self.tableView.editing];
}

@end
