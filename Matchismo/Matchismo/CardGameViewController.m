//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Tiago Couto on 03/02/13.
//  Copyright (c) 2013 dryBone. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"

@interface CardGameViewController ()
@property (nonatomic) int flipsCount;
@property (strong, nonatomic) Deck *deck;

- (IBAction)flipCard:(UIButton *)sender;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardsButtons;
@property (weak, nonatomic) IBOutlet UILabel *flipsCountLabel;

@end

@implementation CardGameViewController

- (void)setCards:(NSArray *)cardsButtons {
	_cardsButtons = cardsButtons;
	for (UIButton* cardButton in self.cardsButtons) {
		Card *card = [self.deck drawRandomCard];
		[cardButton setTitle:card.contents forState:UIControlStateSelected];
	}
}

- (Deck *)deck {
	if (!_deck) _deck = [[PlayingCardDeck alloc] init];
	return _deck;
}

- (void)setFlipsCount:(int)flipsCount {
	_flipsCount = flipsCount;
	self.flipsCountLabel.text = [NSString stringWithFormat:@"Flips : %d", self.flipsCount];
}

- (IBAction)flipCard:(UIButton *)sender {
	sender.selected = !sender.isSelected;
	self.flipsCount++;
}

@end
