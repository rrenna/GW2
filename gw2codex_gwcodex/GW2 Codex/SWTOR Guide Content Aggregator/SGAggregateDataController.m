//
//  SGAggregateDataController.m
//  SWTOR Guide
//
//  Created by Ryan Renna on 11-09-03.
//  Copyright 2011 None. All rights reserved.
//

#import "SGAggregateDataController.h"
#import "SWTOR_Guide_Content_AggregatorAppDelegate.h"

@implementation SGAggregateDataController

//Factions
#define ALLEGIANCE_REPUBLIC @"Republic"
#define ALLEGIANCE_EMPIRE @"Sith Empire"
#define ALLEGIANCE_HUTT_CONTROLLED @"Controlled by the Hutts"
#define ALLEGIANCE_INDEPENDENT @"Independent"
#define ALLEGIANCE_NONE @"No Government"

//Zones 
#define UNKNOWN_ZONE @"Unknown"
#define RATA_SUM @"Rata Sum"
#define DIVINITYS_REACH @"Divinity's Reach"
#define BLACK_CITIDEL @"Black Citidel"
#define THE_GROVE @"The Grove"
#define WAYFARER_FOOTHILLS @"Wayfarer Foothills"

//Race Names
#define HUMAN @"Human"
#define ASURA @"Asura"
#define CHARR @"Charr"
#define NORN @"Norn"
#define SYLVARI @"Sylvari"

//NPC-only

//Profession Names
#define MESMER @"Mesmer"
#define ELEMENTALIST @"Elementalist"
#define GUARDIAN @"Guardian"
#define NECROMANCER @"Necromancer"
#define RANGER @"Ranger"
#define THIEF @"Thief"
#define WARRIOR @"Warrior"
#define ENGINEER @"Engineer"

//Skill Trees
#define COMBAT_MEDIC @"Combat Medic"
#define BALANCE @"Balance"
#define TELEKINETICS @"Telekinetics"
#define SEER @"Seer"
#define INFILTRATION @"Infiltration"
#define KINETIC_COMBAT @"Kinetic Combat"
#define FOCUS @"Focus"
#define VIGILANCE @"Vigilance"
#define DEFENSE @"Defense"
#define WATCHMAN @"Watchman"
#define COMBAT @"Combat"
#define DIRTY_FIGHTING @"Dirty Fighting"
#define SABOTEUR @"Saboteur"
#define SHARPSHOOTER @"Sharpshooter"
#define SAWBONES @"Sawbones"
#define SCRAPPER @"Scrapper"
#define ASSAULT_SPECIALIST @"Assault Specialist"
#define GUNNERY @"Gunnery"
#define TACTICS @"Tactics"
#define SHIELD_SPECIALIST @"Shield Specialist"
#define PYROTECH @"Pyrotech"
#define ARSENAL @"Arsenal"
#define BODYGUARD @"Bodyguard"
#define SHIELD_TECH @"Shield Tech"
#define ADVANCED_PROTOTYPE @"Advanced Prototype"
#define LETHALITY @"Lethality"
#define CONCEALMENT @"Concealment"
#define MARKSMANSHIP @"Marksmanship"
#define ENGINEERING @"Engineering"
#define RAGE @"Rage"
#define VENGEANCE @"Vengeance"
#define IMMORTAL @"Immortal"
#define ANNIHILATION @"Annihilation"
#define CARNAGE @"Carnage"
#define MADNESS @"Madness"
#define DECEPTION @"Deception"
#define DARKNESS @"Darkness"
#define LIGHTNING @"Lightning"
#define CORRUPTION @"Corruption"
#define MEDICINE @"Medicine"

//Crafting Skill Types
#define CRAFTING_TYPE @"Crafting"
#define GATHERING_TYPE @"Gathering"
#define MISSION_TYPE @"Mission"

//Mounts


