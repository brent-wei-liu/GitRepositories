//
//  Deck.m
//  CardGame
//
//  Created by kissingurami on 13-5-22.
//  Copyright (c) 2013年 kissingurami. All rights reserved.
//

#import "Deck.h"
#import "Card.h"
@interface Deck()
@property (strong,nonatomic) NSMutableArray * cards;
@end

@implementation Deck

-(id)init
{
    self = [super init];
    if(self){
        for(NSString *suit in [Card validSuit]){
            for(int rank=1;rank<=[Card maxRank];rank++){
                Card * card = [[Card alloc]init];
                card.rank = rank;
                card.suit = suit;
                [self addCard:card];
            }
        }
    }
    return self;
}


-(NSMutableArray * )cards
{
    if (!_cards) {
        _cards = [[NSMutableArray alloc]init];
    }
    return _cards;
}

-(void) addCard:(Card *)card
{
    [self.cards addObject:card];
}

-(Card *)drawRandomCard
{
    Card * randomCard = nil;
    if([self.cards count]){
        NSInteger index = arc4random() % [self.cards count];
        randomCard = self.cards[index];
        [self.cards removeObjectAtIndex:index];
    }
    return randomCard;
}
@end
