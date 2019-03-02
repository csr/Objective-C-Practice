//
//  Book.h
//  House
//
//  Created by Cesare de Cal on 3/2/19.
//  Copyright © 2019 Cesare Gianfilippo Astianatte de Cal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

NS_ASSUME_NONNULL_BEGIN

@interface Book : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, weak) Person *author;
@property (nonatomic) int yearOfPublication;

-(instancetype)initWithTitle:(NSString *)title
                  withAuthor:(Person*)author
           yearOfPublication:(int)yearOfPublication;

@end

NS_ASSUME_NONNULL_END
