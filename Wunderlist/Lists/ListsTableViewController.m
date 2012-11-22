//
//  ListsTableViewController.m
//  Wunderlist
//
//  Created by Chan Soon Park on 12. 9. 16..
//  Copyright (c) 2012년 Chan Soon Park. All rights reserved.
//

#import "ListsTableViewController.h"
#import "ListTableViewController.h"
#import "ListsTableViewCell.h"
#import "SpinnerView.h"
#import "ToDoManager.h"
#import "ToDo.h"

@implementation ListsTableViewController

- (id)init
{
    self = [super init];
    if (self) {
        NSAutoreleasePool* pool = [NSAutoreleasePool new];
        
        [self setTitle:@"목록"];
        
        UIBarButtonItem* leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(didClickLeftBarButton:)];
        [self.navigationItem setLeftBarButtonItem:leftBarButtonItem animated:YES];
        [leftBarButtonItem release];
        
        [self.navigationItem setRightBarButtonItem:self.editBarButtonItem animated:YES];
        
        _spinnerView = [SpinnerView new];
        _listsDatas = [[NSArray alloc] initWithObjects:@"받은 편지함", @"개인", @"회사", nil];
        
        [pool drain];
    }
    return self;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [_spinnerView show];
    [self performSelectorInBackground:@selector(getToDos) withObject:nil];
}

- (void)dealloc
{
    [_listsDatas release];
    [_spinnerView release];
    
    [super dealloc];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _listsDatas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    ListsTableViewCell* cell = (ListsTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[ListsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    [cell.textLabel setText:[_listsDatas objectAtIndex:indexPath.row]];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return indexPath.row == 0 ? NO : YES;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ListTableViewController* viewController = [ListTableViewController new];
    [self.navigationController pushViewController:viewController animated:YES];
    [viewController release];
}

#pragma mark - Alert view delegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        NSLog(@"확인");
        return;
    }
    
    if (buttonIndex == 1) {
        NSLog(@"취소");
        return;
    }
}

#pragma mark - Button action

- (void)didClickLeftBarButton:(id)sender
{
    NSString* title = @"Wunderlist 계정이 없으세요?";
    NSString* message = @"동기화를 하려면 Wunderlist 계정이 필요합니다. 지금 무료로 등록하시겠습니까? 물론 귀하의 작업과 목록은 저장이 됩니다!";
    NSString* cancelButtonTitle = @"취소";
    NSString* okButtonTitle = @"확인";
    
    UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:okButtonTitle otherButtonTitles:cancelButtonTitle, nil];
    [alertView show];
    [alertView release];
}

#pragma mark - data load

- (void)getToDos
{
//    NSAutoreleasePool* pool = [NSAutoreleasePool new];
//    
//    ToDoManager* todoManager = [ToDoManager new];
//    
//    NSArray* todos = [todoManager getToDos];
//    
//    if ([todos count]) {
//        for (ToDo* todo in todos) {
//            NSLog(@"isStarred : %@, name : %@", todo.isStarred == [NSNumber numberWithInt:1] ? @"YES" : @"NO", todo.name);
//        }
//    }
//    
//    [todoManager release];
//    
//    [pool drain];
    
    [NSThread sleepForTimeInterval:2];
    [_spinnerView dismissWithClickedButtonIndex:0 animated:NO];
}

@end
