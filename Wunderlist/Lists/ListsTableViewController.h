//
//  ListsTableViewController.h
//  Wunderlist
//
//  Created by Chan Soon Park on 12. 9. 16..
//  Copyright (c) 2012년 Chan Soon Park. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseTableViewController.h"

@interface ListsTableViewController : BaseTableViewController<UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate>

@property(nonatomic, retain) NSArray* listsDatas;

@end
