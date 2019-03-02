//
//  RPSGame.m
//  RockPaperScissors
//
//  Created by Cesare de Cal on 3/2/19.
//  Copyright © 2019 Cesare Gianfilippo Astianatte de Cal. All rights reserved.
//

#import "RPSGame.h"

@implementation RPSGame

- (instancetype)initWithFirstTurn:(RPSTurn *)firstTurn withSecondTurn:(RPSTurn *)secondTurn {
    self = [self init];
    
    if (self) {
        _firstTurn = firstTurn;
        _secondTurn = secondTurn;
    }
    
    return self;
}

@end
