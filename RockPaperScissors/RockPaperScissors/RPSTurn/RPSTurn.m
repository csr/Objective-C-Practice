//
//  RPSTurn.m
//  RockPaperScissors
//
//  Created by Cesare de Cal on 3/2/19.
//  Copyright © 2019 Cesare Gianfilippo Astianatte de Cal. All rights reserved.
//

#import "RPSTurn.h"

@implementation RPSTurn

- (instancetype)initWithMove:(Move) move {
    self = [self init];
    
    if (self) {
        _move = move;
    }
    
    return self;
}

- (instancetype)init {
    self = [self init];
    
    if (self) {
        _move = [self generateMove];
    }
    
    return self;
}


- (Move)generateMove {
    NSInteger randomNumber = arc4random_uniform(3);
    
    switch (randomNumber) {
        case 0:
            return Rock;
            break;
        case 1:
            return Paper;
            break;
        case 2:
            return Scissors;
            break;
        default:
            return Invalid;
            break;
    }
}

- (BOOL)defeats:(RPSTurn *) opponent {
    if ((self.move == Paper && opponent.move == Rock) ||
        (self.move == Scissors && opponent.move == Paper) ||
        (self.move == Rock && opponent.move == Scissors)) {
        return true;
    } else {
        return false;
    }
}

- (NSString *)description {
    switch (self.move) {
        case Rock:
            return @"Rock";
            break;
        case Paper:
            return @"Paper";
            break;
        case Scissors:
            return @"Scissors";
            break;
        case Invalid:
            return @"Invalid";
            break;
    }
}

@end
