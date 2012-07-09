//
//  OpenSpringBoardVC.m
//  openspringboard
//
//  Created by Mobile Flow LLC on 2/21/11.
//  Copyright 2011 Mobile Flow LLC. All rights reserved.
//

#import "SGMenuViewController.h"
#import "SGEntityListingViewController.h"
#import "SGSearchViewController.h"
#import "ServerStatusViewController.h"
#import "SGNameGeneratorViewController.h"
#import "RootViewController.h"
#import "MDAboutController.h"
#import "MDACMochiDevStyle.h"

@interface SGMenuViewController ()
-(void)viewEntityNamed:(NSString*)entityType withTitle:(NSString*)entityTitle usingPredicate:(NSString*)predicateString;
@end

@implementation SGMenuViewController

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad 
{
    [super viewDidLoad];
    [menuScrollView addSubview:menuView];
    menuScrollView.contentSize = menuView.frame.size;
    
    newsButtonLabel.font = primaryFontOfSize(11.0);
    nameGeneratorButtonLabel.font = primaryFontOfSize(11.0);
    professionsButtonLabel.font = primaryFontOfSize(11.0);
    raceButtonLabel.font = primaryFontOfSize(11.0);
    zoneButtonLabel.font = primaryFontOfSize(11.0);
    warzoneButtonLabel.font = primaryFontOfSize(11.0);
    aboutButtonLabel.font = primaryFontOfSize(11.0);
    searchButtonLabel.font = primaryFontOfSize(11.0);
}
- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}
- (void)viewDidUnload {
    [newsButtonLabel release];
    newsButtonLabel = nil;
    [nameGeneratorButtonLabel release];
    nameGeneratorButtonLabel = nil;
    [professionsButtonLabel release];
    professionsButtonLabel = nil;
    [raceButtonLabel release];
    raceButtonLabel = nil;
    [zoneButtonLabel release];
    zoneButtonLabel = nil;
    [warzoneButtonLabel release];
    warzoneButtonLabel = nil;
    [aboutButtonLabel release];
    aboutButtonLabel = nil;
    [searchButtonLabel release];
    searchButtonLabel = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}
- (void)dealloc {
    [newsButtonLabel release];
    [nameGeneratorButtonLabel release];
    [professionsButtonLabel release];
    [raceButtonLabel release];
    [zoneButtonLabel release];
    [warzoneButtonLabel release];
    [aboutButtonLabel release];
    [searchButtonLabel release];
    [super dealloc];
}
#pragma mark - IBActions
-(IBAction)search:(id)sender
{
    SGSearchViewController* searchViewController = [[SGSearchViewController alloc] initWithNibName:@"SGSearchViewController" bundle:nil];
    [self.navigationController pushViewController:searchViewController animated:YES];
    [searchViewController release];
}
-(IBAction)info:(id)sender
{
    MDAboutController* aboutController = [[[MDAboutController alloc] initWithStyle: [MDACMochiDevStyle style]] autorelease];
    [aboutController removeLastCredit];
    
    [self.navigationController pushViewController:aboutController animated:YES];
}
-(IBAction)news:(id)sender
{
    RootViewController* newsViewController = [[RootViewController alloc] init];
    [self.navigationController pushViewController:newsViewController animated:YES];
    [newsViewController release];
}
-(IBAction)nameGenerator:(id)sender
{
    //Name generator
    [self.navigationController pushViewController:[[SGNameGeneratorViewController new] autorelease] animated:YES];
}
-(IBAction)classes:(id)sender
{
    //Classes
    [self viewEntityNamed:@"SGCharacterClass" withTitle:@"Classes" usingPredicate:@"SELF.isAdvancedClass == NO"];
}
-(IBAction)crewSkills:(id)sender
{
    //Crafting
    [self viewEntityNamed:@"SGCraftingSkill" withTitle:@"Crew Skills" usingPredicate:nil];
}
-(IBAction)zones:(id)sender
{
    //Planets
    [self viewEntityNamed:@"SGZone" withTitle:@"Zones" usingPredicate:nil];
}
-(IBAction)warzones:(id)sender
{
    [self viewEntityNamed:@"SGWarzone" withTitle:@"Warzones" usingPredicate:nil];
}
-(IBAction)races:(id)sender
{
    [self viewEntityNamed:@"SGRace" withTitle:@"Races" usingPredicate:nil];
}
-(IBAction)operations:(id)sender
{
    [self viewEntityNamed:@"SGOperation" withTitle:@"Operations" usingPredicate:nil];
}
-(IBAction)flashpoints:(id)sender
{
    [self viewEntityNamed:@"SGFlashpoint" withTitle:@"Flashpoints" usingPredicate:nil];
}
-(IBAction)dungeons:(id)sender
{
    [self viewEntityNamed:@"SGDungeon" withTitle:@"Dungeons" usingPredicate:nil];
}
-(IBAction)serverStatus:(id)sender
{
    //Server Status
    [self.navigationController pushViewController:[[ServerStatusViewController new] autorelease] animated:YES];
}
#pragma mark - Private methods
-(void)viewEntityNamed:(NSString*)entityType withTitle:(NSString*)entityTitle usingPredicate:(NSString*)predicateString
{
    SGEntityListingViewController* entityListingViewController = [[SGEntityListingViewController alloc] initWithEntityName:entityType andTitle:entityTitle];
    entityListingViewController.entityPredicateString = predicateString;
    [self.navigationController pushViewController:entityListingViewController animated:YES];
    [entityListingViewController release];
}
#pragma mark - UIScrollView delegate methods
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if(scrollView.contentOffset.x >= 160)
    {
        [pageControl setCurrentPage:1];
    }
    else
    {
        [pageControl setCurrentPage:0];
    }
}
@end
