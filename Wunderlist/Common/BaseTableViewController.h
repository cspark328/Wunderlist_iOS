//
//  BaseTableViewController.h
//  Wunderlist
//
//  Created by Chan Soon Park on 12. 9. 21..
//  Copyright (c) 2012년 Chan Soon Park. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTableViewController : UITableViewController<UITextFieldDelegate, UIActionSheetDelegate>

@property(nonatomic, retain) UIView* addHeaderView;
@property(nonatomic, retain) UITextField* addContentsTextField;

@property(nonatomic, retain) UIBarButtonItem* shareBarButtonItem;
@property(nonatomic, retain) UIBarButtonItem* editBarButtonItem;

@end
