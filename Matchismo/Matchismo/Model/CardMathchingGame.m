//
//  CardMathchingGame.m
//  Matchismo
//
//  Created by Tiago Couto on 06/02/13.
//  Copyright (c) 2013 dryBone. All rights reserved.
//

#import "CardMathchingGame.h"

<<<<<<< HEAD
@interface CardMathchingGame ()
@property (nonatomic, readwrite) int score;
@property (nonatomic, strong) NSMutableArray *cards;
@end

@implementation CardMathchingGame

- (NSMutableArray *)cards {
	if (!_cards) _cards = [[NSMutableArray alloc] init];
	return _cards;
}

- (id)initWithCardCount:(NSUInteger)cardCount usingDeck:(Deck *)deck {
	self = [super init];
	
	if (self) {
		for (int qntddCartas=0; qntddCartas<cardCount; qntddCartas++) {
			Card *carta = [deck drawRandomCard];
			if (!carta) {
				return nil;
			}
			
			[self.cards addObject:carta];
		}
	}
	
	return self;
}

- (void)flipCardAtIndex:(NSUInteger)index {
	
}

- (Card *)cardAtIndex:(NSUInteger)index {
	
}

=======
@implementation CardMathchingGame

>>>>>>> origin/master
@end
