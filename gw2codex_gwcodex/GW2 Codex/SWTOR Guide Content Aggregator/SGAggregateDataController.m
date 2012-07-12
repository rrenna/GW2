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

//Locations
#define UNKNOWN_LOCATION @"Unknown"

//Zones
#define RATA_SUM @"Rata Sum"
#define DIVINITYS_REACH @"Divinity's Reach"
#define BLACK_CITIDEL @"Black Citidel"
#define THE_GROVE @"The Grove"
#define WAYFARER_FOOTHILLS @"Wayfarer Foothills"
#define PLAINS_OF_ASHFORD @"Plains of Ashford"
#define METRICA_PROVINCE @"Metrica Province"
#define CALEDON_FOREST @"Caledon Forest"
#define FROSTGORGE_SOUND @"Frostgorge Sound"
#define MOUNT_MAELSTROM @"Mount Maelstrom"
#define FIREHEART_RISE @"Fireheart Rise"

//Regions
#define SHIVERPEAK_MOUNTAINS @"Shiverpeak Mountains"
#define MAGUUMA_JUNGLE @"Maguuma Jungle"
#define KRYTA @"Kryta"
#define ASCALON @"Ascalon"
#define RUINS_OF_ORR @"Ruins of Orr"
#define THE_MISTS @"The Mists"

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
    id(^addClass)(NSString*,NSString*,NSString*,NSString*) = ^(NSString* name,NSString* allegiance,NSString* uniqueSkill,NSString* uniqueSkillEffect)
    {
        id characterClass = [NSEntityDescription insertNewObjectForEntityForName:@"SGCharacterClass" inManagedObjectContext:moc];
        [characterClass setValue:name forKey:@"Name"];
        [characterClass setValue:uniqueSkill forKey:@"uniqueSkill"];
        [characterClass setValue:uniqueSkillEffect forKey:@"uniqueSkillEffect"];
        [characterClass setValue:allegiance forKey:@"Allegiance"];
        [characterClass setValue:[NSString stringWithFormat:@"classPreview_%@",[name stringByReplacingOccurrencesOfString:@" " withString:@""]] forKey:@"PreviewBackgroundFilename"];
        [classes setObject :characterClass forKey:name];
        return characterClass;
    };
    
    //Mesmer
    id mesmer = addClass(MESMER,ALLEGIANCE_REPUBLIC,@"Guile",@"Decreases recharge rate of shattering skills");
    [mesmer setValue:@"Mesmers are magical duelists who rely on deception and confusion to keep their opponents in check. Indecision is their greatest ally. Using powerful illusions to distract, they make sure they never go toe to toe with an enemy; they use their powers and tactics to set up an unfair fight. Just when you think you've figured out what the mesmer is doing, illusions begin to shatter, clones start to fade away, and you realize you've been swinging at empty air all along. It's hard to keep your eye on the real mesmer." forKey:@"Description"];
    [mesmer setValue:@"When I'm done with you, you won't trust your own mind." forKey:@"Headline"];
    [mesmer setValue:@"An illusion is a mind trick exclusive to mesmer profession, which manifest itself physically. They will only attack the target upon which they were summoned and cannot be directly controlled. Anyone can see or attack the mesmer's illusions. They can only exist for as long as that target is alive and can only be dispelled by attacking the illusion itself. A mesmer can maintain up to three illusions at a time, with the oldest illusion being replaced by the newly created one.\n\nThere are two kinds of illusions: clones and phantasms." forKey:@"specialAbilitiesDescription"];
    
    id engineer = addClass(ENGINEER,ALLEGIANCE_REPUBLIC,@"Ingenuity",@"Decreases recharge rate of tool belt skills");
    [engineer setValue:@"Masters of mechanical mayhem, engineers tinker with explosives, gadgets, elixirs, and all manner of deployable devices. They can take control of an area by placing turrets, support their allies with alchemic weaponry, or lay waste to foes with a wide array of mines, bombs, and grenades." forKey:@"Description"];
    [engineer setValue:@"I'd explain it all to you, but a demonstration would be more useful." forKey:@"Headline"];
    [engineer setValue:@"The tool belt is a special ability exclusive to the engineer profession. It enhances the effectiveness and functionality of the engineer's utility and heal skills. There are 4 tool belt skill slots which are activated using the keys F1-F4. Each of the skills equipped into the healing or utility skill bar slots fill one of these slots with a specialty skill. Examples are healing slot skills give a self heal in the tool belt. Turrets get an option for self-destruct.\n\nEvery healing and utility skill utilized by the engineer has an appropriate tool belt counterpart." forKey:@"specialAbilitiesDescription"];
    
        
    id thief = addClass(THIEF,ALLEGIANCE_REPUBLIC,@"Cunning",@"Decreases recharge rate of stealing");
    [thief setValue:@"A master of stealth and surprise, the thief is deadly in single combat—particularly when catching enemies off guard. Thieves compensate for their relatively low armor and health by being quick and evasive. They can move through the shadows, vanish into thin air, or steal items from their opponents and use them as weapons. Enemies should watch their backs, or the thief will watch it for them." forKey:@"Description"];
    [thief setValue:@"I'm sorry, did this belong to you?" forKey:@"Headline"];
    [thief setValue:@"Stealing is a mechanic unique to the thief profession, which doesn't break stealth. By using the steal skill, the character will shadow step to the enemy and steal an item from them. After an item has been stolen, it will be \"pocketed\" and replace your steal skill until used. Steal will begin to recharge immediately after activation, but is only available again after the stolen item is used.\n\nEach enemy in the game has a small pool of possible items to steal.[2] For example, a character may steal an egg from a moa and use it as a healing item, or steal feathers from it and use them to blind enemies. In PvP the stolen items are profession-specific, for example the thief can get a rifle or a hammer from a warrior, while an elementalist might have a scepter or a lava rock.\n\nStolen items from players are not actually taken from them; the thief just gains access to the associated steal skill." forKey:@"specialAbilitiesDescription"];
    
    id guardian = addClass(GUARDIAN,ALLEGIANCE_REPUBLIC,@"Willpower",@"Decreases recharge rate of virtues");
    [guardian setValue:@"The guardian is a devoted fighter who calls upon powerful virtues to smite enemies and protect allies. As dangerous with a staff as he is with a mighty two-handed hammer, a true guardian is a master tactician who knows when to sacrifice his own defenses to empower his allies to achieve victory." forKey:@"Description"];
    [guardian setValue:@"I'll guard you. Let them come through ME first!" forKey:@"Headline"];
    [guardian setValue:@"Virtues are special abilities exclusive to the guardian profession. These abilities apply continuous passive benefits to the guardian as that character adventures, or they can be activated as something similar to shouts, granting an immediate benefit to all nearby allies. Activating one of these virtues will disable its passive effect until that ability recharges once again. Each virtue has its own recharge so may be used independently of the others.\n\nThe benefits of the same virtues do not stack. Two guardians using the same virtue at the same time will not increase the effects of the virtue. Different virtues do not have this limitation.\n\nVirtues can be affected by guardian traits." forKey:@"specialAbilitiesDescription"];
    
    
    id necromancer = addClass(NECROMANCER,ALLEGIANCE_REPUBLIC,@"Hunger",@"Increases the life force pool");
    [necromancer setValue:@"A necromancer is a practitioner of the dark arts who summons the dead, wields the power of lost souls, and literally sucks the lifeblood of the enemy. A necromancer feeds on life force, which he can use to cheat death or bring allies back from the brink." forKey:@"Description"];
    [necromancer setValue:@"The great thing about minions is that they never las long enough to work up a horrid stench." forKey:@"Headline"];
    [necromancer setValue:@"Death Shroud is the necromancer's unique mechanic providing some passive benefits and replacing the necromancer's normal weapon skills with a fixed set of Death Shroud skills. It is fueled by life force and can be entered at any time, so long as there is any life force. Upon leaving Death Shroud, there is a 10-second cooldown before it can be used again.\n\nLife force is the necromancers resource that fuels Death Shroud. Life force is gained when foes die nearby and through certain skills. Death Shroud depletes life force and ends when it reaches zero. Life force capacity is increased by attribute Hunger. The life force bar (located above weapon and off-hand skills) displays life force level." forKey:@"specialAbilitiesDescription"];
    
    id ranger = addClass(RANGER,ALLEGIANCE_REPUBLIC,@"Empathy",@"Increases attributes of pet");
    [ranger setValue:@"The ranger is a jack-of-all-trades and a master of them all as well, relying on his keen eye, steady hand, or the power of nature itself. A master of ranged combat, the ranger is capable of striking unwitting foes from a distance with his bow. With a stable of pets at his command, a ranger can adapt to his opponents' strengths and weaknesses." forKey:@"Description"];
    [ranger setValue:@"Good dog! Hold the enemy down while I shoot them! You get a biscuit!" forKey:@"Headline"];
    [ranger setValue:@"Pets are permanent AI-controlled NPC allies which are the ranger's special profession mechanic. A pet has a family, such as bear, which determines most of their skills and its general attributes. Its species, such as a polar bear or a brown bear, determines a unique skill. Its type; aquatic, terrestrial or amphibious, determines which environments the pet is able to operate in.\n\nThe ranger has limited control over the actions of their pet; they can set the aggressiveness of the pet and activate a skill, otherwise a pet's action is automatically controled and based on what the ranger does in combat. A ranger can have any number of tamed pets, but only four pets are immediately available to call into battle and only one can be active in the world." forKey:@"specialAbilitiesDescription"];
    
    id warrior = addClass(WARRIOR,ALLEGIANCE_REPUBLIC,@"Brawn",@"Increases damage of burst skill");
    [warrior setValue:@"The warrior is a master of weapons who relies on speed, strength, toughness, and heavy armor to survive in battle. A warrior can shrug off blow after blow to stay in the fight, all the while building up adrenaline to fuel his offense." forKey:@"Description"];
    [warrior setValue:@"Axe or Mace? Rifle or Greatsword? You know, they're all good." forKey:@"Headline"];
    [warrior setValue:@"Burst attacks are a warrior profession mechanic that expend all built-up adrenaline. Each weapon has one burst skill that improves at three different stages of adrenaline. This improvement can be anything from doing more damage, adding additional conditions, increasing condition duration, or increasing skill duration. The burst skill does not take a skill slot and is automatically chosen according to the two-handed weapon equiped or, in case of dual-wielding, the weapon equipped in the main hand.\n\nAdrenaline is a resource unique to the warrior profession. Each attack made by the warrior in combat grants one \"strike\" of adrenaline. Strikes of adrenaline accumulate into three stages. Each stage takes 10 strikes to fill." forKey:@"specialAbilitiesDescription"];
    
    id elementalist = addClass(ELEMENTALIST,ALLEGIANCE_REPUBLIC,@"Intelligence",@"Decreases recharge rate of all attunements");
    [elementalist setValue:@"The elementalist channels natural forces of destruction, making fire, air, earth, and water do her bidding. What the elementalist lacks in physical toughness, she makes up for in her ability to inflict massive damage in a single attack, dropping foes from a distance before they can become a threat. Yet, despite her incredible offensive potential, versatility is what makes the elementalist truly formidable." forKey:@"Description"];
    [elementalist setValue:@"Fire, Air, Earth, and Water. I can deal death with any of them." forKey:@"Headline"];
    [elementalist setValue:@"An attunement is a special type of skill exclusive to the elementalist profession. There are four attunement skills in total, representing the elements of earth, fire, air and water. Because they are special skills, they are located separately just above the skill bar. These skills are assigned buttons F1 to F4 on the keyboard (by default).\n\nActivating an attunement changes the first five skills on the skill bar, releases an immediate area of effect around the elementalist and from there provides the character with a passive, ongoing effect so long as they are attuned to that element. Elementalists' hands also become enveloped by an aura which identifies that character's attunement.\n\nAttunements activate instantly and can be activated mid-cast. When one is activated, the previous attunement recharges for 15 seconds, while the other two recharge for 1 second. Both of these recharges can be reduced by the Intelligence attribute.\n\nElementalists do not have a normal state of activity, and unless directed by an environmental weapon, they are always attuned to an element in any given situation." forKey:@"specialAbilitiesDescription"];
    

    
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
    id(^addZone)(NSString*,NSString*) = ^(NSString* name,NSString* region)
    {
        id zone = [NSEntityDescription insertNewObjectForEntityForName:@"SGZone" inManagedObjectContext:moc];
        [zone setValue:name forKey:@"Name"];
        [zone setValue:region forKey:@"Region"];
        [zone setValue:[NSString stringWithFormat:@"zonePreview_%@",[name stringByReplacingOccurrencesOfString:@" " withString:@""]] forKey:@"PreviewBackgroundFilename"];
        [locations setObject:zone forKey:name];
        return zone;
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
    
    id rataSum = addZone(RATA_SUM,MAGUUMA_JUNGLE);
    [rataSum setValue:@"Floating City" forKey:@"Terrain"];
    [rataSum setValue:@"The greatest physical example of asuran magical mastery is their mighty city, Rata Sum. " forKey:@"Status"];
    [rataSum setValue:@"Starting with no more than a set of scattered ruins belonging to a failed race, the asura erected a testament to their power. Now dominating the surrounding area, Rata Sum is a huge floating cube riddled with interior passages, its upper reaches divided into smaller cubes. The highest locations are the labs and meeting rooms of the Arcane Council, the rulers of the asura race. The depths of this great cube are still being excavated by unsleeping golem servitors.\n\nAsura think of themselves as individuals, each protecting his or her creations jealously, but there are several organizations that bind the race together. The most important of these is the Arcane Council, which is, in theory, a collection of wise asura who enforce the laws of the people. In reality, this group consists of those who are not wise enough to get out of the task, as most asura would rather be pursuing their own creative agendas as opposed to dealing with internal squabbling and bureaucratic rivalries.\n\nRata Sum is also the home of the colleges of the asura people: the Colleges of Statics, Dynamics, and Synergetics. Each has a major complex where promising students, apprentices, and journeymen without their own labs can work, advance their knowledge, and attract better-established mentors. Each of the colleges has its own approach to the Eternal Alchemy. Those of Statics tend to think of the world in lines of force and support—as a fixed state—and seek to learn from the lost lessons of the past. Those of Dynamics perceive the world in an active, ever-changing state, and feel that any experiment you can walk away from is a success. Lastly, those of Synergetics think in terms of the connections between things, in the space between beats. They are the most mystic and theoretical of their people.\n\nRata Sum is the central hub, but the asura have spread their laboratories and research facilities throughout the Tarnished Coast. The personalized nature of creation and the drive to prove themselves the best at their craft often send asuran masters and their krewes into the hinterlands, away from prying eyes and potential competitors. Often, this means that labs are built in particularly remote or dangerous areas. Should a lab be destroyed or its workers slain, new discoveries may be completely lost. Asura curse such events, but neighboring races do not think this is a particularly bad thing." forKey:@"Description"];
    
    id divinityReach = addZone(DIVINITYS_REACH,KRYTA);
    [divinityReach setValue:@"Capital City" forKey:@"Terrain"];
    [divinityReach setValue:@"Humanity's greatest city is Divinity's Reach, founded in the wake of the flooding of Lion's Arch." forKey:@"Status"];
    [divinityReach setValue:@"Built upon ancient Krytan tombs and situated on a bluff, the city provides a strong bastion against a dangerous world. Survivors of the other human nations and refugees from distant lands have poured into Divinity's Reach, swearing fealty to the crown and creating a proud, beautiful city.\n\nThe city is laid out like a great wheel with six spokes. These spokes are elevated high roads which reach from the outer walls to the Central Plaza at the city's hub. It is here that a great orrery spins beneath a massive dome of copper and glass, here that the ministers squabble, and here that Queen Jennah rules with a confident hand." forKey:@"Description"];
    addStartingRace(divinityReach,HUMAN);
    
    id wayfarerFoothills = addZone(WAYFARER_FOOTHILLS,SHIVERPEAK_MOUNTAINS);
    [wayfarerFoothills setValue:@"Hill Settlement" forKey:@"Terrain"];
    [wayfarerFoothills setValue:@"The norn around Hoelbrak have established the Wayfarer Foothills as their primary hunting grounds." forKey:@"Status"];
    [wayfarerFoothills setValue:@"Further north, there lies a treacherous landscape of frozen fields and icy crags corrupted by the Sons of Svanir, norn who revere the Elder Dragon Jormag.\n\nThe Wayfarer Foothills is the first area visited by newly created norn characters and is located next to Hoelbrak. Shrines for the four Spirits of the Wild are located in this area, some of which are threatened by attacks from either the dredge or Sons of Svanir. Each shrine holds a unique event." forKey:@"Description"];
    addStartingRace(wayfarerFoothills,NORN);
    
    id blackCitidel = addZone(BLACK_CITIDEL,ASCALON);
    [blackCitidel setValue:@"Capital City" forKey:@"Terrain"];
    [blackCitidel setValue:@"Upon the overthrow of the Flame Legion, the Iron Legion was granted control of the conquered kingdom of Ascalon by the other victorious legions. They built their main fortress-city, the Black Citadel, on the human ruins of Rin." forKey:@"Status"];
    [blackCitidel setValue:@"The wreckage of that destroyed city can still be seen among the foundations of the citadel. While the Iron Legion is officially in charge, Blood and Ash Legions both have a major presence in the city.\n\nAs the Iron Legion is the most technologically skilled of the charr legions, its city is a vast foundry and center of industry. The Black Citadel is dominated by the huge Imperator's Core, a great spherical structure that houses the headquarters of the three legions, the offices of the tribunes, and the war council, where the legions meet to plan strategy. The Iron Legion Imperator, Smodur the Unflinching, oversees all of this and coordinates the charr in Ascalon with a veteran's eye." forKey:@"Description"];
    
    id theGrove = addZone(THE_GROVE,MAGUUMA_JUNGLE);
    [theGrove setValue:@"Tree City" forKey:@"Terrain"];
    [theGrove setValue:@"The Pale Tree now dominates the Tarnished Coast, her towering top higher than many mountains. In the shelter of her lush foliage, the sylvari have made their homes." forKey:@"Status"];
    [theGrove setValue:@"The Grove, created by the Pale Tree, is a multilevel, verdant, organic city. The roots and branches of the tree form broad terraces where other plants have grown and been spun into homes and buildings. Some of the sylvari have lived their entire lives beneath the tree, but most choose to wander, to adventure, and to let the Dream take them where it may.\n\nThe sylvari are divided into houses or cycles, and feel that an individual's personality is determined by time of day when they awaken. The sylvari born in the Cycle of Dawn tend to be loquacious and diplomatic. Those of the Cycle of Day are often problem-solvers, meeting challenges head-on. The sylvari of the Cycle of Dusk tend to be intelligent and reflective. And those of the Cycle of Night are quiet, secretive, and keep their own counsel.\n\nThe firstborn are the closest thing the sylvari have to rulers, yet the respect they command comes solely from their wisdom and time spent in the world. Each cycle is advised by one of the firstborn who serves as a luminary, as a guide and tutor, to the newly awakened. Yet the ultimate ruler of the people is their parent, the Pale Tree herself. Her song is found in all sylvari, and those who seek understanding travel to the heart of the tree to commune with her and seek her wisdom." forKey:@"Description"];
    
    id plainsOfAshford = addZone(PLAINS_OF_ASHFORD,ASCALON);
    [plainsOfAshford setValue:@"Plains" forKey:@"Terrain"];
    [plainsOfAshford setValue:@"Long ago, the human kingdom of Ascalon occupied the Plains of Ashford. Now, the ruins of that once-great nation tumble across the landscape, and the ghosts of the past haunt any who pass through their territory." forKey:@"Status"];
    [plainsOfAshford setValue:@"The Plains of Ashford is the charr starting area. New charr players start in the Village of Smokestead." forKey:@"Description"];
     addStartingRace(plainsOfAshford,CHARR);
    //TODO: Fill in Plains of Ashford
    
    id metricaProvince = addZone(METRICA_PROVINCE,MAGUUMA_JUNGLE);
    [metricaProvince setValue:@"Forested Grasslands" forKey:@"Terrain"];
    [metricaProvince setValue:@"Metrica Province is the starting area for Asura players and home to Rata Sum. Metrica Province is a vivid, exotic jungle area full of high-tech laboratories, quirky golems, and competing krewes of mad scientists. In the original Guild Wars, this area was known as Riven Earth." forKey:@"Description"];
    //TODO: Fill in Metrica Province
    addStartingRace(metricaProvince,ASURA);
    
    id caledonForest = addZone(CALEDON_FOREST,MAGUUMA_JUNGLE);
    [caledonForest setValue:@"Forests" forKey:@"Terrain"];
    [caledonForest setValue:@"Caledon Forest contains many temple ruins and is inhabited by \"great cats\" as they are called by Gullik Oddsson, who went hunting there once for the cats' pelts. Dougal Keane has visited this site in the past as well. Furthermore, The Grove is also located within Caledon Forest." forKey:@"Description"];
    addStartingRace(caledonForest,SYLVARI);
    
    id frostgorgeSound = addZone(FROSTGORGE_SOUND,SHIVERPEAK_MOUNTAINS);
    [frostgorgeSound setValue:@"Rough Snowy" forKey:@"Terrain"];
    [frostgorgeSound setValue:@"Frostgorge Sound is a high level zone found in northern most reaches of the Shiverpeak Mountains, its defining feature the eponymous sound caused by the rise of the Elder Dragon Jormag. Three kodan sanctuaries can be found here, including the Honor of the Waves which is said to be sinking." forKey:@"Description"];
    //TODO: Fill in Frostgorge Sound
    
    id mountMaelstrom = addZone(MOUNT_MAELSTROM,UNKNOWN_LOCATION);
    [mountMaelstrom setValue:@"Volcanic" forKey:@"Terrain"];
    [mountMaelstrom setValue:@"Mount Maelstrom is a high level zone on the southern tip of the Steamspur Mountains. Its named after a massive volcano that caused the previously snow-capped region to melt. The Crucible of Eternity, an Inquest lab, can be found here as well." forKey:@"Description"];
    //TODO: Fill in Mount Maelstrom - find region
    
    id fireheartRise = addZone(FIREHEART_RISE,ASCALON);
    [fireheartRise setValue:@"Unknown" forKey:@"Terrain"];
    [fireheartRise setValue:@"Fireheart Rise is a high level zone located in the northernmost reaches of Ascalon. The Flame Legion's Citadel of Flame has been established here." forKey:@"Description"];
    //TODO: Fill in FIREHEART RISE - find more details, fill in terrain type
}
-(void)addDungeons
{
    id(^addDungeon)(NSString*,NSString*,NSString*) = ^(NSString* name,NSString* location, NSString* difficulty)
    {
        id dungeon = [NSEntityDescription insertNewObjectForEntityForName:@"SGDungeon" inManagedObjectContext:moc];
        [dungeon setValue:name forKey:@"Name"];
        [dungeon setValue:[locations objectForKey:location] forKey:@"location"];
        [dungeon setValue:difficulty forKey:@"GameLevel"];
        [dungeon setValue:[NSString stringWithFormat:@"dungeonPreview_%@",[name stringByReplacingOccurrencesOfString:@" " withString:@""]] forKey:@"PreviewBackgroundFilename"];
        [dungeons setObject:dungeon forKey:name];
        return dungeon;
    };
    
    id ascalonianCatacombs = addDungeon(@"Ascalonian Catacombs",PLAINS_OF_ASHFORD,@"Level 30 to 35");
    [ascalonianCatacombs setValue:@"The Ascalonian Catacombs are an underground region in the charr territory of Ascalon. Thought to have been lost after the Searing cut off access, they are part of humanity's legacy in the region. It serves as a dungeon for characters up to level 30 in story mode and up to 35 in explorable mode, in which the player must put restless spirits that haunt the catacombs to peace. Players above the maximum levels can still enter, but will be scaled down to a maximum of 4 levels above the level limit.\n\nIn the story version of the dungeon, Eir Stegalkin is hunting for the remains of King Adelbern's sword, Magdaer, and Rytlock is attempting to stop her before she stirs up the restless spirits of the Ascalonian ghosts. During this attempt, it is discovered that a powerful darkness is welling up from the depths beneath the dungeon.\n\nIn the explorable versions, the Durmand Priory is attempting to solve the issue of the unknown darkness and the players must choose one of three methods to go about this. Each method has its own dungeon version, determining what the team fights.\n\n Many of the spirits are those of the trainers who lived during the time of the Searing." forKey:@"Description"];
    
    id caudecussManor = addDungeon(@"Caudecus's Manor",UNKNOWN_LOCATION,@"Unknown Difficulty");
    [caudecussManor setValue:@"Caudecus's Manor is a dungeon, owned by and named after Legate Minister Caudecus Beetlestone. It is located on the northern end of the Shire of Beetletun" forKey:@"Description"];
    //TODO: Expand Caudecus's Manor - Specify Zone
    
    id twilightArbor = addDungeon(@"Twilight Arbor",CALEDON_FOREST,@"Level 50");
    [twilightArbor setValue:@"Twilight Arbor is a level 50 dungeon in the Tarnished Coast." forKey:@"Description"];
    //TODO: Expand Twilight Arbor - Specify Zone
    
    id sorrowsEmrace = addDungeon(@"Sorrow's Embrace",UNKNOWN_LOCATION,@"Level 60 to 70");
    [sorrowsEmrace setValue:@"Sorrow's Embrace was once called Sorrow's Furnace. It was a mine and main base of the Stone Summit dwarves before their defeat and exile into the Far Shiverpeaks in 1072 AE. After the dwarves left, the dredge claimed the area as their own. The technology and magic found in Sorrow's Furnace was left intact.\n\nSorrow's Embrace is a level 60-70 dungeon. In story mode you discover that some dredge have sold others of their kind into slavery under the Seraph, and battle the Iron Forgeman over a pit of lava. In explorer mode you can help the Dredge revolt against their masters. Players will also engage Destroyers and the Inquest." forKey:@"Description"];
    //TODO: Expand Sorrow's Embrace - Specify Zone
    
    id citadelOfFlame = addDungeon(@"Citadel of Flame",FIREHEART_RISE,@"Level 70");
    [citadelOfFlame setValue:@"The Flame Citadel is a city in the northernmost reaches of Ascalon. It resides within the Fireheart Rise." forKey:@"Description"];
    //TODO: Expand Citadel of Flame - Specify Zone

    
    id crucibleOfEternity = addDungeon(@"Crucible of Eternity",MOUNT_MAELSTROM,@"Unknown Difficulty");
    [crucibleOfEternity setValue:@"The Crucible of Eternity is a location on the shores of Steamspur Bay, standing in roughly the same location of what was the dwarven city of Droknar's Forge. The area has changed in the past 250 years, with the lands warming and the new presence of a nearby volcano. This confluence seems to have appealed to members of the Inquest, who have established a base of operations upon the site." forKey:@"Description"];
    //TODO: Expand Crucible of Eternity - Specify Zone
    
    id honorOfTheWaves = addDungeon(@"Honor of the Waves",FROSTGORGE_SOUND,@"Level 70 to 80");
    [honorOfTheWaves setValue:@"Honor of the Waves is a level 80 dungeon in the Northern Shiverpeaks." forKey:@"Description"];
    //TODO: Expand Honor of the Waves - Expand description

    
    id arah = addDungeon(@"Arah",UNKNOWN_LOCATION,@"Unknown Difficulty");
    [arah setValue:@"Presumably built by the gods (as they were its inhabitants), Arah is a holy city situated on the peninsula of Orr. As the city was lost to the sea shortly prior to the events of the original Guild Wars, little is known of the city's actual appearance save that it has many spired towers. Following the Exodus the human Kingdom of Orr assumed stewardship of the city, watching over it in anticipation of the day when the gods would return. However their protection of the city would come to a catastrophic end in an event that became known as the Cataclysm.\n\nDuring the Guild Wars, open fighting in the streets of Arah had led to hostilities between the three human nations of Tyria. As such, the nations did not unite against the threat of the charr invasion, each choosing to stand alone. In 1070 AE the Searing shattered Ascalon's defenses and allowed the invading charr to push into Orrian territory, driven by the orders of their titan gods to destroy Arah. In 1071 AE, before they could raze the city, Vizier Khilbron, the adviser to King Reza, used magic buried in a vault deep beneath Arah and brought about the Cataclysm, destroying the charr invasion and the Kingdom of Orr in an instant. Arah sank beneath the waves of the Bay of Sirens (later renamed the Sea of Sorrows to reflect this) with the rest of the peninsula and was thought lost, fulfilling the wish of the god Abaddon.\n\nHowever, nearly 150 years after the destruction of Orr, a new power stirred in the sunken ruins of Arah. The deathless dragon Zhaitan woke from an ancient slumber and raised the drowned Kingdom to the surface once again. The ruins of Arah are now his lair and the main base of operations for the undead legions and fleets that maintain a stranglehold on Tyria's sea routes." forKey:@"Description"];
    //TODO: Expand Honor of the Waves - Specify Zone
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
    dungeons = [NSMutableDictionary new];
    
    [self addClasses];
    [self addLocations];
    [self addRacesAndClasses];
    [self addZones];
    [self addDungeons];
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
