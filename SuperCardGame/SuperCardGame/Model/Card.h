//
//  Card.h
//  CardGame
//
//  Created by kissingurami on 13-5-22.
//  Copyright (c) 2013年 kissingurami. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong,nonatomic) NSString *suit;
@property (nonatomic) NSInteger rank;
@property (nonatomic) BOOL isFaceUp;
@property (nonatomic) BOOL isUnPlayable;

+(NSArray *) validSuit;
+(NSInteger)maxRank;
-(NSString *)contents;
-(NSInteger)match:(Card *)otherCard;
@end
