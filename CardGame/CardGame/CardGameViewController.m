//
//  CardGameViewController.m
//  CardGame
//
//  Created by kissingurami on 13-5-22.
//  Copyright (c) 2013年 kissingurami. All rights reserved.
//

#import "CardGameViewController.h"
#import "Deck.h"
#import "Card.h"
#import "CardMachingGame.h"
#import "GameResults.h"

@interface CardGameViewController ()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cards;

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong,nonatomic) CardMachingGame * game;
@property (weak, nonatomic) IBOutlet UILabel *flipLabel;
@property (nonatomic) NSInteger flipCount;

@property (strong,nonatomic) GameResults *gameResults;

@end
@implementation CardGameViewController

-(GameResults *) gameResults
{
    if(!_gameResults) {
        _gameResults = [[GameResults alloc] init];
    }
    return _gameResults;
}

-(CardMachingGame * ) game
{
    if (!_game) {
        _game = [[CardMachingGame alloc] initWithCardCount:self.cards.count
                                                 usingDeck:[[Deck alloc] init]
                 ];
    }
    return _game;
}

-(void)setFlipCount:(NSInteger)flipCount
{
    _flipCount = flipCount;
    self.flipLabel.text = [NSString stringWithFormat:@"flipCount : %d",_flipCount];
    
}



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    [self updateUI];

}
- (IBAction)flipCard:(UIButton *)sender {
    [self.game flipCardAtIndex:[self.cards indexOfObject:sender]];
    self.flipCount++;
    self.gameResults.score = self.game.score;
    [self updateUI];

}
- (IBAction)dealAction:(UIButton *)sender {
    self.flipCount = 0;
    self.game = nil;
    self.gameResults = nil;
    [self updateUI];
}


-(void) updateUI
{
    for (UIButton * button in self.cards) {
        Card *card = [self.game cardAtIndex:[self.cards indexOfObject:button]];
        [button setTitle:[card contents] forState:UIControlStateSelected];
        [button setTitle:[card contents] forState:UIControlStateSelected|UIControlStateDisabled];
        button.selected = card.isFaceUp;
        button.enabled = !card.isUnPlayable;
        button.alpha = card.isUnPlayable ? 0.3 : 1.0;
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score : %d",self.game.score];
}
@end
