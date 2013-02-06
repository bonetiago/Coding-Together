//
//  PlayingCard.m
//  Matchismo
//
//  Created by Tiago Couto on 03/02/13.
//  Copyright (c) 2013 dryBone. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

@synthesize suit = _suit;

- (id)initWithRank:(NSUInteger)rank andSuit:(NSString *)suit {
	self = [super init];
	
	if (self) {
		self.rank = rank;
		self.suit = suit;
	}
	
	return self;
}

- (NSString *)contents {
	return [[PlayingCard rankStrings][self.rank] stringByAppendingString:self.suit];
}

+ (NSArray *)rankStrings {
	static NSArray *rankStrings = nil;
	if (!rankStrings) rankStrings = @[@"?", @"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
	return rankStrings;
}

+ (NSUInteger)maxRanks {
	return [[PlayingCard rankStrings] count];
}

+ (NSArray *)validSuits {
	static NSArray *validSuits = nil;
	if (!validSuits) validSuits = @[@"♠", @"♦", @"♣", @"♥"];
	return validSuits;
}

- (void)setSuit:(NSString *)suit {
	if ([[PlayingCard validSuits] containsObject:suit]) {
		_suit = suit;
	}
}

- (NSString *)suit {
	return _suit ? _suit : @"?";
}

@end
