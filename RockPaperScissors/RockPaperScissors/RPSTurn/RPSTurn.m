//
//  RPSTurn.m
//  RockPaperScissors
//
//  Created by Cesare de Cal on 3/2/19.
//  Copyright © 2019 Cesare Gianfilippo Astianatte de Cal. All rights reserved.
//

#import "RPSTurn.h"

@implementation RPSTurn

- (instancetype)initWithMove:(Move *)move {
    self = [self init];
    
    if (self) {
        _move = move;
    }
    
    return self;
}

@end
