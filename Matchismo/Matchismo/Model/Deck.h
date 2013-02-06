//
//  Deck.h
//  Matchismo
//
//  Created by Tiago Couto on 03/02/13.
//  Copyright (c) 2013 dryBone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card;
- (Card *)drawRandomCard;

@end
