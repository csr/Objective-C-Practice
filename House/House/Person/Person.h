//
//  Person.h
//  House
//
//  Created by Cesare de Cal on 3/2/19.
//  Copyright © 2019 Cesare Gianfilippo Astianatte de Cal. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic) NSDate *birthday;

-(instancetype)initWithName:(NSString*)name
                   birthday:(NSDate*)birthday;

@end

NS_ASSUME_NONNULL_END
