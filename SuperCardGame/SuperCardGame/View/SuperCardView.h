//
//  SuperCardView.h
//  SuperCardGame
//
//  Created by kissingurami on 13-5-26.
//  Copyright (c) 2013年 kissingurami. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SuperCardView : UIView
@property (strong,nonatomic) NSString *suit;
@property (nonatomic) NSInteger rank;
@property (nonatomic) BOOL isFaceUp;

@end
