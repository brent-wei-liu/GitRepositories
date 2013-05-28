//
//  GameResults.m
//  CardGame
//
//  Created by kissingurami on 13-5-25.
//  Copyright (c) 2013年 kissingurami. All rights reserved.
//

#import "GameResults.h"
@interface GameResults()
@property (readwrite,nonatomic) NSDate * start;
@property (readwrite,nonatomic) NSDate * end;
@property (readwrite,nonatomic) NSTimeInterval duration;

#define ALL_RESULTS_KEY @"GameResult_All"
@end
@implementation GameResults

#define START_KEY @"StartDate"
#define END_KEY @"EndDate"
#define SCORE_KEY @"Score"

-(id) init
{
    self = [super init];
    if (self) {
        _start = [NSDate date];
        _end = _start;
    }
    return self;
}

+(NSArray *)allGameResults
{
    NSMutableArray * allGameResults = [[NSMutableArray alloc] init];
    for (id plist in[[[NSUserDefaults standardUserDefaults] dictionaryForKey:ALL_RESULTS_KEY] allValues]) {
        GameResults * result = [[GameResults alloc] initFromPropertyList:plist];
        [allGameResults addObject:result];
    }
    return allGameResults;
    
}

//convinience initializer
-(id) initFromPropertyList:(id)plist
{
    self = [self init];
    if (self) {
        if([plist isKindOfClass:[NSDictionary class]])
        {
            NSDictionary *resultDictionary = (NSDictionary *)plist;
            _start = resultDictionary[START_KEY];
            _end = resultDictionary[END_KEY];
            _score = [resultDictionary[SCORE_KEY] intValue];
            if(!_start || !_end) self = nil;
        }
    }
    return self;
}
-(NSTimeInterval )duration
{
    return [self.end timeIntervalSinceDate:self.start];
}
-(void)setScore:(int)score
{
    _score = score;
    _end = [NSDate date];
    [self synchronize];
}

-(void)synchronize
{
    NSMutableDictionary *mutableGameResultsFromUserDefaults = [[[NSUserDefaults standardUserDefaults] dictionaryForKey:ALL_RESULTS_KEY] mutableCopy];
    if (!mutableGameResultsFromUserDefaults) {
        mutableGameResultsFromUserDefaults = [[NSMutableDictionary alloc] init];
    }
    mutableGameResultsFromUserDefaults[ [self.start description] ] = [self asPropertyList];
    [[NSUserDefaults standardUserDefaults] setObject:mutableGameResultsFromUserDefaults forKey:ALL_RESULTS_KEY];
    [[NSUserDefaults standardUserDefaults] synchronize];
}



-(id)asPropertyList
{
    return @{START_KEY : self.start ,
             END_KEY : self.end ,
             SCORE_KEY : @(self.score) //NSNumber
             };
    
}
@end