-(void)addClasses
{
    id(^addClass)(NSString*,NSString*) = ^(NSString* name,NSString* allegiance) 
    {
        id characterClass = [NSEntityDescription insertNewObjectForEntityForName:@"SGCharacterClass" inManagedObjectContext:moc];
        [characterClass setValue:name forKey:@"Name"];
        [characterClass setValue:allegiance forKey:@"Allegiance"];
        [characterClass setValue:[NSString stringWithFormat:@"classPreview_%@",[name stringByReplacingOccurrencesOfString:@" " withString:@""]] forKey:@"PreviewBackgroundFilename"];
        [classes setObject :characterClass forKey:name];
        return characterClass;
    };
    
    //Mesmer
    id mesmer = addClass(MESMER,ALLEGIANCE_REPUBLIC);
    [mesmer setValue:@"Mesmers are magical duelists who rely on deception and confusion to keep their opponents in check. Indecision is their greatest ally. Using powerful illusions to distract, they make sure they never go toe to toe with an enemy; they use their powers and tactics to set up an unfair fight. Just when you think you've figured out what the mesmer is doing, illusions begin to shatter, clones start to fade away, and you realize you've been swinging at empty air all along. It's hard to keep your eye on the real mesmer." forKey:@"Description"];
    [mesmer setValue:@"When I'm done with you, you won't trust your own mind." forKey:@"Headline"];
    
    id engineer = addClass(ENGINEER,ALLEGIANCE_REPUBLIC);
    [engineer setValue:@"Masters of mechanical mayhem, engineers tinker with explosives, gadgets, elixirs, and all manner of deployable devices. They can take control of an area by placing turrets, support their allies with alchemic weaponry, or lay waste to foes with a wide array of mines, bombs, and grenades." forKey:@"Description"];
    [engineer setValue:@"I'd explain it all to you, but a demonstration would be more useful." forKey:@"Headline"];
    
    id thief = addClass(THIEF,ALLEGIANCE_REPUBLIC);
    [thief setValue:@"A master of stealth and surprise, the thief is deadly in single combat—particularly when catching enemies off guard. Thieves compensate for their relatively low armor and health by being quick and evasive. They can move through the shadows, vanish into thin air, or steal items from their opponents and use them as weapons. Enemies should watch their backs, or the thief will watch it for them." forKey:@"Description"];
    [thief setValue:@"I'm sorry, did this belong to you?" forKey:@"Headline"];
    
    id guardian = addClass(GUARDIAN,ALLEGIANCE_REPUBLIC);
    [guardian setValue:@"The guardian is a devoted fighter who calls upon powerful virtues to smite enemies and protect allies. As dangerous with a staff as he is with a mighty two-handed hammer, a true guardian is a master tactician who knows when to sacrifice his own defenses to empower his allies to achieve victory." forKey:@"Description"];
    [guardian setValue:@"I'll guard you. Let them come through ME first!" forKey:@"Headline"];
    
    id necromancer = addClass(NECROMANCER,ALLEGIANCE_REPUBLIC);
    [necromancer setValue:@"A necromancer is a practitioner of the dark arts who summons the dead, wields the power of lost souls, and literally sucks the lifeblood of the enemy. A necromancer feeds on life force, which he can use to cheat death or bring allies back from the brink." forKey:@"Description"];
    [necromancer setValue:@"The great thing about minions is that they never las long enough to work up a horrid stench." forKey:@"Headline"];
    
    id ranger = addClass(RANGER,ALLEGIANCE_REPUBLIC);
    [ranger setValue:@"The ranger is a jack-of-all-trades and a master of them all as well, relying on his keen eye, steady hand, or the power of nature itself. A master of ranged combat, the ranger is capable of striking unwitting foes from a distance with his bow. With a stable of pets at his command, a ranger can adapt to his opponents' strengths and weaknesses." forKey:@"Description"];
    [ranger setValue:@"Good dog! Hold the enemy down while I shoot them! You get a biscuit!" forKey:@"Headline"];

    
    id warrior = addClass(WARRIOR,ALLEGIANCE_REPUBLIC);
    [warrior setValue:@"The warrior is a master of weapons who relies on speed, strength, toughness, and heavy armor to survive in battle. A warrior can shrug off blow after blow to stay in the fight, all the while building up adrenaline to fuel his offense." forKey:@"Description"];
    [warrior setValue:@"Axe or Mace? Rifle or Greatsword? You know, they're all good." forKey:@"Headline"];
    
    id elementalist = addClass(ELEMENTALIST,ALLEGIANCE_REPUBLIC);
    [elementalist setValue:@"The elementalist channels natural forces of destruction, making fire, air, earth, and water do her bidding. What the elementalist lacks in physical toughness, she makes up for in her ability to inflict massive damage in a single attack, dropping foes from a distance before they can become a threat. Yet, despite her incredible offensive potential, versatility is what makes the elementalist truly formidable." forKey:@"Description"];
    [elementalist setValue:@"Fire, Air, Earth, and Water. I can deal death with any of them." forKey:@"Headline"];
    
    

    
    /*
    id vanguard = addClass(VANGUARD,ALLEGIANCE_REPUBLIC);
    [vanguard setValue:@"Unstoppable and utterly fearless, Vanguards are the first and best line of defense in the Republic Military." forKey:@"Headline"];
    [vanguard setValue:[NSNumber numberWithBool:YES] forKey:@"isAdvancedClass"];
    [vanguard setValue:[NSNumber numberWithBool:NO] forKey:@"Searchable"];
    
    id commando = addClass(COMMANDO,ALLEGIANCE_REPUBLIC);
    [commando setValue:@"Trained in advanced assault tactics and weaponry, Commandos charge into battle with massive assault cannons, overwhelming their enemies with brute firepower." forKey:@"Headline"];
    [commando setValue:[NSNumber numberWithBool:YES] forKey:@"isAdvancedClass"];
    [commando setValue:[NSNumber numberWithBool:NO] forKey:@"Searchable"];
    
    [trooper addAdvancedClassesObject:vanguard];
    [trooper addAdvancedClassesObject:commando];
    */
}
-(void)addRacesAndClasses
{
    id(^addRace)(NSString*,NSString*) = ^(NSString* name,NSString* description)
    {
        id race = [NSEntityDescription insertNewObjectForEntityForName:@"SGRace" inManagedObjectContext:moc];
        [race setValue:name forKey:@"Name"];
        [race setValue:description forKey:@"Description"];
        [race setValue:[NSNumber numberWithBool:NO] forKey:@"Searchable"];
        [races setObject:race forKey:name];
        
        [race setValue:[NSString stringWithFormat:@"racePreview_%@",[name stringByReplacingOccurrencesOfString:@" " withString:@""]] forKey:@"PreviewBackgroundFilename"];
        return race;
    };
    void(^addRaceToClass)(id,NSString*) = ^(id race,NSString* className) 
    {
        [race setValue:[NSNumber numberWithBool:NO] forKey:@"NPCOnly"];
        id characterClass = [classes objectForKey:className];
        [race addClassesObject:characterClass];
    };
    
    //Player Races
    //Human
    id human = addRace(HUMAN,@"The humans of Tyria are an embattled race. Over the past three hundred years, they have lost much of their territory. Old enemies and new races threaten traditional human lands on all sides. Yet the human race survives, defending their remaining lands and maintaining the human spirit as they have for centuries. Their greatest city, Divinity's Reach, shines as a beacon of hope for the people of Kryta and beyond – even those dwelling deep within charr territory. The human legends are indelibly imprinted on the souls of all the races of Tyria, be they friend or foe.");
    
    [human setValue:@"...we fight for our homes, our Gods, and our Queen. Nothing can break our spirit." forKey:@"Headline"];
    
    id asura = addRace(ASURA,@"They may be short in stature, but this subterranean race of magical inventors are intellectual giants. These incredibly intelligent beings use their knowledge and skill with magic and crafting to assert their natural dominance. In the world of the asura, it is not the strong who survive, but the clever. Other races believe they should rule by virtue of their power and strength, but they delude themselves. All will serve the asura – in due time...");
    
    [asura setValue:@"Brain, not brawn, will change the world." forKey:@"Headline"];
    
    id charr = addRace(CHARR,@"The feline charr of Tyria are a victorious race challenged by their own success. They have survived defeat, oppression, and civil war. They have returned, reconquered, and rebuilt their original homes. Their mighty fortress, the Black Citadel, dominates the surrounding ruins of the human city of Rin, and their non-magical technology is the mightiest in the land. Yet despite their success, they are challenged by divisions among their people, the power of the Elder Dragons, and the ghosts of their own victories.");
    
    [charr setValue:@"With the roar of engines and thunder of guns, we rip each day from life's teeth." forKey:@"Headline"];

    id norn = addRace(NORN,@"The norn are a race of valiant, shape-changing barbarians. Boisterous, strong-willed, and passionate, the norn are an independent people that swear fealty to no single being. They thrive in their mountain stronghold by the sharpness of their senses, the quickness of their wits, and the strength of their massive forearms. They are guided in this world by their Spirits of the Wild, who embody the virtues of the mightiest beasts. As a people, they are quick to anger, even quicker to smile, and treat each new day as a personal challenge. They drink and feast and hunt with equal gusto, and fear few things. They are steadfast allies and implacable foes.");
    
    [norn setValue:@"If you are bold enough, your legend will live forever." forKey:@"Headline"];

    id sylvari = addRace(SYLVARI,@"Long ago, a weary soldier planted a strange seed in the depths of the Maguuma Jungle. For centuries, the Pale Tree grew, branches arching over the forest, until at last--twenty five years ago--it bloomed, and the Firstborn stepped into the world. They were followed by their brethren, season after season of sylvari, wide-eyed with wonder and searching for purpose in this strange land. Shaped first by the Dream that nurtured them before they awakened, the sylvari now travel Tyria seeking adventure and their place in the world...");
    
    [sylvari setValue:@"Evil threatens Tyria, but our Dream will guide us through darkness... to dawn." forKey:@"Headline"];

    //NPC-ONLY Races
    //
}
-(void)addZones
{
    id(^addZone)(NSString*) = ^(NSString* name) 
    {
        id planet = [NSEntityDescription insertNewObjectForEntityForName:@"SGZone" inManagedObjectContext:moc];
        [planet setValue:name forKey:@"Name"];
        [planet setValue:[NSString stringWithFormat:@"zonePreview_%@",[name stringByReplacingOccurrencesOfString:@" " withString:@""]] forKey:@"PreviewBackgroundFilename"];
        [locations setObject:planet forKey:name];
        return planet;
    };
    void(^addStartingRace)(id,NSString*) = ^(id zone,NSString* name)
    {
        id race = [races objectForKey:name];
        if(race)
        {
            [zone setStartingRace:race];
        }
    };
         
    //Unknown Zone - used when the zone an entry is on is annonymous/unknown
    //re-add if needed
    /*
    id unknownPlanet = addZone(UNKNOWN_ZONE);
    [unknownPlanet setValue:@"Unknown" forKey:@"Terrain"];
    [unknownPlanet setValue:@"Unknown" forKey:@"Description"];
    [unknownPlanet setValue:[NSNumber numberWithBool:NO] forKey:@"Searchable"];
    */
    
    id rataSum = addZone(RATA_SUM);
    [rataSum setValue:@"Floating City" forKey:@"Terrain"];
    [rataSum setValue:@"The greatest physical example of asuran magical mastery is their mighty city, Rata Sum. " forKey:@"Status"];
    [rataSum setValue:@"Starting with no more than a set of scattered ruins belonging to a failed race, the asura erected a testament to their power. Now dominating the surrounding area, Rata Sum is a huge floating cube riddled with interior passages, its upper reaches divided into smaller cubes. The highest locations are the labs and meeting rooms of the Arcane Council, the rulers of the asura race. The depths of this great cube are still being excavated by unsleeping golem servitors.\n\nAsura think of themselves as individuals, each protecting his or her creations jealously, but there are several organizations that bind the race together. The most important of these is the Arcane Council, which is, in theory, a collection of wise asura who enforce the laws of the people. In reality, this group consists of those who are not wise enough to get out of the task, as most asura would rather be pursuing their own creative agendas as opposed to dealing with internal squabbling and bureaucratic rivalries.\n\nRata Sum is also the home of the colleges of the asura people: the Colleges of Statics, Dynamics, and Synergetics. Each has a major complex where promising students, apprentices, and journeymen without their own labs can work, advance their knowledge, and attract better-established mentors. Each of the colleges has its own approach to the Eternal Alchemy. Those of Statics tend to think of the world in lines of force and support—as a fixed state—and seek to learn from the lost lessons of the past. Those of Dynamics perceive the world in an active, ever-changing state, and feel that any experiment you can walk away from is a success. Lastly, those of Synergetics think in terms of the connections between things, in the space between beats. They are the most mystic and theoretical of their people.\n\nRata Sum is the central hub, but the asura have spread their laboratories and research facilities throughout the Tarnished Coast. The personalized nature of creation and the drive to prove themselves the best at their craft often send asuran masters and their krewes into the hinterlands, away from prying eyes and potential competitors. Often, this means that labs are built in particularly remote or dangerous areas. Should a lab be destroyed or its workers slain, new discoveries may be completely lost. Asura curse such events, but neighboring races do not think this is a particularly bad thing." forKey:@"Description"];
    addStartingRace(rataSum,ASURA);
    
    id divinityReach = addZone(DIVINITYS_REACH);
    [divinityReach setValue:@"Capital City" forKey:@"Terrain"];
    [divinityReach setValue:@"Humanity's greatest city is Divinity's Reach, founded in the wake of the flooding of Lion's Arch." forKey:@"Status"];
    [divinityReach setValue:@"Built upon ancient Krytan tombs and situated on a bluff, the city provides a strong bastion against a dangerous world. Survivors of the other human nations and refugees from distant lands have poured into Divinity's Reach, swearing fealty to the crown and creating a proud, beautiful city.\n\nThe city is laid out like a great wheel with six spokes. These spokes are elevated high roads which reach from the outer walls to the Central Plaza at the city's hub. It is here that a great orrery spins beneath a massive dome of copper and glass, here that the ministers squabble, and here that Queen Jennah rules with a confident hand." forKey:@"Description"];
    addStartingRace(divinityReach,HUMAN);
    
    id wayfarerFoothills = addZone(WAYFARER_FOOTHILLS);
    [wayfarerFoothills setValue:@"Hill Settlement" forKey:@"Terrain"];
    [wayfarerFoothills setValue:@"The norn around Hoelbrak have established the Wayfarer Foothills as their primary hunting grounds." forKey:@"Status"];
    [wayfarerFoothills setValue:@"Further north, there lies a treacherous landscape of frozen fields and icy crags corrupted by the Sons of Svanir, norn who revere the Elder Dragon Jormag.\n\nThe Wayfarer Foothills is the first area visited by newly created norn characters and is located next to Hoelbrak. Shrines for the four Spirits of the Wild are located in this area, some of which are threatened by attacks from either the dredge or Sons of Svanir. Each shrine holds a unique event." forKey:@"Description"];
    addStartingRace(wayfarerFoothills,NORN);
    
    id blackCitidel = addZone(BLACK_CITIDEL);
    [blackCitidel setValue:@"Capital City" forKey:@"Terrain"];
    [blackCitidel setValue:@"Upon the overthrow of the Flame Legion, the Iron Legion was granted control of the conquered kingdom of Ascalon by the other victorious legions. They built their main fortress-city, the Black Citadel, on the human ruins of Rin." forKey:@"Status"];
    [blackCitidel setValue:@"The wreckage of that destroyed city can still be seen among the foundations of the citadel. While the Iron Legion is officially in charge, Blood and Ash Legions both have a major presence in the city.\n\nAs the Iron Legion is the most technologically skilled of the charr legions, its city is a vast foundry and center of industry. The Black Citadel is dominated by the huge Imperator's Core, a great spherical structure that houses the headquarters of the three legions, the offices of the tribunes, and the war council, where the legions meet to plan strategy. The Iron Legion Imperator, Smodur the Unflinching, oversees all of this and coordinates the charr in Ascalon with a veteran's eye." forKey:@"Description"];
    addStartingRace(blackCitidel,CHARR);
    
    id theGrove = addZone(THE_GROVE);
    [theGrove setValue:@"Tree City" forKey:@"Terrain"];
    [theGrove setValue:@"The Pale Tree now dominates the Tarnished Coast, her towering top higher than many mountains. In the shelter of her lush foliage, the sylvari have made their homes." forKey:@"Status"];
    [theGrove setValue:@"The Grove, created by the Pale Tree, is a multilevel, verdant, organic city. The roots and branches of the tree form broad terraces where other plants have grown and been spun into homes and buildings. Some of the sylvari have lived their entire lives beneath the tree, but most choose to wander, to adventure, and to let the Dream take them where it may.\n\nThe sylvari are divided into houses or cycles, and feel that an individual's personality is determined by time of day when they awaken. The sylvari born in the Cycle of Dawn tend to be loquacious and diplomatic. Those of the Cycle of Day are often problem-solvers, meeting challenges head-on. The sylvari of the Cycle of Dusk tend to be intelligent and reflective. And those of the Cycle of Night are quiet, secretive, and keep their own counsel.\n\nThe firstborn are the closest thing the sylvari have to rulers, yet the respect they command comes solely from their wisdom and time spent in the world. Each cycle is advised by one of the firstborn who serves as a luminary, as a guide and tutor, to the newly awakened. Yet the ultimate ruler of the people is their parent, the Pale Tree herself. Her song is found in all sylvari, and those who seek understanding travel to the heart of the tree to commune with her and seek her wisdom." forKey:@"Description"];
    addStartingRace(theGrove,SYLVARI);
}
-(void)addWarzones
{
    id(^addWarzone)(NSString*,NSString*) = ^(NSString* name,NSString* type)
    {
        id warzone = [NSEntityDescription insertNewObjectForEntityForName:@"SGWarzone" inManagedObjectContext:moc];
        [warzone setValue:name forKey:@"Name"];
        [warzone setValue:type forKey:@"type"];
        [warzone setValue:[NSString stringWithFormat:@"warzonePreview_%@",[name stringByReplacingOccurrencesOfString:@" " withString:@""]] forKey:@"PreviewBackgroundFilename"];
        [warzones setObject:warzone forKey:name];
        return warzone;
    };
    
    id battleOfKyhlo = addWarzone(@"Battle of Kyhlo",@"Conquest");
    [battleOfKyhlo setValue:@"Battle of Kyhlo is a structured PvP map. It is a conquest map with three capture points and siege weapons as the secondary mechanic." forKey:@"Terrain"];
    [battleOfKyhlo setValue:@"Two teams of five players are matched up against each other. The objective is to be the first team to reach 500 points. Points are awarded through holding capture points and kills. There are 3 capture points on the map, and when captured, each location grants one point every two seconds. Each player kill grants five points. If neither team reaches 500 points, the team with the most points will be declared the winner after the 15 minute time limit. The average time for a game is 8-13 minutes, depending on the balance of the teams contesting." forKey:@"Description"];
    
    id forestOfNiflhel = addWarzone(@"Forest of Niflhel",@"Conquest");
    [forestOfNiflhel setValue:@"Forest of Niflhel is a structured PvP map. It is a conquest map with three capture points and powerful NPC monsters as the secondary mechanic." forKey:@"Terrain"];
    [forestOfNiflhel setValue:@"Two teams are matched up against each other. The objective is to be the first team to reach 500 points. Points are awarded through holding capture points and kills. There are 3 capture points on the map, and when captured, each location grants one point every two seconds. Each player kill grants five points. If neither team reaches 500 points, the team with the most points will be declared the winner after the 15 minute time limit." forKey:@"Description"];
    
    
    id siege = addWarzone(@"Siege",@"Conquest");
    [siege setValue:@"Siege is an upcoming structured PvP conquest map." forKey:@"Terrain"];
    [siege setValue:@"" forKey:@"Description"];
    //TODO: Improve description, update row preview image
    
    id brand =  addWarzone(@"Brand",@"Conquest");
    [brand setValue:@"Brand is an upcoming structured PvP map. It is a conquest map based in the Dragonbrand game area." forKey:@"Terrain"];
    [brand setValue:@"Two teams of five players are matched up against each other. The objective is to be the first team to reach 500 points. Points are awarded through holding capture points and kills. There are 3 capture points on the map, and when captured, each location grants one point every two seconds. Each player kill grants five points. If neither team reaches 500 points, the team with the most points will be declared the winner after the 15 minute time limit. The average time for a game is 8-13 minutes, depending on the balance of the teams contesting." forKey:@"Description"];
}
-(void)addLocations
{
    id(^addLocation)(NSString*) = ^(NSString* name) 
    {
        id location = [NSEntityDescription insertNewObjectForEntityForName:@"SGLocation" inManagedObjectContext:moc];
        [location setValue:name forKey:@"Name"];
        [location setValue:[NSString stringWithFormat:@"locationPreview_%@",[name stringByReplacingOccurrencesOfString:@" " withString:@""]] forKey:@"PreviewBackgroundFilename"];
        [location setValue:[NSNumber numberWithBool:NO] forKey:@"Searchable"];
        
        [locations setObject:location forKey:name];
        return location;
    };
    
    //The Voidstar
    id theVoidstar = addLocation(@"The Voidstar");
    [theVoidstar setValue:@"Forests, Hills and Snow-Capped Mountains" forKey:@"Terrain"];
}
-(void)addMounts
{
    id(^addMount)(NSString*,NSString*,NSString*,NSString*) = ^(NSString* name,NSString* className,NSString* manufacturer,NSString* model)
    {
        id ship = [NSEntityDescription insertNewObjectForEntityForName:@"SGShip" inManagedObjectContext:moc];
        id characterClass = [classes objectForKey:className];
        
        [ship setValue:name forKey:@"Name"];
        [ship setValue:manufacturer forKey:@"manufacturer"];
        [ship setValue:model forKey:@"model"];
        
        [ship setValue:[NSString stringWithFormat:@"starshipPreview_%@",[name stringByReplacingOccurrencesOfString:@" " withString:@""]] forKey:@"PreviewBackgroundFilename"];
        [ship addCharacterClassesObject:characterClass];
        [ships setObject:ship forKey:name];
        
        return ship;
    };
    void(^addCharacterClassToShip)(id,NSString*) = ^(id ship,NSString* className) 
    {
        id characterClass = [classes objectForKey:className];
        [ship addCharacterClassesObject:characterClass];
    };
}
-(void)addSkillTrees
{
    id(^addSkillTree)(NSString*,NSString*,NSString*) = ^(NSString* name,NSString* description,NSString* class) 
    {
        id skillTree = [NSEntityDescription insertNewObjectForEntityForName:@"SGSkillTree" inManagedObjectContext:moc];
        [skillTree setValue:name forKey:@"Name"];
        [skillTree setValue:description forKey:@"Description"];
        [skillTree setValue:[NSNumber numberWithBool:YES] forKey:@"Searchable"];
        
        id characterClass = [classes objectForKey:class];
        [characterClass addSkillTreesObject: skillTree];
        
        [skillTrees setObject:skillTree forKey:name];
        [skillTree setValue:@"skillTreeRowPreview" forKey:@"PreviewBackgroundFilename"];
        return skillTree;
    };
}
#define INSTANT @"Instant"
#define PASSIVE @"Passive"
-(void)addCharacterSkills
{
    id(^addCharacterSkillOLD)(NSString*,NSString*,NSString*,NSString*) = ^(NSString* name,NSString* type,NSString* tree,NSString* headline) 
    {
        id characterSkill = [NSEntityDescription insertNewObjectForEntityForName:@"SGCharacterSkill" inManagedObjectContext:moc];
        [characterSkill setValue:name forKey:@"Name"];
        [characterSkill setValue:headline forKey:@"Description"];
        [characterSkill setValue:type forKey:@"Type"];
        [characterSkill setValue:[NSNumber numberWithBool:NO] forKey:@"Searchable"];
        [characterSkill setValue:[NSNumber numberWithInt:1] forKey:@"tier"];
        
        id skillTree = [skillTrees objectForKey:tree];
        [skillTree addSkillsObject:characterSkill];
        
        //[craftingSkill setValue:[NSString stringWithFormat:@"craftingSkillPreview_%@",[name stringByReplacingOccurrencesOfString:@" " withString:@""]] forKey:@"PreviewBackgroundFilename"];
        return characterSkill;
    };
    
    id(^addCharacterSkill)(NSString*,NSString*,NSString*,NSString*,int) = ^(NSString* name,NSString* type,NSString* tree,NSString* headline,int tier) 
    {
        id characterSkill = [NSEntityDescription insertNewObjectForEntityForName:@"SGCharacterSkill" inManagedObjectContext:moc];
        [characterSkill setValue:name forKey:@"Name"];
        [characterSkill setValue:headline forKey:@"Description"];
        [characterSkill setValue:type forKey:@"Type"];
        [characterSkill setValue:[NSNumber numberWithBool:NO] forKey:@"Searchable"];
        [characterSkill setValue:[NSNumber numberWithInt:tier] forKey:@"tier"];
        
        id skillTree = [skillTrees objectForKey:tree];
        [skillTree addSkillsObject:characterSkill];

        return characterSkill;
    };
    
    
}
-(void)addCraftingSkill
{
     id(^addCraftingSkill)(NSString*,NSString*,NSString*,NSString*) = ^(NSString* name,NSString* result,NSString* headline,NSString* type) 
     {
         id craftingSkill = [NSEntityDescription insertNewObjectForEntityForName:@"SGCraftingSkill" inManagedObjectContext:moc];
         [craftingSkill setValue:name forKey:@"Name"];
         [craftingSkill setValue:result forKey:@"Result"];
         [craftingSkill setValue:type forKey:@"Type"];
         [craftingSkill setValue:headline forKey:@"Headline"];

         [craftingSkill setValue:[NSString stringWithFormat:@"craftingSkillPreview_%@",[name stringByReplacingOccurrencesOfString:@" " withString:@""]] forKey:@"PreviewBackgroundFilename"];
         return craftingSkill;
     };
    
    void(^addAvaliableClassesToSkill)(id,NSArray*) = ^(id skill,NSArray* classNames) 
    {
        NSMutableSet* avaliableClasses = [NSMutableSet new];
        for(NSString* className in classNames)
        {
            [avaliableClasses addObject:[classes objectForKey:className]];
        }
        
        [skill setValue:avaliableClasses forKey:@"characterClasses"];
    };

        
}
-(IBAction)aggregate:(id)sender
{
    SWTOR_Guide_Content_AggregatorAppDelegate* delegate = [SWTOR_Guide_Content_AggregatorAppDelegate delegate];
    moc = [delegate managedObjectContext];
    //
    ships = [NSMutableDictionary new];
    classes = [NSMutableDictionary new];
    skillTrees = [NSMutableDictionary new];
    locations = [NSMutableDictionary new];
    races = [NSMutableDictionary new];
    warzones = [NSMutableDictionary new];
    
    [self addClasses];
    [self addLocations];
    [self addRacesAndClasses];
    [self addZones];
    [self addWarzones];
    [self addMounts];
    [self addSkillTrees];
    [self addCharacterSkills];
    [self addCraftingSkill];
    
    NSError* error = nil;
    
    [moc save:&error];
    NSLog(@"%@",error);
}
@end
