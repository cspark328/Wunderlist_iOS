//
//  DueDateTableViewController.h
//  Wunderlist
//
//  Created by Chan Soon Park on 12. 9. 30..
//  Copyright (c) 2012년 Chan Soon Park. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DueDateTableViewController : UITableViewController

@property(nonatomic, retain) UIDatePicker* dueDatePicker;
@property(nonatomic, retain) UILabel* dueDateLabel;
@property(nonatomic, retain) UIButton* noDueDateButton;

@end
