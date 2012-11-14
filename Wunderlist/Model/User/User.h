//
//  User.h
//  Wunderlist
//
//  Created by Chan Soon Park on 12. 11. 14..
//  Copyright (c) 2012년 Chan Soon Park. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface User : NSManagedObject

@property (nonatomic, retain) NSNumber * isLater;
@property (nonatomic, retain) NSString * password;
@property (nonatomic, retain) NSString * userId;
@property (nonatomic, retain) id tabOrder;

@end
