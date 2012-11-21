//
//  EditTextViewController.m
//  Wunderlist
//
//  Created by Chan Soon Park on 12. 9. 25..
//  Copyright (c) 2012년 Chan Soon Park. All rights reserved.
//

#import "EditTextTableViewController.h"
#import <QuartzCore/QuartzCore.h>

#define KEYBOARD_PORTRAIT_HEIGHT 216
#define KEYBOARD_LANDSCAPE_HEIGHT 162

@implementation EditTextTableViewController

- (id)init
{
    self = [super init];
    if (self) {
        NSAutoreleasePool* pool = [NSAutoreleasePool new];
        
        self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
        [self.tableView setScrollEnabled:NO];
        
        _editTextView = [[UITextView alloc] initWithFrame:self.view.frame];
        [_editTextView setEditable:YES];
        [_editTextView setReturnKeyType:UIReturnKeyNext];
        [_editTextView.layer setMasksToBounds:YES];
        [_editTextView.layer setCornerRadius:10];
        [_editTextView setContentInset:UIEdgeInsetsMake(5, 5, 5, 5)];
        
        [self.view addSubview:_editTextView];
        
        [pool drain];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [_editTextView becomeFirstResponder];
    [self resizeEditTextViewFrame];
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    [self resizeEditTextViewFrame];
}

- (void)dealloc
{
    [_editTextView release];
    
    [super dealloc];
}

- (void)resizeEditTextViewFrame
{
    CGRect editTextViewFrame = CGRectMake(10, 10, 0, 0);
    CGRect mainFrame = [[UIScreen mainScreen] applicationFrame];
    
    if (UIInterfaceOrientationIsPortrait(self.interfaceOrientation)) {
        editTextViewFrame.size.width = mainFrame.size.width - 20;
        editTextViewFrame.size.height = mainFrame.size.height - self.navigationController.navigationBar.frame.size.height - KEYBOARD_PORTRAIT_HEIGHT - 20;
    } else {
        editTextViewFrame.size.width = mainFrame.size.height - 20;
        editTextViewFrame.size.height = mainFrame.size.width - self.navigationController.navigationBar.frame.size.height - KEYBOARD_LANDSCAPE_HEIGHT - 20;
    }
    
    [_editTextView setFrame:editTextViewFrame];
}

@end
