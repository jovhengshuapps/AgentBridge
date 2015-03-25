//
//  NSMutableDictionary+RenameKey.m
//  AgentBridge
//
//  Created by Joshua Jose Pecson on 3/25/15.
//  Copyright (c) 2015 host24_iOS Dev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (RenameKey)

- (void)renameKey:(NSString *)original to:(NSString *)new;

@end

@implementation NSMutableDictionary (RenameKey)

- (void)renameKey:(id)original to:(id)new; {
    id value = [self objectForKey:original];
    [self removeObjectForKey:original];
    [self setObject:value forKey:new];}
@end