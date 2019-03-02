//
//  RPSGame.m
//  RockPaperScissors
//
//  Created by Cesare de Cal on 3/2/19.
//  Copyright © 2019 Cesare Gianfilippo Astianatte de Cal. All rights reserved.
//

#import "RPSGame.h"

@implementation RPSGame

- (instancetype)initWithFirstTurn:(RPSTurn *)playerTurn
                       secondTurn:(RPSTurn *)computerTurn {
    self = [self init];
    
    if (self) {
        _playerTurn = playerTurn;
        _computerTurn = computerTurn;
    }
    
    return self;
}

@end
