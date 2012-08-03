//
//  SGCharacterClassViewController.h
//  SWTOR Guide
//
//  Created by Ryan Renna on 11-09-04.
//  Copyright 2011 None. All rights reserved.
//

#import "SGEntityViewController.h"


@interface SGCharacterClassViewController : SGEntityViewController <UITableViewDataSource,UITableViewDelegate,BHTabsViewDelegate>
{
    //Overview
    IBOutlet UILabel* HeadlineLabel;
    IBOutlet UILabel* uniqueAttributeLabel;
    IBOutlet UILabel* uniqueAttributeEffectLabel;
    IBOutlet UITableView* weaponTypesTableView;
    
    //Special Abilities
    IBOutlet UIView* specialAbilityView;
    IBOutlet UILabel* specialAbilityLabel;
    
    //Progression
    IBOutlet UIView* progressionView;
    IBOutlet UILabel* sharedSkillTreeLabel;
    IBOutlet UILabel* sharedSkillTreeDescriptionLabel;
    IBOutlet UILabel* advancedClassALabel;
    IBOutlet UILabel* advancedClassADescriptionLabel;
    IBOutlet UILabel* advancedSkillTreeALabel;
    IBOutlet UILabel* advancedSkillTreeBLabel;
    IBOutlet UILabel* advancedSkillTreeADescriptionLabel;
    IBOutlet UILabel* advancedSkillTreeBDescriptionLabel;
    IBOutlet UILabel* advancedClassBLabel;
    IBOutlet UILabel* advancedClassBDescriptionLabel;
    IBOutlet UILabel* advancedSkillTreeCLabel;
    IBOutlet UILabel* advancedSkillTreeDLabel;
    IBOutlet UILabel* advancedSkillTreeCDescriptionLabel;
    IBOutlet UILabel* advancedSkillTreeDDescriptionLabel;
}
-(IBAction)sharedSkillTreeClick:(id)sender;
-(IBAction)advancedSkillTreeAClick:(id)sender;
-(IBAction)advancedSkillTreeBClick:(id)sender;
-(IBAction)advancedSkillTreeCClick:(id)sender;
-(IBAction)advancedSkillTreeDClick:(id)sender;
@end
