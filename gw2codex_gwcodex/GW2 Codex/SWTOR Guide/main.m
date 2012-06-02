//
//  main.m
//  SWTOR Guide
//
//  Created by Ryan Renna on 11-08-26.
//  Copyright (c) 2011 None. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Parse/Parse.h"
#import "SGAppDelegate.h"

int main(int argc, char *argv[])
{
    //Register PARSE app id
    #ifdef DEBUG
    [Parse setApplicationId:@"RU2UnR50VbUXZzAlsuBFkGjSXjIB8Qz202pNo6Zm" 
                  clientKey:@"lCEtLpF30NJJRn2wu9EEmLHttnTBEPAqVrRVJw4N"];
    #else
    [Parse setApplicationId:@"DV1wkHX7HyozSoBn9gSefenrn5RK9Ze9lmzVavtY" 
                  clientKey:@"v8mmoLobkEfTv3P6benNDZe3JeyDQcoVOLEtssFr"];
    #endif
    //Register for Parse-Facebook hook
    [PFFacebookUtils initializeWithApplicationId:@"211307358977071"];
    
	NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    int retVal = UIApplicationMain(argc, argv, nil, nil);
    [pool release];
    return retVal;
}
