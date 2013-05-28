//
//  CardMachingGame.m
//  CardGame
//
//  Created by kissingurami on 13-5-22.
//  Copyright (c) 2013年 kissingurami. All rights reserved.
//

#import "CardMachingGame.h"
#import "Card.h"
#import "Deck.h"

@interface CardMachingGame ()

@property (strong,nonatomic) NSMutableArray * cards;
@property (nonatomic,readwrite) NSInteger score;

@end
@implementation CardMachingGame

-(NSMutableArray *) cards
{
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

-(void) flipCardAtIndex:(NSInteger)index
{
    Card * card = self.cards[index];
    if(!card.isUnPlayable){
        
        if (!card.isFaceUp) {
            for(Card *otherCard in self.cards){
                if([[card contents] isEqualToString:[otherCard contents]]) continue;
                    if(otherCard.isFaceUp && !otherCard.isUnPlayable) {
                        NSInteger score = [card match:otherCard];
                        if(score){
                            otherCard.isUnPlayable = YES;
                            card.isUnPlayable = YES;
                            otherCard.isFaceUp = YES;
                            self.score += score;
                        }else{
                            otherCard.isFaceUp = NO;
                            self.score -= 2;
                        }
                        break;
                    }
                
            }
            self.score --;
        }
        
        card.isFaceUp = !card.isFaceUp;
    }
}

-(id) initWithCardCount:(NSInteger)cardCount usingDeck:(Deck *)deck
{
    self = [super init];
    if(self){
        for(int i=0;i<cardCount;i++)   {
            Card * card = [deck drawRandomCard];
            if(!card){
                self = nil;
            }else{
                self.cards[i] = card;
            }
        }
    }
    return self;
}

-(Card *) cardAtIndex:(NSInteger)index
{
    Card * card = nil;
    if(index>=0 && index<[self.cards count])
    {
        card = self.cards[index];
    }
    
    return card;
}


@end
