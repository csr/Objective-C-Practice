//
//  Person.m
//  House
//
//  Created by Cesare de Cal on 3/2/19.
//  Copyright © 2019 Cesare Gianfilippo Astianatte de Cal. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype)initWithName:(NSString*)name birthday:(NSDate*)birthday {
    self = [self init];
    
    if (self) {
        _name = name;
        _birthday = birthday;
    }
    
    return self;
}

@end
