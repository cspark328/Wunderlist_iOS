//
//  DetailTableViewController.h
//  Wunderlist
//
//  Created by Chan Soon Park on 12. 9. 21..
//  Copyright (c) 2012년 Chan Soon Park. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailTableViewController : UITableViewController<UIActionSheetDelegate>

@property(nonatomic, retain) UIBarButtonItem* shareBarButtonItem;

@property(nonatomic, retain) UIView* footerView;
@property(nonatomic, retain) UIButton* deleteTodoButton;

@end
