//
//  ListTableViewCell.m
//  Wunderlist
//
//  Created by Chan Soon Park on 12. 9. 21..
//  Copyright (c) 2012년 Chan Soon Park. All rights reserved.
//

#import "ListTableViewCell.h"

@implementation ListTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        NSAutoreleasePool* pool = [NSAutoreleasePool new];
        
        [self setSelectionStyle:UITableViewCellEditingStyleNone];
        
        UIButton* doneCheckButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [doneCheckButton setFrame:CGRectMake(10, 10, 50, 30)];
        [doneCheckButton setTitle:@"check" forState:UIControlStateSelected];
        [doneCheckButton addTarget:self action:@selector(didClickDoneCheckButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:doneCheckButton];
        
        UIButton* starredCheckButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [starredCheckButton setFrame:CGRectMake(70, 10, 60, 30)];
        [starredCheckButton setTitle:@"starred" forState:UIControlStateSelected];
        [starredCheckButton addTarget:self action:@selector(didClickStarredCheckButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:starredCheckButton];
        
        _todoTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(140, 10, 150, 40)];
        [_todoTitleLabel setBackgroundColor:[UIColor clearColor]];
        [self addSubview:_todoTitleLabel];
        
        [pool drain];
    }
    return self;
}

- (void)dealloc
{
    [_todoTitleLabel release];
    
    [super dealloc];
}

#pragma mark - Button action

- (void)didClickDoneCheckButton:(id)sender
{
    UIButton* button = (UIButton *)sender;
    button.selected = !button.selected;
}

- (void)didClickStarredCheckButton:(id)sender
{
    UIButton* button = (UIButton *)sender;
    button.selected = !button.selected;
}

@end
