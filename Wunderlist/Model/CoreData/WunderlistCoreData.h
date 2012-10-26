//
//  WunderlistCoreData.h
//  Wunderlist
//
//  Created by Chan Soon Park on 12. 10. 23..
//  Copyright (c) 2012년 Chan Soon Park. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface WunderlistCoreData : NSObject

@property (nonatomic, retain) NSManagedObjectContext* managedObjectContext;
@property (nonatomic, retain) NSPersistentStoreCoordinator* persistentStoreCoordinator;

- (id)insertNewObjectForEntityForName:(NSString *)entityName;
- (void)insertObject:(NSManagedObject *)object;
- (void)deleteObject:(NSManagedObject *)object;
- (NSArray *)entityForName:(NSString *)entityName withPredicate:(NSPredicate *)predicate error:(NSError **)error;
- (BOOL)save;

@end
