//
//  SuperCardView.m
//  SuperCardGame
//
//  Created by kissingurami on 13-5-26.
//  Copyright (c) 2013年 kissingurami. All rights reserved.
//

#import "SuperCardView.h"

@implementation SuperCardView



// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    UIBezierPath *roundRect = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:12.0];
    [roundRect addClip];
    [[UIColor whiteColor] setFill];
    UIRectFill(self.bounds);
    
    [[UIColor blackColor] setStroke];
    [roundRect stroke];
    
    [self drawCorners];
}
-(void) drawCorners
{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.alignment = NSTextAlignmentCenter;
    
    UIFont *cornerFont = [UIFont systemFontOfSize:self.bounds.size.width * 0.2];
    NSString *string = [NSString stringWithFormat:@"%@\n%@",[self rankAsString],self.suit] ;
    NSAttributedString *cornerText = [[NSAttributedString alloc] initWithString: string attributes:@{NSParagraphStyleAttributeName : paragraphStyle ,NSFontAttributeName : cornerFont}];
    CGRect textBounds;
    textBounds.origin = CGPointMake(2.0, 2.0);
    textBounds.size  = [cornerText size];
    [cornerText drawInRect:textBounds];
    
    [self pushContextAndRoutateUpsideDown];
    [cornerText drawInRect:textBounds];
    UIGraphicsPopContext();
                                      
    
}
-(void) pushContextAndRoutateUpsideDown
{
    CGContextRef  context = UIGraphicsGetCurrentContext();
    UIGraphicsPushContext(context);
    CGContextTranslateCTM(context, self.bounds.size.width, self.bounds.size.height);
    CGContextRotateCTM(context, M_PI);
}
-(NSString *) rankAsString
{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"][self.rank];
    
}
-(void) setup
{
    //do something initialize
}
-(void) awakeFromNib
{
    [self setup];
}

-(id) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setup];
    return self;
}

-(void) setSuit:(NSString *)suit
{
    _suit = suit;
    [self setNeedsDisplay];
}
-(void) setIsFaceUp:(BOOL)isFaceUp
{
    _isFaceUp = isFaceUp;
    [self setNeedsDisplay];
}
-(void) setRank:(NSInteger)rank
{
    _rank = rank;
    [self setNeedsDisplay];
}
@end
