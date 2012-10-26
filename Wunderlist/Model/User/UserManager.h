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

@property(nonatomic, readonly) NSMutableArray* users;
@property(nonatomic, readonly) User* user;

- (void)insertUserForId:(NSString *)userId withPassword:(NSString *)password;
- (void)deleteUsers;
- (NSArray *)getUsers;

@end
