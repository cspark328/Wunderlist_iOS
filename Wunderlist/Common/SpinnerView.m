//
//  SpinnerView.m
//  Wunderlist
//
//  Created by Chan Soon Park on 12. 10. 2..
//  Copyright (c) 2012년 Chan Soon Park. All rights reserved.
//

#import "SpinnerView.h"

@implementation SpinnerView

- (id)init
{
    self = [super init];
    if (self) {
        UIActivityIndicatorView* indicatorView = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(-10, -10, 20, 20)];
        [indicatorView setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhite];
        [indicatorView startAnimating];
        [self addSubview:indicatorView];
        [indicatorView release];
    }
    return self;
}

- (void)setFrame:(CGRect)frame
{
    [super setFrame:CGRectMake(frame.origin.x, frame.origin.y, 0, 0)];
}

@end
