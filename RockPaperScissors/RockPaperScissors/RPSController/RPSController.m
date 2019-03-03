//
//  RPSController.m
//  RockPaperScissors
//
//  Created by Cesare de Cal on 3/2/19.
//  Copyright © 2019 Cesare Gianfilippo Astianatte de Cal. All rights reserved.
//

#import "RPSController.h"
#import "RPSTurn.h"

@implementation RPSController

// The player chooses a move that gets passed to this method
- (void)throwDown:(Move) playersMove {
    // Here the RPSTurn class generates the opponent's move
    RPSTurn *playersTurn = [[RPSTurn alloc] initWithMove: playersMove];
    RPSTurn *computersTurn = [[RPSTurn alloc] init];
     
    // The RPSGame class stores the results of a game
    self.game = [[RPSGame alloc] initWithFirstTurn:playersTurn
                                        secondTurn:computersTurn];
}

@end
