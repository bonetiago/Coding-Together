//
//  Card.m
//  Matchismo
//
//  Created by Tiago Couto on 03/02/13.
//  Copyright (c) 2013 dryBone. All rights reserved.
//

#import "Card.h"

@implementation Card

- (int)match:(Card *)card {
	if ([self.contents isEqualToString:card.contents]){
		return 1;
	}
	
	return 0;
}

- (int)matchAny:(NSArray *)otherCards {
	for (Card *card in otherCards) {
		return [self match:card];
	}
	
	return 0;
}

@end
