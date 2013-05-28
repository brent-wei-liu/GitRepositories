//
//  GameResultsViewController.m
//  CardGame
//
//  Created by kissingurami on 13-5-24.
//  Copyright (c) 2013年 kissingurami. All rights reserved.
//

#import "GameResultsViewController.h"
#import "GameResults.h"

@interface GameResultsViewController ()

@property (weak, nonatomic) IBOutlet UITextView *resultTextField;
@end

@implementation GameResultsViewController


-(void) updateUI
{
    NSString *displayText = @"";
    for(GameResults *result in [GameResults allGameResults] ){
        displayText = [displayText stringByAppendingFormat:@"Score : %d (%@ %0g)\n",result.score ,result.end , round(result.duration)];
        
    }
    self.resultTextField.text = displayText;
}
-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self updateUI];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}
- (IBAction)sortResults:(UIButton *)sender {
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
