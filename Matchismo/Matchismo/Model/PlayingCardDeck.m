//
//  PlayingCardDeck.m
//  Matchismo
//
//  Created by Tiago Couto on 03/02/13.
//  Copyright (c) 2013 dryBone. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck

- (id) init {
	self = [super init];
	
	if (self) {
		NSLog(@"Initializing > PlayingCardDeck");
		for (NSString *suit in [PlayingCard validSuits]) {
			for (NSUInteger rank=1; rank<=[PlayingCard maxRanks]; rank++) {
				[self addCard:[[PlayingCard alloc] initWithRank:rank andSuit:suit]];
			}
		}
	}
	
	return self;
}

@end
