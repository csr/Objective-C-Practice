//
//  RPSTurn.h
//  RockPaperScissors
//
//  Created by Cesare de Cal on 3/2/19.
//  Copyright © 2019 Cesare Gianfilippo Astianatte de Cal. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, Move) {
    Rock,
    Paper,
    Scissors,
    Invalid
};

@interface RPSTurn : NSObject

@property (nonatomic) Move move;

- (instancetype)initWithMove:(Move) move;
- (NSString *)description;
- (BOOL)defeats:(RPSTurn*) opponent;

@end

NS_ASSUME_NONNULL_END
