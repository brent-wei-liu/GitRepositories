//
//  Deck.h
//  CardGame
//
//  Created by kissingurami on 13-5-22.
//  Copyright (c) 2013年 kissingurami. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

-(void)addCard:(Card *)card;
-(Card *)drawRandomCard;
@end
