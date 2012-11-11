//
//  ToDoManager.h
//  Wunderlist
//
//  Created by Chan Soon Park on 12. 10. 29..
//  Copyright (c) 2012년 Chan Soon Park. All rights reserved.
//

#import "WunderlistCoreData.h"

@class ToDo;

@interface ToDoManager : WunderlistCoreData

@property(nonatomic, readonly) NSMutableArray* todos;
@property(nonatomic, readonly) ToDo* todo;

- (void)initToDo;
- (void)insertToDo:(ToDo *)todo;
- (void)deleteToDos;
- (NSArray *)getToDos;


@end
