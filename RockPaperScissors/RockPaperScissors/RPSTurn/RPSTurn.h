//
//  RPSTurn.h
//  RockPaperScissors
//
//  Created by Cesare de Cal on 3/2/19.
//  Copyright © 2019 Cesare Gianfilippo Astianatte de Cal. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RPSTurn : NSObject

typedef NS_ENUM(NSInteger, Move) {
    Rock,
    Paper,
    Scissors
};

@property (nonatomic) Move move;

- (instancetype)initWithMove:(Move) move;

- (Move)generateMove;

- (BOOL)defeats:(RPSTurn*) opponent;

@end

NS_ASSUME_NONNULL_END
