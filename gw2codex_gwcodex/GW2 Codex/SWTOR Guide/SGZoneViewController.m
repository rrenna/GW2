//
//  SGPlanetViewController.m
//  SWTOR Guide
//
//  Created by Ryan Renna on 11-09-03.
//  Copyright 2011 None. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "SGAppDelegate.h"
#import "SGZoneViewController.h"
#import "SGEntityViewController.h"

@implementation SGZoneViewController
#pragma mark - Class methods
+(void)load
{
    [super load];
    [SGAppDelegate registerSelf:self asViewerForEntityNamed:@"SGZone"];
}
#pragma mark - Class methods
#pragma mark - View lifecycle
-(id)initWithEntity:(id)entity
{
    self = [super initWithEntity:entity andXibName:@"SGZoneViewController"];
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //[tabView addTabNamed:@"Items" selected:NO];

    //Set font of Description text - allows for defaulting to system font on older iOS devices
    AllegianceLabel.font = primaryFontOfSize(13.0);
    StatusLabel.font = primaryFontOfSize(13.0);
    RegionLabel.font = primaryFontOfSize(13.0);
    TerrainLabel.font = primaryFontOfSize(13.0);
    
    //NameLabel.text = [_entity valueForKey:@""] //NOT NEEDED (Name in title)
    AllegianceLabel.text = [_entity valueForKey:@"Allegiance"];
    StatusLabel.text = [_entity valueForKey:@"Status"];
    RegionLabel.text = [_entity valueForKey:@"Region"];
    TerrainLabel.text = [_entity valueForKey:@"Terrain"];
    DescriptionLabel.text = [_entity valueForKey:@"Description"];
    
    int heightSaved = 0;
     //Remove starting classes table if no classes assigned
    id startingRace = [_entity valueForKey:@"startingRace"];
    if(!startingRace)
    {
        heightSaved += tableView.frame.size.height;
        tableView.hidden = YES;
    }
    
    heightSaved += resizeLabelToTopAlignmentReturningHeightReduced(TerrainLabel);
    
    //moveViewForSavedSpace(TerrainLabel, StatusLabel);
    heightSaved += resizeLabelToTopAlignmentReturningHeightReduced(StatusLabel);
    
    
    moveViewForSavedSpace(DescriptionLabel, heightSaved);
    heightSaved += resizeLabelToTopAlignmentReturningHeightReduced(DescriptionLabel);

    
    resizeContentSizeForSavedSpace(scrollView,heightSaved);
}
#pragma mark - BHTabsViewDelegate methods
- (void)didTapTabNamed:(NSString *)tabName
{
    [super didTapTabNamed:tabName];
    
    //Insert auxillary tabs here
    /*
    if([tabName isEqualToString:@"Items"])
    {
    }
    */
}
#pragma mark - UITableView Delegate & Datasource methods
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    id startingRace = [_entity valueForKey:@"startingRace"];
    if(startingRace)
    {
        SGEntityViewController* entityViewController = [[[SGAppDelegate viewerRegisteredForEntityNamed:@"SGRace"] alloc] initWithEntity:startingRace];
        
        [self.navigationController pushViewController:entityViewController animated:YES];
        [entityViewController release];
    }

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
#define CELL_HEIGHT 30
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return CELL_HEIGHT;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = nil;
    
        id startingRace = [_entity valueForKey:@"startingRace"];
        if(!startingRace)
        {
            //Return a "No starting classes" row
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
            
            cell.textLabel.textColor = [UIColor darkGrayColor];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:14];
            cell.textLabel.shadowOffset = CGSizeMake(0,1);
            cell.textLabel.shadowColor = [UIColor blackColor];
            cell.textLabel.textAlignment = UITextAlignmentCenter;
            cell.textLabel.text = @"No classes start in this Zone.";
        }
        else
        {
            CGRect cellRect = CGRectMake(0, 0, 320, CELL_HEIGHT);

            NSString* planetPreviewFilename = [startingRace valueForKey:@"PreviewBackgroundFilename"];
            UIImage* backgroundImage = [UIImage imageNamed:planetPreviewFilename];
            
            
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
            cell.textLabel.textColor = [UIColor colorWithRed:0.847 green:0.203 blue:0.192 alpha:1.0];
            cell.textLabel.font = [UIFont fontWithName:@"HoeflerText-Regular" size:12];
            cell.textLabel.textAlignment = UITextAlignmentLeft;
            cell.textLabel.text = [startingRace valueForKey:@"Name"];
            cell.selectionStyle = UITableViewCellSelectionStyleGray;
            
            
            UIImageView* backgroundImageView = [[[UIImageView alloc] initWithFrame:cellRect] autorelease];
            backgroundImageView.image = backgroundImage;
            backgroundImageView.contentMode = UIViewContentModeScaleAspectFit;
            backgroundImageView.backgroundColor = [UIColor whiteColor];
            cell.backgroundView = backgroundImageView;
            backgroundImageView.alpha = 0.8;
        }
  
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section;
{
    return [self dividerForTitle:@"Starting Race" withIconKey:@"Races"];
}
@end
