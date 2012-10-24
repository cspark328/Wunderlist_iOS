//
//  UserManager.h
//  Wunderlist
//
//  Created by Chan Soon Park on 12. 10. 23..
//  Copyright (c) 2012년 Chan Soon Park. All rights reserved.
//

#import "WunderlistCoreData.h"

@class User;

@interface UserManager : WunderlistCoreData

@property(nonatomic, retain) NSArray* users;
@property(nonatomic, retain) User* user;

- (void)insertUserForId:(NSString *)userId withPassword:(NSString *)password;
- (NSArray *)getUsers;

@end
