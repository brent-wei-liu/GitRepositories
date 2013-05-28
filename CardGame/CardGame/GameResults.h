//
//  GameResults.h
//  CardGame
//
//  Created by kissingurami on 13-5-25.
//  Copyright (c) 2013年 kissingurami. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameResults : NSObject

@property (readonly,nonatomic) NSDate * start;
@property (readonly,nonatomic) NSDate * end;
@property (readonly,nonatomic) NSTimeInterval duration;

@property (nonatomic) int score;

+(NSArray *)allGameResults; //of GameResult
@end
