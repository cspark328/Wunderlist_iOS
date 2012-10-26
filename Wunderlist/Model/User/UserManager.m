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

- (id)init {
    self = [super init];
    if (self)
        _users = [NSMutableArray new];
    
    return self;
}

- (void)dealloc
{
    [_users release];
    
    [super dealloc];
}

- (void)insertUserForId:(NSString *)userId withPassword:(NSString *)password
{
    NSAutoreleasePool* pool = [NSAutoreleasePool new];
    
    User* user = (User *)[self insertNewObjectForEntityForName:entityName];
    [user setUserId:userId];
    [user setPassword:password];
    [user setIsLater:[NSNumber numberWithBool:YES]];
    
    [self insertObject:user];
    [self save];
    
    [pool drain];
}

- (void)deleteUsers
{
    NSAutoreleasePool* pool = [NSAutoreleasePool new];
    
    NSError* error = nil;
    [_users setArray:[self entityForName:entityName withPredicate:nil error:&error]];
    
    for (id object in _users) {
        [self deleteObject:object];
    }
    
    [self save];
    
    [pool drain];
}

- (NSArray *)getUsers
{
    NSAutoreleasePool* pool = [NSAutoreleasePool new];
    
    NSError* error = nil;
    [_users setArray:[self entityForName:entityName withPredicate:nil error:&error]];
    
    [pool drain];
    
    return _users;
}

@end
