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

- (void)insertUserForId:(NSString *)userId withPassword:(NSString *)password
{
    NSAutoreleasePool* pool = [NSAutoreleasePool new];
    
    User* user = [(User *)[self insertNewObjectForEntityForName:entityName] autorelease];
    [user setUserId:userId];
    [user setPassword:password];
    [user setIsLater:NO];
    
    [self insertObject:user];
    [self save];
    
    [pool drain];
}

- (NSArray *)getUsers
{
    NSError* error = nil;
    _users = [self entityForName:entityName withPredicate:nil error:&error];
    return _users;
}

@end
