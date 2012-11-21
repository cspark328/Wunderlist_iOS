//
//  ListTableViewController.m
//  Wunderlist
//
//  Created by Chan Soon Park on 12. 9. 12..
//  Copyright (c) 2012년 Chan Soon Park. All rights reserved.
//

#import "ListTableViewController.h"
#import "ListsTableViewController.h"
#import "ListTableViewCell.h"
#import "DetailTableViewController.h"

@implementation ListTableViewController

- (id)init
{
    self = [super init];
    if (self) {
        _datas = [[NSArray alloc] initWithObjects:@"편집하려면 탭하세요", @"위 입력란에 탭하여 새로운 작업을 추가하세요", @"test", nil];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSAutoreleasePool* pool = [NSAutoreleasePool new];
    
    if ([self.parentViewController.title isEqualToString:@"목록"]) {
        [self.navigationItem setRightBarButtonItems:@[self.editBarButtonItem, self.shareBarButtonItem] animated:YES];
    } else {
        [self.navigationItem setRightBarButtonItem:self.editBarButtonItem animated:YES];
    }
    
    [pool drain];
}

- (void)dealloc
{
    [_datas release];
    
    [super dealloc];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    ListTableViewCell* cell = (ListTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[ListTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    [cell.todoTitleLabel setText:[_datas objectAtIndex:indexPath.row]];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailTableViewController* viewController = [DetailTableViewController new];
    [self.navigationController pushViewController:viewController animated:YES];
    [viewController release];
}

@end
