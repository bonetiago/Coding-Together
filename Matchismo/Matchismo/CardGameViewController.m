//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Tiago Couto on 03/02/13.
//  Copyright (c) 2013 dryBone. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@interface CardGameViewController ()
- (IBAction)flipCard:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UIButton *card;

@property (nonatomic) int flipsCount;
@property (weak, nonatomic) IBOutlet UILabel *flipsCountLabel;
@property (strong, nonatomic) PlayingCardDeck *playingCardDeck;

@end

@implementation CardGameViewController

- (PlayingCardDeck *)playingCardDeck {
	if (!_playingCardDeck) _playingCardDeck = [[PlayingCardDeck alloc] init];
	return _playingCardDeck;
}

- (void)setFlipsCount:(int)flipsCount {
	_flipsCount = flipsCount;
	self.flipsCountLabel.text = [NSString stringWithFormat:@"Flips : %d", self.flipsCount];
}

- (IBAction)flipCard:(UIButton *)sender {
	sender.selected = !sender.isSelected;
	if (sender.selected) {
		self.flipsCount++;
		
		PlayingCard *playingCard = (PlayingCard *)[self.playingCardDeck drawRandomCard];
		
		if (playingCard)
			[self.card setTitle:[NSString stringWithFormat:@"%d%@", playingCard.rank, playingCard.suit]
					   forState:UIControlStateSelected];
		else
			[self.card setTitle:@"Empty"
					   forState:UIControlStateSelected];
	}
}

@end
