//
//  DetailTableViewCell.m
//  Wunderlist
//
//  Created by Chan Soon Park on 12. 9. 24..
//  Copyright (c) 2012년 Chan Soon Park. All rights reserved.
//

#import "DetailTableViewCell.h"

@implementation DetailTableViewCell

- (id)initWithStyle:(DetailTableViewCellStyle)customStyle reuseIdentifier:(NSString *)reuseIdentifier
{
    UITableViewCellStyle style = UITableViewCellStyleDefault;
    if (customStyle == DetailTableViewCellStyleValue1)
        style = UITableViewCellStyleValue1;
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        NSAutoreleasePool* pool = [NSAutoreleasePool new];
        
        switch (customStyle) {
            case DetailTableViewCellStyleTitle:
                [self initStyleTitle];
                break;
                
            case DetailTableViewCellStyleValue1:
                [self initStyleValue1];
                break;
                
            case DetailTableViewCellStyleSwitch:
                [self initStyleSwitch];
                break;
        }
        
        [pool drain];
    }
    return self;
}

#pragma mark - Init

- (void)initStyleTitle
{
    UIButton* doneCheckButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [doneCheckButton setFrame:CGRectMake(10, 10, 50, 30)];
    [doneCheckButton setTitle:@"check" forState:UIControlStateSelected];
    [doneCheckButton addTarget:self action:@selector(didClickDoneCheckButton:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:doneCheckButton];
    
    UILabel* todoTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 10, 150, 40)];
    [todoTitleLabel setBackgroundColor:[UIColor clearColor]];
    [todoTitleLabel setText:@"todo title~"];
    [self addSubview:todoTitleLabel];
    [todoTitleLabel release];
    
    [self setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
}

- (void)initStyleValue1
{
}

- (void)initStyleSwitch
{
    UISwitch* starredSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    [starredSwitch addTarget:self action:@selector(didClickStarredSwitch:) forControlEvents:UIControlEventTouchUpInside];
    [self setAccessoryView:starredSwitch];
    [starredSwitch release];
}

#pragma mark - Button action

- (void)didClickDoneCheckButton:(id)sender
{
    UIButton* button = (UIButton *)sender;
    button.selected = !button.selected;
}

- (void)didClickStarredSwitch:(id)sender
{
    NSLog(@"didClickStarredSwitch");
}

@end
