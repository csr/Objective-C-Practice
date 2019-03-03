//
//  Book.m
//  House
//
//  Created by Cesare de Cal on 3/2/19.
//  Copyright © 2019 Cesare Gianfilippo Astianatte de Cal. All rights reserved.
//

#import "Book.h"

@implementation Book

-(instancetype)initWithTitle:(NSString *)title
                  withAuthor:(Person*)author
           yearOfPublication:(int)yearOfPublication {
    self = [super init];
    
    if (self) {
        _title = [title copy];
        _author = author;
        _yearOfPublication = yearOfPublication;
    }
    return self;
}

@end
