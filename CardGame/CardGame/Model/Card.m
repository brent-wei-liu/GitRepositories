//
//  Card.m
//  CardGame
//
//  Created by kissingurami on 13-5-22.
//  Copyright (c) 2013年 kissingurami. All rights reserved.
//

#import "Card.h"

@implementation Card

-(NSString *)contents
{
    NSArray *rankStrings = [Card rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

+(NSArray *)validSuit
{
    return @[@"♥",@"♦",@"♠",@"♣"];
}

+(NSArray *)rankStrings
{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+(NSInteger)maxRank
{
    return [[Card rankStrings] count]-1;
}
@synthesize suit = _suit;
-(void)setSuit:(NSString *)suit
{
    if([[Card validSuit] containsObject:suit]){
        _suit = suit;
    }
}
-(NSString *)suit
{
    return _suit ? _suit:@"?";
}


-(void)setRank:(NSInteger)rank
{
    if(rank<=[Card maxRank])
        _rank = rank;
}

-(NSInteger)match:(Card *)otherCard
{
    int score = 0;    
    if (self.rank == otherCard.rank) {
        score = 4;
    }else if([self.suit isEqualToString:otherCard.suit]){
        score = 2;
    }
    
    return score;
}
@end
