//
//  CardMathchingGame.h
//  Matchismo
//
//  Created by Tiago Couto on 06/02/13.
//  Copyright (c) 2013 dryBone. All rights reserved.
//

#import <Foundation/Foundation.h>
<<<<<<< HEAD
#import "Deck.h"

@interface CardMathchingGame : NSObject

- (id)initWithCardCount:(NSUInteger)cardCount
			  usingDeck:(Deck *)deck;
- (void)flipCardAtIndex:(NSUInteger)index;
-(Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly) int score;

=======

@interface CardMathchingGame : NSObject

>>>>>>> origin/master
@end
