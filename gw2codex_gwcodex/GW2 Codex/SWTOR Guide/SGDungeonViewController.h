//
//  SGWarzoneViewController.h
//  SWTOR Guide
//
//  Created by Ryan Renna on 11-09-08.
//  Copyright 2011 None. All rights reserved.
//

#import "SGEntityViewController.h"

@interface SGDungeonViewController : SGEntityViewController <UITableViewDelegate,UITableViewDataSource>
{
    //Content View
    IBOutlet UILabel *difficultyLabel;
    IBOutlet UILabel *headlineLabel;
}
@end
