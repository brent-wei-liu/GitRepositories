//
//  CardMachingGame.h
//  CardGame
//
//  Created by kissingurami on 13-5-22.
//  Copyright (c) 2013年 kissingurami. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
@interface CardMachingGame : NSObject

-(id) initWithCardCount:(NSInteger)cardCount
                usingDeck:(Deck *) deck;
-(Card *) cardAtIndex:(NSInteger)index;
-(void) flipCardAtIndex:(NSInteger)index;
@property (nonatomic,readonly) NSInteger score;

@end
