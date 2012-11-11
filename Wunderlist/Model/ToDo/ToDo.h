//
//  ToDo.h
//  Wunderlist
//
//  Created by Chan Soon Park on 12. 11. 11..
//  Copyright (c) 2012년 Chan Soon Park. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface ToDo : NSManagedObject

@property (nonatomic, retain) NSDate * dueDate;
@property (nonatomic, retain) NSNumber * isDone;
@property (nonatomic, retain) NSNumber * isStarred;
@property (nonatomic, retain) NSNumber * no;
@property (nonatomic, retain) NSString * memo;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSDate * reminderDate;
@property (nonatomic, retain) NSNumber * reminderType;

@end
