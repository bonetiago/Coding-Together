//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Tiago Couto on 03/02/13.
//  Copyright (c) 2013 dryBone. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "CardMathchingGame.h"

@interface CardGameViewController ()
@property (nonatomic) int flipsCount;
@property (strong, nonatomic) Deck *deck;
@property (strong, nonatomic) CardMathchingGame *game;

- (void) updateUI;

- (IBAction)flipCard:(UIButton *)sender;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardsButtons;
@property (weak, nonatomic) IBOutlet UILabel *flipsCountLabel;

@end

@implementation CardGameViewController

- (CardMathchingGame *)game {
	if (!_game) _game = [[CardMathchingGame alloc] initWithCardCount:[self.cardsButtons count]
														   usingDeck:[[PlayingCardDeck alloc] init]];
	return _game;
}

- (void)setCardsButtons:(NSArray *)cardsButtons {
	NSLog(@" setting card buttons");
	_cardsButtons = cardsButtons;
	[self updateUI];
}

- (void)setFlipsCount:(int)flipsCount {
	_flipsCount = flipsCount;
	self.flipsCountLabel.text = [NSString stringWithFormat:@"Flips : %d", self.flipsCount];
}

- (IBAction)flipCard:(UIButton *)sender {
	NSLog(@"fliped a card");
	[self.game flipCardAtIndex:[self.cardsButtons indexOfObject:sender]];
	self.flipsCount++;
	[self updateUI];
}

- (void) updateUI {
	for (UIButton *cardButton in self.cardsButtons) {
		Card *card = [self.game cardAtIndex:[self.cardsButtons indexOfObject:cardButton]];
		[cardButton setTitle:card.contents forState:UIControlStateSelected];
		[cardButton setEnabled:!card.isUnplayable];
		[cardButton setSelected:card.isFaceUp];
		
	}
}

@end
