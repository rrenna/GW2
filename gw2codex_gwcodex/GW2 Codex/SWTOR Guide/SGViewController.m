//
//  SGViewController.m
//  SWTOR Guide
//
//  Created by Ryan Renna on 11-10-26.
//  Copyright (c) 2011 None. All rights reserved.
//

#import "SGViewController.h"

@implementation SGViewController

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];

    //Custom TitleBar
    NSString* title = [self title];
    if(!title) { title = @"G.W.2 Codex"; };
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 140, 30)];
    label.textAlignment = UITextAlignmentCenter;
    label.minimumFontSize = 14;
    label.adjustsFontSizeToFitWidth = YES;
	[label setFont:[UIFont fontWithName:@"HoeflerText-Black" size:18]];
	[label setBackgroundColor:[UIColor clearColor]];
        label.shadowOffset = CGSizeMake(0.5, 0.5);
	label.textColor = [UIColor colorWithWhite:1.0 alpha:1.0];
    label.shadowColor = [UIColor colorWithWhite:0.75 alpha:1.0];
	[label setText:title];
    
    self.navigationItem.titleView = label;
	[label release];
}

@end
