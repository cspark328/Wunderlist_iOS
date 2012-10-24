//
//  WunderlistCoreData.m
//  Wunderlist
//
//  Created by Chan Soon Park on 12. 10. 23..
//  Copyright (c) 2012년 Chan Soon Park. All rights reserved.
//

#import "WunderlistCoreData.h"

@implementation WunderlistCoreData

- (id)init
{
    self = [super init];
    if (self)
        _managedObjectContext = [self managedObjectContext];
    
    return self;
}

- (void)dealloc
{
    [_managedObjectContext release];
    [_persistentStoreCoordinator release];
    
    [super dealloc];
}

- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext != nil)
        return _managedObjectContext;
    
    NSPersistentStoreCoordinator* coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _managedObjectContext = [NSManagedObjectContext new];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    
    return _managedObjectContext;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil)
        return _persistentStoreCoordinator;
    
    NSAutoreleasePool* pool = [NSAutoreleasePool new];
    
    NSString* documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSURL* storeURL = [NSURL fileURLWithPath:[documentPath stringByAppendingPathComponent:@"wunderlist.sqlite"]];
    
    NSDictionary* options = [NSDictionary dictionaryWithObjectsAndKeys:
                             [NSNumber numberWithBool:YES], NSMigratePersistentStoresAutomaticallyOption,
                             [NSNumber numberWithBool:YES], NSInferMappingModelAutomaticallyOption, nil];
    
    NSError* error;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[NSManagedObjectModel mergedModelFromBundles:nil]];
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:options error:&error]) {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    [pool drain];
    
    return _persistentStoreCoordinator;
}

- (id)insertNewObjectForEntityForName:(NSString *)entityName
{
    return [NSEntityDescription insertNewObjectForEntityForName:entityName inManagedObjectContext:_managedObjectContext];
}

- (void)insertObject:(NSManagedObject *)object
{
    [_managedObjectContext insertObject:object];
}

- (NSArray *)entityForName:(NSString *)entityName withPredicate:(NSPredicate *)predicate error:(NSError **)error
{
    NSMutableArray* objects = [NSMutableArray array];
    
    NSAutoreleasePool* pool = [NSAutoreleasePool new];
    
    NSEntityDescription* entityDescription = [NSEntityDescription entityForName:entityName inManagedObjectContext:_managedObjectContext];
    
    NSFetchRequest* request = [[NSFetchRequest new] autorelease];
    [request setEntity:entityDescription];
    [request setPredicate:predicate];
    
    [objects setArray:[_managedObjectContext executeFetchRequest:request error:error]];
    
    [pool drain];
    
    return objects;
}

- (BOOL)save
{
    NSError *error = nil;
    BOOL result = [_managedObjectContext save:&error];
    
    if (!result)
        NSLog(@"save error %@, %@", error, [error userInfo]);
    
    return result;
}

@end
