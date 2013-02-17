//
//  Deck.m
//  Matchismo
//
//  Created by Tiago Couto on 03/02/13.
//  Copyright (c) 2013 dryBone. All rights reserved.
//

#import "Deck.h"

@interface Deck()

@property (strong, nonatomic) NSMutableArray *cards;

@end


@implementation Deck

- (NSMutableArray *)cards {
	if (!_cards) _cards = [[NSMutableArray alloc] init];
	return _cards;
}

- (void)addCard:(Card *)card {
	[self.cards addObject:card];
}

- (Card *)drawRandomCard {
	Card *randomCard = nil;
	
	NSLog(@" >> There's %d card(s)", self.cards.count);
	if (self.cards.count) {
		int index = arc4random() % self.cards.count;
		NSLog(@" >>		>> drawing card at index: %d", index);
		randomCard = self.cards[index];
		[self.cards removeObjectAtIndex:index];
	}
	
	NSLog(@" >> drawed: %@", randomCard.contents);
	return randomCard;
}

@end
