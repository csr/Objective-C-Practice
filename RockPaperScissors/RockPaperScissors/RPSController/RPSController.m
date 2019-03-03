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

-(void)setGame:(RPSGame *)game {
    _game = game;
}

// The player chooses a move that gets passed to this method
- (void)throwDown:(Move) playersMove {
    // Here the RPSTurn class generates the opponent's move
    RPSTurn *playersTurn = [[RPSTurn alloc] initWithMove: playersMove];
    RPSTurn *computersTurn = [[RPSTurn alloc] init];
    
    // The RPSGame class stores the results of a game
    self.game = [[RPSGame alloc] initWithFirstTurn:playersTurn
                                        secondTurn:computersTurn];
}

-(NSString *)messageForGame:(RPSGame *)game {
    // First, handle the tie
    if (game.firstTurn.move == game.secondTurn.move) {
        return @"It's a tie!";
    } else {
        // Here we build up the results message "Rock crushes Scissors. You Win!" etc.
        NSString *winnerString = [[game winner] description];
        NSString *loserString = [[game loser] description];
        NSString *resultsString = [self resultsString:game];
        
        // Combine the 3 strings using the NSString method stringWithFormat:
        NSString *wholeString = [NSString stringWithFormat: @"%@ defeats %@. %@", winnerString, loserString, resultsString];
        
        return wholeString;
    }
}

- (NSString *)resultsString:(RPSGame *)game {
    return [game.firstTurn defeats:game.secondTurn] ? @"You win!" : @"You lose!";
}

@end
