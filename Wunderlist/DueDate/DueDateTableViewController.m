//
//  DueDateTableViewController.m
//  Wunderlist
//
//  Created by Chan Soon Park on 12. 9. 30..
//  Copyright (c) 2012년 Chan Soon Park. All rights reserved.
//

#import "DueDateTableViewController.h"

@interface DueDateTableViewController ()

@end

@implementation DueDateTableViewController

- (id)init
{
    self = [super init];
    if (self) {
        NSAutoreleasePool* pool = [NSAutoreleasePool new];
        
        self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
        
        UIBarButtonItem* completeBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(didClickCompleteBarButton:)];
        
        [self.navigationItem setRightBarButtonItem:completeBarButtonItem animated:YES];
        [completeBarButtonItem release];
        
        NSDateFormatter* dateFromatter = [NSDateFormatter new];
        [dateFromatter setDateFormat:@"yyyy-MM-dd"];
        NSDate* minimumDate = [dateFromatter dateFromString:@"2000-01-01"];
        
        [dateFromatter setDateFormat:@"yyyy-MM-dd"];
        NSDate* maximumDate = [dateFromatter dateFromString:@"2020-01-01"];
        
        _dueDatePicker = [UIDatePicker new];
        [_dueDatePicker addTarget:self action:@selector(changedDate:) forControlEvents:UIControlEventValueChanged];
        [_dueDatePicker setDatePickerMode:UIDatePickerModeDate];
        [_dueDatePicker setMinimumDate:minimumDate];
        [_dueDatePicker setMaximumDate:maximumDate];
        [self.view addSubview:_dueDatePicker];
        
        _dueDateLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, _dueDatePicker.frame.size.height + 10, _dueDatePicker.frame.size.width - 20, 30)];
        [self.view addSubview:_dueDateLabel];
        
        _noDueDateButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_noDueDateButton setFrame:CGRectMake(10, _dueDatePicker.frame.size.height + 50, _dueDateLabel.frame.size.width, 30)];
        [_noDueDateButton setTitle:@"예정일 없음" forState:UIControlStateNormal];
        [self.view addSubview:_noDueDateButton];
        
        [pool drain];
    }
    return self;
}

- (void)dealloc
{
    [_dueDatePicker release];
    [_dueDateLabel release];
    [_noDueDateButton release];
    
    [super dealloc];
}

- (void)didClickCompleteBarButton:(UIButton *)button
{
    NSLog(@"didClickCompleteBarButton");
}

- (void)changedDate:(UIDatePicker *)datePicker
{
    NSDateFormatter* dateFromatter = [NSDateFormatter new];
    [dateFromatter setDateFormat:@"EEEE, yyyy"];
    
    [_dueDateLabel setText:[dateFromatter stringFromDate:datePicker.date]];
    [dateFromatter release];
}

@end
