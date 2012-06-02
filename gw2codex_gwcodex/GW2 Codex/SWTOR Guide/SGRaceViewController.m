//
//  SGRaceViewController.m
//  GW2 Codex
//
//  Created by Ryan Renna on 2012-04-04.
//  Copyright (c) 2012 None. All rights reserved.
//

#import "SGRaceViewController.h"

@interface SGRaceViewController ()

@end

@implementation SGRaceViewController
#pragma mark - Class methods
+(void)load
{
    [super load];
    [SGAppDelegate registerSelf:self asViewerForEntityNamed:@"SGRace"];
}
#pragma mark - Class methods
#pragma mark - View lifecycle
-(id)initWithEntity:(id)entity
{
    self = [super initWithEntity:entity andXibName:@"SGRaceViewController"];
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Setup Overview Content
    HeadlineLabel.text = [_entity valueForKey:@"Headline"];
    DescriptionLabel.text = [_entity valueForKey:@"Description"];
    
    int heightSaved = 0;
    heightSaved += resizeLabelToTopAlignmentReturningHeightReduced(HeadlineLabel);
    moveViewForSavedSpace(DescriptionLabel, heightSaved);
    heightSaved += resizeLabelToTopAlignmentReturningHeightReduced(DescriptionLabel);
    resizeViewForSavedSpace(contentView, heightSaved);
    
    resizeContentSizeForSavedSpace(scrollView,heightSaved);
}
#pragma mark - UITableView delegate and datasource
#define CELL_HEIGHT 30
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
     id entity = [_entity valueForKey:@"startingZone"];
     if(entity)
     {
         SGEntityViewController* entityViewController = [[[SGAppDelegate viewerRegisteredForEntityNamed:@"SGZone"] alloc] initWithEntity:entity];
     
         [self.navigationController pushViewController:entityViewController animated:YES];
         [entityViewController release];
     }

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return CELL_HEIGHT;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = nil;
    
    id planet = [_entity valueForKey:@"startingZone"];
    CGRect cellRect = CGRectMake(0, 0, 320, CELL_HEIGHT);
    
    NSString* planetPreviewFilename = [planet valueForKey:@"PreviewBackgroundFilename"];
    UIImage* backgroundImage = [UIImage imageNamed:planetPreviewFilename];
    
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];

    cell.textLabel.textColor = [UIColor colorWithRed:0.847 green:0.203 blue:0.192 alpha:1.0];
    cell.textLabel.font = [UIFont fontWithName:@"HoeflerText-Regular" size:12];
    cell.textLabel.textAlignment = UITextAlignmentLeft;
    
    cell.textLabel.text = [planet valueForKey:@"Name"];
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    
    UIImageView* backgroundImageView = [[[UIImageView alloc] initWithFrame:cellRect] autorelease];
    backgroundImageView.image = backgroundImage;
    backgroundImageView.contentMode = UIViewContentModeScaleAspectFill;
    backgroundImageView.backgroundColor = [UIColor whiteColor];
    
    backgroundImageView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    backgroundImageView.clipsToBounds = YES;
    cell.backgroundView = backgroundImageView;
    backgroundImageView.alpha = 0.8;
        
    
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return HEIGHT_FOR_DIVIDER;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return nil;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView* header = nil;
    header = [self dividerForTitle:@"Starting Zone" withIconKey:@"Zones"];

    return header;
}
@end
