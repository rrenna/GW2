//
//  SGConstants.m
//  GW2 Codex
//
//  Created by Ryan Renna on 2012-06-05.
//  Copyright (c) 2012 None. All rights reserved.
//

#import "SGConstants.h"

@implementation SGConstants

UIFont* primaryFontOfSize(float size)
{
    if([[UIDevice currentDevice].systemVersion floatValue] < 5.00)
    {
        return [UIFont systemFontOfSize:size];
    }
    else
    {
        return [UIFont fontWithName:@"HoeflerText-Regular" size:size];
    }
    return nil;
}

@end
