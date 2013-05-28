//
//  CardGameViewController.m
//  SuperCardGame
//
//  Created by kissingurami on 13-5-26.
//  Copyright (c) 2013年 kissingurami. All rights reserved.
//

#import "CardGameViewController.h"
#import "SuperCardView.h"
@interface CardGameViewController ()

@property (weak, nonatomic) IBOutlet SuperCardView *superCard;
@end

@implementation CardGameViewController

-(void) setSuperCard:(SuperCardView *)superCard
{
    _superCard = superCard;
    superCard.rank = 5;
    superCard.suit = @"♥";
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
