//
//  ToDoManager.m
//  Wunderlist
//
//  Created by Chan Soon Park on 12. 10. 29..
//  Copyright (c) 2012년 Chan Soon Park. All rights reserved.
//

#import "ToDoManager.h"
#import "ToDo.h"

#define entityName NSStringFromClass([ToDo class])

@implementation ToDoManager

- (id)init {
    self = [super init];
    if (self)
        _todos = [NSMutableArray new];
    
    return self;
}

- (void)initToDo
{
    NSAutoreleasePool* pool = [NSAutoreleasePool new];
    
    ToDo* todo1 = [self newToDoWithNo:1 WithName:@"편집하려면 탭하세요" isStarred:YES];
    [self insertToDo:todo1];
    
    ToDo* todo2 = [self newToDoWithNo:2 WithName:@"(더 보기 > 설정)에서 배경 이미지를 변경하세요" isStarred:NO];
    [self insertToDo:todo2];
    
    ToDo* todo3 = [self newToDoWithNo:3 WithName:@"위 입력란에 탭하여 새로운 작업을 추가하세요" isStarred:NO];
    [self insertToDo:todo3];
    
    ToDo* todo4 = [self newToDoWithNo:4 WithName:@"목록 개요의 입력란에 탭하여 새로운 목록을 추가하세요" isStarred:NO];
    [self insertToDo:todo4];
    
    ToDo* todo5 = [self newToDoWithNo:5 WithName:@"삭제하시려면 손가락으로 위로 스와이프하세요" isStarred:NO];
    [self insertToDo:todo5];
    
    ToDo* todo6 = [self newToDoWithNo:6 WithName:@"이동하거나 삭제하시려면 작업 편집 버튼 (연필)을 탭하세요" isStarred:NO];
    [self insertToDo:todo6];
    
    ToDo* todo7 = [self newToDoWithNo:7 WithName:@"데이터를 동기화하시려면 화면을 풀다운하세요" isStarred:NO];
    [self insertToDo:todo7];
    
    [pool drain];
}

- (ToDo *)newToDoWithNo:(int)no WithName:(NSString *)name isStarred:(BOOL)isStarred
{
    ToDo* todo = (ToDo *)[self insertNewObjectForEntityForName:entityName];
    [todo setNo:[NSNumber numberWithInt:no]];
    [todo setIsStarred:[NSNumber numberWithBool:isStarred]];
    [todo setName:name];
    
    return todo;
}

- (void)insertToDo:(ToDo *)todo
{
    NSAutoreleasePool* pool = [NSAutoreleasePool new];
    
    [self insertObject:todo];
    [self save];
    
    [pool drain];
}

- (void)deleteToDos
{
    NSAutoreleasePool* pool = [NSAutoreleasePool new];
    
    NSError* error = nil;
    [_todos setArray:[self entityForName:entityName withPredicate:nil error:&error]];
    
    for (id object in _todos) {
        [self deleteObject:object];
    }
    
    [self save];
    
    [pool drain];
}

- (NSArray *)getToDos
{
    NSAutoreleasePool* pool = [NSAutoreleasePool new];
    
    NSError* error = nil;
    [_todos setArray:[self entityForName:entityName withPredicate:nil error:&error]];
    
    [pool drain];
    
    return _todos;
}

@end
