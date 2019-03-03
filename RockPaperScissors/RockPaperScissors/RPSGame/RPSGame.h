//
//  RPSGame.h
//  RockPaperScissors
//
//  Created by Cesare de Cal on 3/2/19.
//  Copyright © 2019 Cesare Gianfilippo Astianatte de Cal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RPSTurn.h"

NS_ASSUME_NONNULL_BEGIN

@interface RPSGame : NSObject

@property (nonatomic) RPSTurn *firstTurn;
@property (nonatomic) RPSTurn *secondTurn;

- (instancetype)initWithFirstTurn:(RPSTurn *)playerTurn
                       secondTurn:(RPSTurn *)computerTurn;

- (RPSTurn *)winner;
- (RPSTurn *)loser;


@end

NS_ASSUME_NONNULL_END
