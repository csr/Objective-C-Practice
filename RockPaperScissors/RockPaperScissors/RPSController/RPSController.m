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
- (void)throwDown:(Move) move {
    RPSTurn *playersTurn = [[RPSTurn alloc] initWithMove:move];
}

@end
