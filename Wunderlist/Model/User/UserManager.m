//
//  UserManager.m
//  Wunderlist
//
//  Created by Chan Soon Park on 12. 10. 23..
//  Copyright (c) 2012년 Chan Soon Park. All rights reserved.
//

#import "UserManager.h"
#import "User.h"

#define entityName NSStringFromClass([User class])

@implementation UserManager

- (void)dealloc
{
    [_users release];
    
    [super dealloc];
}

- (void)insertUser
{
    User* user = (User *)[self insertNewObjectForEntityForName:entityName];
    [user setUserId:@"cspark328"];
    [user setPassword:@"nollpc328"];
    [user setIsLater:NO];
    
    [self insertObject:user];
    
    NSError *error;
    [self save:&error];
}

- (NSArray *)getUsers
{
    NSError* error = nil;
    _users = [self entityForName:entityName withPredicate:nil error:&error];
    return _users;
}

@end
