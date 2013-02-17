//
//  CardMathchingGame.m
//  Matchismo
//
//  Created by Tiago Couto on 06/02/13.
//  Copyright (c) 2013 dryBone. All rights reserved.
//

#import "CardMathchingGame.h"

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
	
	NSLog(@"Initializing > CardMatchingGame");
	NSLog(@"	>> initWithCardCount: %d usingDeck: %@", cardCount, deck);
	if (self) {
		for (int i=0; i<cardCount; i++) {
			Card *carta = [deck drawRandomCard];
			if (!carta) {
				NSLog(@"ERRO : CRIAR CARTA");
				return nil;
			}
			
			[self.cards addObject:carta];
		}
	}
	
	return self;
}

#define MATCH_BONUS			4
#define MISSMATCH_PENALTY	2
#define FLIP_COST			1
- (void)flipCardAtIndex:(NSUInteger)index {
	NSLog(@" ============================================");
	NSLog(@"fliping card at index: %d", index);
	
	Card* card = [self cardAtIndex:index];
	Card* matched = nil;
	
	if (!card.isUnplayable) {
		int matchScore = 0;
		
		if (!card.isFaceUp) {
			for (Card *other in self.cards) {
				NSLog(@" 	>>> Other : %@", other.contents);
				NSLog(@"	>>> Other.isUnplayable? %@", other.isUnplayable ? @"YES" : @"NO");
				NSLog(@"	>>> Other.isFaceUp? %@", other.isFaceUp ? @"YES" : @"NO");
				
				if (other.isFaceUp && !other.isUnplayable) {
					matchScore = [card match:other];
					if (matchScore) {
						matched = other;
						other.unplayable = YES;
						card.unplayable = YES;
						matchScore *= MATCH_BONUS;
					} else {
						other.faceUp = NO;
						matchScore -= MISSMATCH_PENALTY;
					}
				}
			}
			
			matchScore -= FLIP_COST;
		}
		
		self.score += matchScore;
		card.faceUp = !card.isFaceUp;
		
		if (matched)
			NSLog(@" >>> card matched : %@ with: %@", card.contents, matched.contents);
		else
			NSLog(@" >>> NO MATCH!");
		
		NSLog(@" >>> matchScore : %d", matchScore);
		NSLog(@" >>> self.score : %d", self.score);
	}
}

- (Card *)cardAtIndex:(NSUInteger)index {
	return (index < self.cards.count) ? self.cards[index] : nil;
}

@end
