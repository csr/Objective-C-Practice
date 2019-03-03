//
//  RPSController.h
//  RockPaperScissors
//
//  Created by Cesare de Cal on 3/2/19.
//  Copyright © 2019 Cesare Gianfilippo Astianatte de Cal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RPSTurn.h"
#import "RPSGame.h"

NS_ASSUME_NONNULL_BEGIN

@interface RPSController : NSObject

@property (nonatomic) RPSGame *game;

- (void)throwDown:(Move) playersMove;
- (NSString *)messageForGame:(RPSGame *)game;

@end

NS_ASSUME_NONNULL_END
