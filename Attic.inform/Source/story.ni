"Last Schooner to Africa" by Alexander Dolgunin.
The story headline is "A soul adventure".
The story creation year is 2017.
The release number is 0.
[Use memory economy.]
Use no deprecated features.
Use scoring. The maximum score is 10.
Use OMIT_UNUSED_ROUTINES of 1.

[ Uncomment the next line to allow test commands to work, even in release builds. ]
[ Include (- Constant DEBUG; -) after "Definitions.i6t". ]
[ Next line keeps testing-in-progress check from breaking on release builds. ]
Include (-#ifndef DEBUG; Array test_stack --> 1; #Endif; -) after "Definitions.i6t"

Figure of Dragon is the file "kekule-benzene-snake.png".
Figure of Chest is the file "reindeer-ornament.jpg".
Figure of Play Card is the file "play-if-card-700x500.png".
Release along with cover art.

[Include Basic Screen Effects by Emily Short.]
Include Inanimate Listeners by Emily Short.
Include Object Response Tests by Juhana Leinonen.
[Include Dynamic Objects by Jesse McGrew.]

Part 1 - About the Game

Chapter 1 - Intro and some definitions

When play begins:
	display figure of Cover;
	set pronouns from the nurse;
	remove the test rubbing rule;
	remove the test swinging rule;
	say "[italic type]Your name is Andreas van der Boom and you are the elder son of an artist and philosopher with noble roots.
You are at your parents[apostrophe] home in Harlem, Holland province of Holy Roman Empire, looking for some answers...[roman type]
[para]If you are new to Interactive Fiction, use HELP command to see an useful play card.
[para]All commands are case-insensitive. Type SCRIPT to begin transcripting, this will help author to fix bugs."

A person is either awake or asleep. A person is usually awake.
The player is asleep. He is in the Living Room.
Instead of searching yourself:
	try taking inventory.
  
Instead of listening to yourself:
	say "That is solid advice one should remember more often."

Knowledge relates one person to various things. The verb to know implies knowledge relation.

Harlem is a scene. Harlem begins when play begins.

To decide whether location is below Attic:
    if location is Living Room, decide yes;
    if location is Garden, decide yes;
    otherwise decide no.

Definition: Something is guttable rather than unguttable if it is listed in {Myen Dalay Table, mandala, Sofa}.
Definition: Something is wall decoration if it is listed in {Myen Dalay Table, mandala}.
Definition: Something is bulky if it is listed in {Carpet, mandala, long rope, pipe}.
Definition: Something is bookish if it is Bookshelf or it is a part of Bookshelf.
Definition: Something is valuable if it is bookish or it is Deck.
Definition: Something is room floor if it is listed in {the ground, Ouroborous Hatch, Hexagon}.
Definition: Something is doorlike if it is Desk or it is room floor.
Definition: Object is attic smelling if it is listed in {Attic, mandala, Deck, Sofa}.
Definition: Something is gas filling if it is switched on and the pipe is a part of it.
[ A pseudo-container that cannot actually contain things ]
A pseudobox is a kind of fixed in place thing. It has number called carrying capacity. The carrying capacity is always 0.
The can't insert into what's not a container rule does nothing when inserting something into a pseudobox.
[ TODO In some games, typing "about" will give you a short blurb about the game.
  TODO Perhaps Andrew Plotkin's Basic IF Help is worth including into releases only. 
  Leave only info, hint and "play card" aliases for "asking for help" then, and document them in about
  and in "When play begins" intro text.]
Asking for help is an action out of world applying to nothing. Understand "help", "play card", "info", "credits" or "hint" as asking for help.
Carry out asking for help:
	if word number 1 in player's command in lower case is "credits":
		say complete list of extension credits;
	otherwise:
		say "Please study this (courtesy of People's Republic of Interactive Fiction):[para]http://pr-if.org/doc/play-if-card/play-if-card.pdf";
		display the Figure of Play Card.
Understand "about" as requesting the story file version.
[Disable some verbs]
Understand nothing as rubbing.
Understand nothing as swinging.
Understand nothing as squeezing.
Understand nothing as jumping.
Understand nothing as waving hands.
Understand nothing as waving.

To say para:
	say "[line break]";

To say -s:
	unless noun is plural-named:
		say "s";


Chapter 2 - For testing - not for release

Dumping table is an action out of world applying to nothing. Understand "dump" as dumping table.
Carry out dumping table:
	showme the contents of Table of H-quips.
[To debug table:
	(- TableDebug(T2_h_quips); -)]
Harlem ends when the location is the Test Room.
The Test Room is a room. 
Sleeping Beauty is an asleep woman, here.
Test exploring with "move me / l hands / enter hexagon / read table / read book / open book / touch book / ask nurse about stairs" in the Living Room.
Test flying with "move andreas / move carpet / sit on carpet / sit on ceiling / breathe / z / fly" in the Living Room.
Test flying1 with "move me / sit on ceiling / breathe / z / fly" in the Living Room.
Test carpet with "lie on carpet / stand / stand on carpet / stand / step on carpet" in the Living Room.
Test attic with "dream / breathe / z / fly / pray / sing / ask nurse about stairs / move me / move chest" in the Attic.
Test attic1 with "wake / sleep / curse me / pinch me / pinch nurse / pinch dragon / curse nurse / move nurse" in the Attic.
Test climbing with "unlock hatch with silver key / open it / purloin long rope / tie it to hatch / d / dump" in the Attic holding the silver key.
Test jumping with "unlock hatch with silver key / open it / push sofa down / dump" in the Attic holding the silver key.
Test endharlem with "z / pinch me / wake / dream / wake / sleep / breathe / l hands / sing / pray / curse me / move me / move beauty" in the Test Room.
Test cards with "ask her about cards / yes / pick one of past / pick two of future / i" in the Attic.
Test mandala with "cut mandala / drop it / slice it" in the Attic holding the dagger.
Test garden with "purloin dagger / cut mandala / d / unlock garden with silver key / go outside" in the Attic holding the silver key.
Test gas with "cut table / turn left tap on / light left tap / purloin flint / light left tap / light right tap / turn right tap on / light right tap / extinguish left tap / close right tap / extinguish left tap / extinguish right tap / extinguish nurse" in the Living Room holding dagger.
Test drawer with "sit on sofa / z / get off / open drawer / get brass key" in the Attic.
Test sofa with "search sofa / cut sofa / search sofa / search sofa / cut it" in the Attic holding dagger.

This is the test cursing rule:
	announce tests for "cursing [the noun]";
	try the test-actor cursing the noun.

This is the test talking rule:
	announce tests for "talking to [the noun]";
	try the test-actor talking to the noun.

Table of analyzing actions (continued)
topic	testing rule
"cursing"	test cursing rule
"talking"	test talking rule

Chapter 3 - For Adventure fans

Understand "xyzzy", "say xyzzy" or "cast xyzzy" as casting xyzzy.
Casting xyzzy is an action applying to nothing.
Instead of casting xyzzy for the first time:
    say "Once upon a time, an Indian algebraist Ramanujan heard a wonderful story about family curse from his grandmother.

He was telling it to his friends, and the story had several endings. Sometimes he offered his friends a chance to influence the story.

Over time it got so popular that he wasn't able to be present everywhere the story was being told. So he designed a story-telling clockwork mechanism.

Other story tellers envied him, whether they had stories about curses, princesses, dragons or mundane things, so he ended up making the mechanism universal enough for them to use, and the number of stories proliferated, forming the Enchanted Garden of Interactive Fiction..."
Report casting xyzzy:
  say "Initially the mechanism needed a mechanic to program it, as if it were a musical box.

With it's popularity rising, however, poets and scribes pestered Ramanujan about making it more accessible to them —— so he made his story box to understand ordinary speech. Not entirely, of course, since it still takes a human being to understand another one entirely.

[italic type]That's it. You know it all now[roman type]."

Chapter 4 - Parser improvements - for release only

Include Punctuation Removal by Emily Short.

After reading a command: remove question marks.

Part 2 - Rooms

Chapter 1 - Living Room

The Living Room is a room. "This is the living room almost like you remember it. The staircase to the attic is absent. Small [Bookshelf] has some ordinarily looking tomes[if the location contains the Carpet]. A little oriental-looking [Carpet] is in a corner[end if]."
The Ouroborous Hatch is a locked door. "[if the location is the Attic and Hatch is closed]The round hatch in the floor blocks your return to the Living Room.[otherwise]From the ceiling, some short ornamental rope hangs.[end if]".
The Ouroborous Hatch is up from Living Room and down from Attic.
Understand "rope" or "attic" as hatch when location is below Attic.
The description of hatch is "[bold type]Ouroborous Hatch[roman type][line break]Strangely, the attic hatch is not what it used to be when you were young. It's round, has a semi-transparent colourful drawing of Chinese [bold type]Dragon[roman type] biting it's own tail on it and, inside him is a strange diagram of a [bold type]hexagon[roman type] with one additional line added inside every second side of it. Your father must've been dabbling in Kabbalah lately.".
Report examining the Hatch for the first time:
	display the Figure of Dragon;
	rule succeeds.

Myen Dalay table is fixed in place, here. "A large diagram is hanging next to bookshelf."
The description of Myen Dalay Table is "[bold type]Periodical Chinese Elements by Myen Dalay[roman type][line break]Some Chinese natural philosopher devised it long before Europeans did, as usual."
Understand "diagram", "wall", "chinese" and "periodical" as Myen Dalay Table.

The Hexagon is a part of the Hatch. The description of Hexagon is "Rather than a star of David inscribed into it like you would expect normally, this hexagon has three of its sides doubled, and nothing inside. Only odd sides are doubled if you number them with integers."

[Process things that do not leave Harlem here, in First report touching and First report smelling rules]
First report touching during Harlem:
	if the noun is a bookish thing:
		say "In your lateral vision, you've just seen an apparition of your nurse from above. Although you didn't know for sure, you always suspected her of doing strange breathing excercises, talking and playing music to snakes, that kind of stuff. Even now she was not merely leaning into the room from the attic, peeking at you, but sort of floating in a cloud, her legs contorted in an impossible knot.";
		rule succeeds;
	if the noun is Sofa and Sofa is intact:
		say "It feels like there's something inside it.";
		rule succeeds;
	if the noun is:
		-- Myen Dalay Table: say "You press gently and discover that [the noun], firmly attached to the wall, covers some hole in it.";
		-- hexagon: say "[if the location is below Attic]You elongate your hand to be able to touch the ceiling. [end if]Strange hexagon feels oily to the touch.";
		-- dragon: say "OUCH! Better leave it alone, you see it's spiky and scaly and perhaps has electric charge!";
		-- Nurse: say "You can't really touch a ghost, even in this realistic lucid dream.";
		-- otherwise: continue the action;
	rule succeeds.

First report smelling during Harlem:
	if the noun is a bookish thing:
		say "The smell reminds you of exotic cinnamon. Mother used to put it into your milk before bed time.";
		rule succeeds;		
	if the noun is:
		-- Myen Dalay Table: say "Strange mix of powders, liquids and gasses.";
		-- hexagon: say "Really strange smell from the future. Something like oil made of carbon, if that makes any sense to you.";
		-- dragon: say "It smells of sulphur, as you've expected.";
		-- Nurse: say "You can't really sniff a ghost, but she leaves a very faint scent of water lily.";
		-- otherwise: continue the action;
	rule succeeds.

The ground is a backdrop. It is in the Garden and Living Room.
Understand "floor" as ground when location is Living Room.
Instead of looking under a room floor: say "Nice idea if you can figure out how."
Before putting something on a room floor:
	if the second noun is ground or location is Attic:
		try dropping the noun instead.

To update the Table of H-quips:
	choose row with sbj of "waking up" in the Table of H-quips;
	now response entry is "[The noun] says: 'You will wake up once above ground again, in the open air. Check the garden, the room and the attic for the devices that will help you fly.'";

Chapter 2 - Attic and it's puzzles

The Attic is a room. "Loaded with old stuff to the brim. You may hope to declutter it a little towards the end of the story[if Sofa is intact and Sofa is in Attic and mandala is fixed in place]. There is a low [Sofa] so positioned that person sitting on it can study [mandala] in the northwest corner[end if]. A Desk occupies the opposite corner."

The Chest is a locked container that is fixed in place, here. "A medium-sized Chest with Viking ornaments on it is in the middle."
It has description "When you look at it carefully, the reindeer of the ornament start to run in your vision, but perhaps that's no more than a lucid dreaming-induced illusion."
Understand "viking/medium-sized chest", "reindeer" or "ornament" as Chest.

[TODO dagger needs some sensation when touched, perhaps some smell and more detailed story-revealing description]
[Before departing ... what about the cards?..]
The Chest contains a dagger, a flint, a long rope and a silver key.
The description of dagger is "It has a handle made of reindeer horn."
The silver key unlocks the Hatch.
Report examining the Chest for the first time:
	display the Figure of Chest;
	rule succeeds.
The Sofa is an enterable pushable between rooms supporter in the Attic. "[if Sofa is intact]A low Sofa occupies the southeast corner[otherwise]The gutted Sofa reveals a lot of layered very thin cloth[end if]." The Sofa can be gutted or intact. It is intact. The description is "This cosy but very dusty sofa underwent a few reupholsteries during your childhood."
The Sofa has a number called the balloon size. The balloon size is 0.
Understand "low sofa" as sofa. Understand "cloth" as sofa when sofa is gutted.
Definition: Object is vertical if it is up or it is down.
The can't push vertically rule does nothing when pushing the Sofa to.
The standard pushing in directions rule does nothing when pushing the Sofa to down.
The block pushing in directions rule does nothing when pushing the Sofa to down.
First check pushing the Sofa to:
	if the second noun is not vertical:
		continue the action;
	if the second noun is up:
		say "It cannot be pushed up.";
	otherwise if the location is below Attic:
		say "It cannot be pushed down from here.";
	otherwise if Hatch is closed:
		say "You would need to open [the Hatch] first.";
	otherwise:
		continue the action;
	stop the action.
Carry out pushing the Sofa to down:
	if noun is intact:
		now noun is gutted;
		now pipe is part of the noun;
	move noun to the Living Room;
	[update the Table of H-quips;]
	try silently going down;
	now player is on the noun;
	say "With a loud noise, you force [the noun] through [the Hatch] and follow it by jumping onto it from above.[para]A cloud of Attic dust will hang around the [location] for a while."
After going outside when a gas tap is gas filling during Harlem:
	if the location of the Sofa is the Garden:
		now the Sofa is not pushable between rooms;
	continue the action.
[Changing the text of responses: http://dhayton.haverford.edu/wp-content/uploads/Inform-manuals/ex322.html
A more universal construct would be: The can't push from within rule response (A) is "[We] [cannot] push [the noun] while [we] [are] [if noun is a supporter]on top[otherwise]inside[end if] of [regarding the noun][them].]
The can't push from within rule response (A) is "[The noun] [cannot] be pushed while [we] [are] [if noun is a supporter]on top[otherwise]inside[end if] of [regarding the noun][them]."
Instead of turning or pulling the Sofa, try pushing the noun.
Instead of pushing the Sofa when player is not on the noun, say "You drag [the noun] some distance[if location is Attic] towards [the Hatch], wondering if it can be pushed down[end if]."
Instead of taking the Sofa when player is not on the noun, say "It is too heavy to lift, but not too heavy to be dragged around by one person."

The mandala is fixed in place in the Attic. It has description "A circle divided into four sectors each depicting a palace entrance. In each entrance, there are four doors. Each door has four locks. But where are the keys?[unless we have examined the noun][para]In the center, there is a chart with ten nodes and twenty two links between them. Does it mean ten members of a secret order and their connections?[end if][if noun is fixed in place] A corner is peeled off[otherwise] It is rolled and feels fragile[end if]."

The Secret Drawer is an openable closed container. The brass key is in the Secret Drawer. It unlocks the Chest.
Instead of inserting a bulky thing into Secret Drawer:
	say "[The noun] is too large to fit into [second noun]."

Understand "floor" as hexagon when location is Attic.
Understand "ceiling" as hexagon when location is below Attic.
[mandala and Deck keep their olfactory qualities after they become portable and probably leave the Attic:]
Instead of smelling an attic smelling object:
	say "A typical attic smell, that is: dust gathering for decades, and a whiff of bat feces discernible only to either chiropterologist or psychiatrist."
Last instead of smelling a fixed in place thing in the Attic:
	try smelling the Attic.

Chapter 3 - Garden

The Garden is a room. "Please provide description, please."
The garden doors are a locked privately-named plural-named undescribed door. "Through the doors with windows, [if location is Garden]the house interior [italic type]inside[roman type] seems inviting, as it's chilly outside[otherwise]you see garden in the back of the house, [italic type]outside[roman type] from here[end if]."
They are outside from the Living Room and inside from the Garden. The silver key unlocks the garden doors.
Understand "garden/-- doors" or "garden" as garden doors when garden doors are described.

Part 3 - Actions and Interactions

Chapter 1 - Waking and Dreaming

Instead of sleeping during Harlem: say "You happen to be already asleep somewhere, dreaming about your parents['] home."
[TODO will 'below Attic' include the garden? that would also affect reading...]
The new waking up rule is listed instead of the block waking up rule in the check waking up rulebook.
Check waking up (this is the new waking up rule):
	if player is awake:
		say "You are already wide awake.";
	otherwise if location is Attic or location is below Attic:
		say "You try to wake up, only to another dream almost identical to this very one.";
	otherwise:
		continue the action;
	stop the action.
Carry out waking up:
	now player is awake;
Report waking up:
	say "You woke up. It's good to be awake.";
Instead of waking yourself: try waking up.

The hands are plural-named part of the player.

The description of hands is "[if player is asleep]Using your past lucid dreaming exploits, you remember how to locate your hands, try lighting and extinguishing a lamp, etc etc: you are positively not awake right now, but your dream is lucid.[otherwise]You are awake![end if]".
After examining hands for the first time during Harlem:
	now player knows hands;
	increment the score.

Chapter 2 - Books

Before examining something when location is below Attic:
	if word number 1 in player's command in lower case is "read":
		if noun is person:
			say "You try to read [the noun] as if [they] were an open book, but fail miserably.";
		otherwise if noun is hands:
			say "You practice a bit of chiromancy here: it helps to discover what's going on.[paragraph break]";
			continue the action;
		otherwise if noun is Myen Dalay Table:
			say "You glean no useful information from those cryptic hieroglyphs.";
		otherwise if noun is bookish:
			say "You approach the shelf and try to get a book from it. Although today it doesn't seem to work as usual. The book stays in its place squeezed between others. But in your mind, you get a recollection of strange things you read in those adult books while your mum was out and about. Like [if Attic is visited]filling a soap bubble with hot air and watching its flight, or machines operated by human muscles flying like birds, or how Archimedes shouted 'Eureka!' from a bath[otherwise]finding a carpet, sitting in Lotus pose, breathing, and feeling how your body becomes lighter and lighter[end if]...";
		otherwise:
			say "Reading that would be no help. Perhaps there's something more readable here?";
		stop the action.

The Bookshelf is pseudobox in the Living Room. It has description "[bold type]Bookshelf[roman type][para]It has: Theatetus, Plato[para]On Dreams, Aristotle[para]Am I Man or Butterfly Dreaming? by Zhuangzi[para]Yoga Sutras, Patanjali[para]Book of Daniel as a nice little brochure[para]Secrets of the Hyperboreans, Christoff De Turnelle[para]Popol Vuh of the Mayans".
Understand "shelf", "book", "tome", "foliant", "brochure", "little brochure" or "small bookshelf" as Bookshelf.
The Books are a plural-named part of Bookshelf.
Understand "books/tomes/foliants/brochures" as Books.
Instead of examining books, try examining Bookshelf.
Instead of pulling or pushing a bookish thing, try taking the noun.
Instead of taking a bookish thing, say "The books stay in their places squeezed between others. Perhaps a lighter, gentler approach would bring more results."
Instead of opening a bookish thing, say "[regarding the noun][They] escape[-s] your approach, as if in a dream, but you feel you could still read those books with your mind..."
To update Bookshelf:
	now description of Bookshelf is "[bold type]Bookshelf[roman type][para]It has: Flying Machines, from Leonardo di ser Piero journals[para]Archimedis Opera Omniae[para]Vaiśeṣika Sutras, Kaṇāda Kashyapa[para]Yoga Sutras, Patanjali[para]I Ching, the Book of Changes, edited by Confucius[para]Secrets of the Hyperboreans, Christoff De Turnelle[para]Popol Vuh of the Mayans".

Chapter 3 - Carpet

The Carpet is an enterable supporter in the Living Room. It has description "Made of British wool, has reindeer ornament on it."
Understand "oriental-looking/oriental/little/small/-- carpet/mat/yogamat" as Carpet.
Instead of smelling the carpet, say "Smells of indian incenses."
Instead of pushing or turning the carpet, try pulling the noun.
Instead of pulling the carpet:
	if word number 1 in player's command in lower case is "tear":
		say "It is too strongly-woven to tear it into pieces.";
	otherwise if player is not on the noun:
		say "You adjust [the noun] keeping in mind the Feng Shui.";
	otherwise:
		say "You cannot shift it while it's underneath you."
[TODO Carpet needs some sensation when touched]
To say fiddly details:
	if the location is below Attic and the noun is not the ground,
		say ", especially taking into account it's location.[if player is not on the Carpet] Wouldn't it be better to use that cosy carpet in the corner?[end if]";
	otherwise say "."
[FIXME This feels weird: It's rather inconvenient to stand on the ground.]
Check entering something during Harlem:
	if noun is doorlike:
		let vrb be word number 1 in player's command in lower case;
		let thing to say be "[vrb] on";
		if vrb is:
			-- "get": let thing to say be "get into";
			-- "go": let thing to say be "go through";
			-- "enter": let thing to say be "enter";
		say "It's rather inconvenient to [thing to say] [the noun][fiddly details]" instead;

Report entering the Carpet:
	if player's command matches the regular expression "^stand|step\b", case insensitively:
		say "At first you try tadasana, but then, possessed with a sudden urgency, sit down with your spine straight.[paragraph break]";
	if player's command matches the regular expression "^lie|sprawl\b", case insensitively:
		say "At first you try shavasana, but then, possessed with a sudden urgency, sit up with your spine straight.[paragraph break]";
	say "You crawl into Lotus pose on [the Carpet] and start your breathing excercises...[if Attic is not visited][para]After a while, it feels almost like you could move your body around without muscles, by sheer force of your mind.[end if]";
	rule succeeds.
After entering the Carpet when player does not know the noun:
	if Attic is not visited:
		increment score;
	now player knows the noun;
	now the printed name of the Carpet is "Yogamat";
	continue the action.
Understand "step on/in [something]", "lie on/in [something]" or "sprawl on/in [something]" as entering.

Chapter 4 - Chest, Hatch, long rope (attic puzzle #2)

After opening Chest when actor does not know the noun:
	increment the score;
	now actor knows the noun;
	continue the action.
[Rule "After going .. the first time" wouldn't work here for updating quips table:
the situation is similar to the task
where we need to increment score only once when the Chest is opened. Player can attempt to
open it when it's locked, and we don't stop that in Instead of or Check rules.
Same here, player can attempt going up or down before unlocking the Hatch, so we use
knowledge relationship the same way as with Chest]
After opening Hatch when actor does not know the noun:
	now the initial appearance of the Hatch is "[if the location is the Attic][The living room] is down from here[otherwise]From the ceiling, a long rope hangs that can be used instead of stairs[end if].";
	update the Table of H-quips;
	now actor knows the noun;
	continue the action.
[FIXME it makes no sense that the long rope can be attached while player is in the Living Room, if Hatch is open, but not if it's closed!]
[TODO either allow attaching it while standing on the gutted Sofa in the LR with the closed Hatch (too far to reach if it opens upwards), or require being in the Attic for that]
Instead of tying the long rope to the Hatch when the long rope is not part of the Hatch and location is Attic:
	if the Hatch is open:
		now the noun is part of the second noun;
		now the description of the noun is "It's length is more than enough, so it coils on the floor.";
		say "You hang the rope so that it can be used to safely climb down from here, and then up again.";
	otherwise:
		say "[The second noun] is closed, what would be the point to attach a rope from this side?"
Instead of doing something to the long rope when the long rope is part of the Hatch and Hatch is closed and location is Attic:
	say "You cannot see it when [the Hatch] is closed."
Definition: Something is impassable if it is unlocked and (the long rope is not part of it and Sofa is not in the Living Room).
Instead of going down when the location is Attic and the Hatch is impassable:
	say "Although this is a lucid dream, you are not comfortable jumping down from here. The reason is more psychological than physical, as you face some unpleasant memories of falling while you were a child."
Instead of going up when the location is Living Room and the Hatch is impassable:
	say "You would need something instead of the missing stairs."
Report going through the Hatch:
	say "You [if long rope is part of the Hatch]climb [the long rope][otherwise]use [the Sofa] instead of stairs[end if]."
["climb sofa" while on the sofa results in going up silently; by adding "try silently exiting" in this case before "try going up", we make it print description of Attic]
Check climbing something during Harlem:
	if (the noun is Hatch or the noun is long rope) and the long rope is part of the Hatch:
		if location is Attic, try going down;
		otherwise try going up;
		stop the action;
	if the noun is Sofa and location is Living Room:
		if player is on the sofa:
			try silently exiting;
		try going up;
		stop the action.

Instead of entering Chest:
	if Chest is open,
		try closing the noun;
	say "You take rest using Viking chest as a sopha. It helps with your reasoning."


Chapter 5 - Moving variation, dreaming, breathing, waiting/meditating (attic puzzle #1)

Instead of pulling yourself:
	if word number 1 in player's command in lower case is "tear":
		say "That desperate act would achieve little.";
	otherwise:
		try pushing the noun.
First check pushing something when Attic is unvisited:
	if the actor is the player and the noun is the player,
		say "You are trying to remember how Yogis of the past called that kind of movement in Latin." instead;

[These verbs: dream, breathe, sing -- do not affect the world model, so let's furnish them as mistakes.
This would exclude them from the turn count, though...]
Understand "dream" as a mistake ("[if player is asleep]You ponder that eternal question whether Zhuangzi dreamed about being butterfly or the insect dreamed about being him[otherwise]You stare dreamily into space[end if].").

To say breathing outcome:
	if Attic is visited,
		say "Your previous excercises resulted in hyper-ventilation. Perhaps it's enough";
	otherwise say "[if player is on the Carpet]You breathe prana[otherwise]Kapalabhati and other pranayama excercises are best done seated[end if]".
Understand "breathe", "inhale" or "exhale" as a mistake ("[if player is awake]You breathe heavily[otherwise][breathing outcome][end if].").
Understand "meditate" as waiting.
Check waiting during Harlem:
	if player is not on a supporter:
		say "Perhaps you need to take some asana to meditate." instead;
	otherwise:
		say "You meditate dutifully[if location is Attic and mandala is fixed in place] studying the [mandala] intently[end if].";
		disclosing siddhi happens in one turn from now;
		if location is Attic, now player knows the Secret Drawer.
At the time when disclosing siddhi happens:
	say "Your supernatural abilities are getting better[if player knows the Secret Drawer and Secret Drawer is not part of the Desk]. Suddenly a memory of a concealed drawer of the desk surfaces, perhaps it's time to look for it again[end if].";
	if player knows the Secret Drawer:
		now the description of Desk is "Your father's desk with a secret drawer now revealed.";
		now the Secret Drawer is part of the Desk;
		mark used "chest".
After waiting for more than three turns:
	say "Matters will not mend themselves on their own."
Report an actor waiting when actor is on a supporter (this is the new report waiting rule):
	say "[one of]Time passes[or]True love waits. So do you[or]While you wait, Constantine XI was killed and Kunga Lekpa deposed[at random]."
The new report waiting rule is listed before the standard report waiting rule in the report waiting rulebook.

[TODO player may also be Christian or Afroteria sleeping, in the future!]
Understand "andreas", "andreas van der boom", "body", "my body" or "without muscles" as yourself when player is asleep.

Chapter 6 - Breaking free to explore Attic and chest

[Assuming player will be awake after Harlem, so no need to check praying in the general rule.]
Levitating is an action applying to nothing. Understand "fly", "float", "drift", "levitate" as levitating when player is asleep. Understand "pray" as levitating.
[TODO handle trying to fly or praying while seated on Carpet/Sofa after visiting Attic: hint that someth like sofa can be a Flying Carpet, but with some use of advanced tech]
Check levitating during Harlem:
	if Attic is visited, say "Your magical powers are not enough to repeat this trick. Probably it was a one-off event." instead;
Carry out levitating during Harlem:
	if word number 1 in player's command in lower case is "pray":
		say "Gathering all your mind force, you sing [italic type]'Asato ma sat gamaya'[roman type] mantra. It sounds as if you were joined by an orchestra and some choir. Obstacles dissolve in your path.[paragraph break]";
		increment the score;
	say "There are different theories about levitation. They usually postulate that while your mass remains  constant, the weight (measured as force of gravity) can be mind-controlled.[paragraph break]Your feet slowly lose grip on the floorboards, and you start ascending into the interior of the hexagon.[para][bold type]Gotcha![roman type] Up you go through the hexagon, that becomes opaque again after your passage.";
	move the player to the Attic;
	set pronouns from the Deck;
	increment the score;
	mark used "stairs";
	mark used "dreaming";
	update Bookshelf;
	rule succeeds.
Carry out levitating:
	say "You hide yourself and pray for a short moment."

Chapter 7 - Attacking inanimates and cutting

Table 5 - Standard verbs
first	declension
"cut"	"cutting"
"slice"	"slicing"
"prune"	"pruning"
"chop"	"chopping"
"break"	"broken"
"fight"	"fought"
"hit"	"hit"
"torture"	"tortured"

Check an actor cutting something (this is the new cutting rule):
	if actor is not holding the dagger, say "But you are not holding a blade." instead;

The new cutting rule is listed instead of the block cutting rule in the check cutting rulebook.

First instead of cutting something valuable:
	say "You might need those [if noun is bookish]books[otherwise]cards[end if] whole."

[cutting can apply to: mandala (detaching it); Myen Dalay table (revealing H and He taps); sofa (revealing the balloon)]	
Carry out cutting mandala when noun is fixed in place:
	say "You peel off the mandala very carefully and roll it, so it becomes like a fragile scroll of papyrus. On the back side of it, you see a picture of garden doors with windows.";
	now noun is portable;
	now player carries the noun;
	[now portcullis is publicly-named;]
	now garden doors are described;
	rule succeeds.
Carry out cutting sofa when noun is intact:
	say "[if we have examined the noun]You repeat the first part of reupholstering excercise once again[otherwise]Acting on a sudden intuition, you cut [the noun] open[end if].";
	now noun is gutted;
	now pipe is part of the noun;
	rule succeeds.
Carry out cutting Myen Dalay table:
	now noun is off-stage;
	move Balloon filling station to the Living Room;
	say "Behind the cryptic table of elements you find a hidden cupboard with two taps facing upwards, one on the left and one on the right.";
	rule succeeds.
Carry out cutting:
	say "Cutting it up even further would achieve little.";

Instead of attacking guttable thing:
	let W be word number 1 in player's command in lower case;
	let W1 be text;
	if W is listed in {"attack", "crack", "destroy", "kill", "murder", "punch", "smash", "thump", "wreck"}:
		now W1 is "[W]ed";
	otherwise:
		choose row with first of W in the Table of Standard verbs;
		now W1 is declension entry;
	say "[one of]How do you want to do that[or]How exactly do you want [the noun] to be [W1][at random]?"
Instead of cutting something unguttable when player carries the dagger:
	let W be word number 1 in player's command in lower case;
	choose row with first of W in the Table of Standard verbs;
	let decl be declension entry in title case;
	say "[one of]You ponder [declension entry] [the noun] a bit for a while, but soon realise you have a better way to use your energies[or][decl] [regarding the noun][them] is futile[or]Surely there's something more [W]worth[cycling]."
Understand "tear [something]" as pulling.
Instead of pulling a wall decoration:
	if player is not holding the dagger:
		say "It sticks to the wall adamantly. It seems you cannot peel it off bare-handedly.";
	otherwise:
		try cutting the noun.
Instead of pulling Ouroborous Hatch when location is below Attic:
	say "The rope is too short for you to get hold of it."

Chapter 8 - The Balloon puzzle

The pipe is a thing. The description is "A flexible pipe, like a several elbows long piece of a garden hose."
Instead of searching sofa when noun is gutted and pipe is part of the noun:
	let desc be description of pipe in lower case;
	say "Your search revealed [desc][para]".

Instead of pulling the pipe when the noun is part of the Sofa, say "You manage to untangle some cloth and drag [the pipe] a little, but not too far. While doing that, you discover that [the Sofa] is not too heavy to drag."
	
The Balloon filling station is a pseudobox. "Next to Bookshelf you see, behind the shreds of Myen Dalay table, two taps facing upwards." It has printed name "previously hidden cupboard".
Understand "cupboard" as station when the location is Living Room.
A gas tap is a kind of device. It has description "[if noun is switched on and noun is safe and pipe is not part of the noun]From how the sun rays penetrate the space, you guess that there's some substance, not air, coming out of it[otherwise if noun is flaming]A clear blue flame producing vapour and steam[otherwise if pipe is part of the noun]Attached to it is [the pipe] connected to [the Sofa][otherwise]Like a water tap, but facing upwards[end if]."
[Prevent carry out examining for devices from firing]
Carry out examining a gas tap:
	say "[description of the noun][para]";
	now examine text printed is true;
	rule succeeds.
A gas tap can be flaming or safe. It is usually safe.
The left tap is a gas tap that is a part of station.
Understand "h/hydrogen tap" as left tap.
The right tap is a gas tap that is a part of station.
Understand "he/helium tap" as right tap.
Instead of putting something on a gas tap, try tying the noun to the second noun.
Instead of inserting something into a gas tap, try tying the noun to the second noun.
Instead of tying the pipe to a gas tap:
	if the second noun is switched on:
		if the noun is safe:
			say "You cannot fit [the noun] while the substance is hissing.";
		otherwise:
			say "Ouch! You may burn your fingers doing that.";
	otherwise:
		now the noun is part of the second noun;
		now player knows the noun;
		increment the score;
		say "You attach [the noun] to [the second noun]."
Instead of opening a gas tap, try switching on the noun.
Instead of closing a gas tap, try switching off the noun.
First report smelling a gas tap:
	if the noun is switched on:
		if the noun is safe:
			say "It smells like you would expect from an artificially produced airlike substance.";
		otherwise:
			say "Smells of vapour and steam.";
		rule succeeds.
First report touching a gas tap:
	if the noun is switched on:
		if the noun is safe:
			say "It feels slightly [if the noun is left tap]warmer than usual copper[otherwise]colder than usual silver[end if].";
		otherwise:
			say "It feels definitely warmer than usual copper.";
		rule succeeds.
First report listening to a gas tap:
	if the noun is switched on:
		if the noun is safe:
			say "You hear a faint hiss.";
		otherwise:
			say "Blue flame produces a very quiet roar.";
		rule succeeds.
After switching on a gas tap when pipe is a part of the noun:
	if the Sofa is in the Garden:
		now the Sofa is not pushable between rooms;
	continue the action.
Report switching on a gas tap:
	say "[if pipe is not part of the noun]You turn [the noun] open, and invisible substance starts escaping it with a faint hiss[otherwise if Sofa is in the Garden]Substance from the tap starts to feed the pipe[otherwise]The cloth bulges a bit and stops, unable to let more substance in[end if].";
	rule succeeds.
Before switching off during Harlem:
	if word number 1 in player's command in lower case is "extinguish":
		if noun is left tap and noun is flaming:
			continue the action;
		otherwise:
			say "[regarding the noun][They're] not something you can extinguish.";
			stop the action.
Report switching off a gas tap:
	say "You turn [the noun] closed, and invisible substance stops escaping from it[if noun is flaming]. The blue flame is extinguished[end if].";
	now noun is safe;
	rule succeeds.
Check an actor burning a gas tap:
	if actor is not holding a flint:
		say "You need a source of fire.";
	otherwise if noun is switched off or pipe is part of the noun:
		say "There is nothing to burn, as the tap itself is inflammable.";
	otherwise if noun is left tap:
		say "You make a spark that lights the substance. Clear blue flame produces only water, condensing on the wall and ceiling above the tap.";
		now noun is flaming;
	otherwise:
		say "The substance does not seem to be flammable.";
	rule succeeds.

Every turn when the Sofa is not pushable between rooms and a gas tap is gas filling:
	if player can see the Sofa:
		say "You notice that the bulging cloth becomes [if Sofa is in the Living Room]dangerously [end if]larger. You have only a few minutes left to prepare for your departure.";
	increment the balloon size of the Sofa;
	if the balloon size of the Sofa is 5:
		say "It is time to leave: you [unless player carries the dagger or sofa encloses the dagger]pick up [the dagger], [end if][unless location is Garden]run out to [the Garden], [end if][unless player is on Sofa]get onto [the Sofa] and [end if]cut the ropes.";
		end the story.
Understand "ignite [something]" as burning.
Understand "extinguish [something]" as switching off.

Chapter 9 - Miscellaneous actions (singing, cursing, pinching, thinking)

Understand "sing" as a mistake ("[if player is asleep]You sing [italic type]'Ave Maria'[roman type] but, alas, your Christian faith is not enough right now to achieve much[otherwise]You sing Halleluja[end if].").
Cursing is an action applying to one thing.
Understand "curse [something]" as cursing.
Report cursing something during Harlem:
	if noun is player:
		say "Your family is already cursed, that's why you are here.";
	otherwise if noun is dagger:
		say "Well done. This is the symbol of your family curse!";
	otherwise:
		say "[regarding the noun][They] [seem] to be resistant to your curses.";
	rule succeeds.
Report cursing something:
       say "That kind of action achieves little."

Understand "pinch [something]" as touching when player is asleep.
First report an actor touching during Harlem:
	if the noun is the actor or the noun is part of the actor:
		if the actor is the player:
			if the action is not silent:
				say "You pinch [noun] and don't feel any pain.";
		otherwise:
			continue the action;
		stop the action;
	continue the action.

Table 1 - Player Knowledge
fnoun		fact
hands		"This is a lucid dream, as you've established from looking at your hands."
Nurse		"Your nurse is present here as a ghost."
Carpet		"The carpet from the Living Room is good for doing Yoga."
Secret Drawer	"Meditation on mandala can help to find concealed things."
Chest		"What can you do, now that you have a blade?"
Hatch		"The silver key can unlock hidden doors."
pipe		"Contents of the sofa can be filled with an air-like substance."
Deck		"Winning show-the-number game might get you those potentially useful cards."

Instead of thinking when player knows anything during Harlem:
	say "[bold type]You gained some knowledge...[roman type][para]";
	repeat through the Table of Player Knowledge:
		if player knows the fnoun entry:
			say "[fact entry][para]";

Part 4 - NPCs

Chapter 1 - Talking to Nurse and examining Dragon

The Nurse is a woman that is part of the Hatch. Understand "someone", "somebody", "apparition", "ghost", "spook", "spectre", "specter" or "spirit" as nurse. She has description "The ghost is shimmering in the [location] air, but still you recognise the familiar features."
[TODO ideally, After rules should be silent to allow "try silently" - and we don't want this to be report
examining rule, since it increments the score]
[Cannot use 'for the first time' because of 'read' alias that would abort action in Before examining rule:]
After examining Nurse when we have not examined the noun:
	say "When both your parents were busy socially, they left you and your brother Christian in the care of this woman, whom both of you admired secretly in your puberty and spent many an evening fantasising about, long after she has left your house.";
	if Attic is unvisited and player does not know the noun:
		increment the score;
	now player knows the noun.

Instead of listening to the Nurse, say "Nothing but a light moan can be heard occasionally."
[hinting on Nurse]
Every turn when player does not know the Nurse and the location is not the Garden and the remainder after dividing the turn count by 4 is 0 during Harlem:
	say "[one of]You sense a strange presence in the [location] as if someone were floating, sneaking glances at you occasionally[or]The presence in the air vaguely reminded you of your childhood[or]You are almost tempted to talk to yourself, or[cycling]..."

The Dragon is an addressable thing that is part of the Hatch. It has description "A coiled snake."
Understand "snake" as Dragon.
Instead of attacking dragon:
	if Attic is unvisited:
		say "Nice try, but this fiery snake will not let you pass. Perhaps there's another way around that.";
	otherwise:
		say "Doing it now would achieve nothing."

Talking to is an action applying to one visible thing.
Understand "talk to [someone]" or "talk to [something]" as talking to.
Carry out talking to:
	if the noun is player:
		try asking yourself about anything;
	otherwise if the noun is addressable or the noun is an awake person:
		say "You already have [regarding the noun][their] attention. You may ask [the noun] about something specific.";
	otherwise:
		say "[regarding the noun][They] keep[-s] undisturbable silence."

Instead of telling someone about something, try asking the noun about it. Instead of answering the noun that something, try asking the noun about it.
Instead of asking yourself about something, say "Talking to yourself in that way may result in madness. Perhaps there is someone else in the room you could talk to."

Table of H-quips
topic	sbj	used	down	up	response
"climbing/going/-- the/-- up/stairs/staircase/upstairs" or "the/-- ouroborous/-- attic/hatch"	"stairs"	0	1	0	"[one of]'Hey Andreas, you are asleep, why do you need stairs to go up?', she quips[or]'I told you, no need to find stairs to ascend', answers [the Nurse][stopping]."
"waking/awakening/wakefulness me/myself/-- up/--" or "how to wake up"	"waking up"	1	1	1	"'You are not done yet with this lucid dreaming', she reports."
"this/the/-- sleep/sleeping/dreaming/dreams/dream" or "am I dreaming" or "whether I'm dreaming" or "the/-- lucid/-- dreaming/dreams"	"dreaming"	0	1	1	"'Yes, this is a dream, and pretty lucid, too. You can do things that are not possible in waking life', she reports."
"kabbalah/hexagon/snake/dragon/tail/diagram/yoga/yogis/asana/asanas/elements" or "how to do yoga"	"yoga"	0	1	1	"'This is something I am not at liberty to discuss with you, Andreas, but you may try talking to a different creature here that pretends to be inanimate', she answers."
"books/book/plato/aristotle/zhuangzi/patanjali/daniel/hyperborea/hyperboreans/mayans/calendar/reading/bookshelf" or "book of daniel"	"books"	0	1	0	"'Yup, I read those. Make pretty good reading', she quips."
"opening/unlocking/-- the/-- viking/-- key/lock/reindeer/chest" or "how to unlock/open chest" or "where is the/-- key"	"chest"	0	0	1	"'Concentrate on remembering where the key might be. Sit quiet for a while', she tells you.

'The answer will come.'"

To mark used (subjgiven - a text):
	choose row with sbj of subjgiven in the Table of H-quips;
	if used entry is 0, now used entry is 1;
	now the down entry is 0;
	now the up entry is 0.
[noun here is Nurse]
Before asking the Nurse about something when player does not know the noun:
	if Attic is unvisited:
		increment the score; 
	now player knows the noun.

Check an actor asking the Nurse about topic listed in the Table of H-quips:
	if (the location is Attic and up entry is 1) or (the location is below Attic and down entry is 1):
		say "[response entry][para]";
		increment used entry;
		stop the action.

Report an actor asking something about something during Harlem (this is the suggest a subject rule):
	if the noun is Nurse:
		say "[The noun] murmurs something inconsequential on the subject of your interest, literally sounding '[topic understood]'.";
		if a random chance of 1 in 3 succeeds:
			let L be a list of texts;
			repeat through the Table of H-quips:
				if the location is Attic and up entry is 1 and used entry is 0:
					add sbj entry to L;
				if the location is below Attic and down entry is 1 and used entry is 0:
					add sbj entry to L;
			if L is non-empty:
				let R be a random number from 1 to the number of entries of L;
				let subj be entry R of L;
				choose row with sbj of subj in the Table of H-quips;
				now the used entry is 1;
				say "A possible subject could be [subj].";
	otherwise:
		say "[The noun] keeps blissful silence[if the noun is Dragon], although it may have some theoretical knowledge, that is of no importance for your current task[end if].";
	rule succeeds.
[The block asking rule is not listed in the report asking it about rulebook.
 -- as an excercise with rulebooks, leave block asking rule intact and add our rules before it:]
The suggest a subject rule is listed before the block asking rule in the report asking it about rulebook.

Chapter 2 - Talking to Dragon

Table of Dragon Chatter
topic	remark
["the/-- universe/cosmos" or "what is the universe/cosmos"	"'Yes, cosmos is my creation', it asserts via telepathy, without spitting its tail out"]
"god" or "do you believe in god" or "does god exist" or "is there a god"	"'That would be too simplistic an explanation for all this complexity', it asserts firmly"
"meaning of life"	"'It is circular: the meaning of life is life itself', it answers you via telepathy, without spitting its tail out"
"how to win" or "winning/victory"	"'You can win only by accumulating wisdom, my friend', says [the noun]"
"apple/eden/garden/paradise/adam/eve/genesis" or "the/-- fall" or "the/-- book of genesis" or "the/-- original/-- sin"	"[one of]'You are talking to the wrong snake, dude', it wisecracks[or]'Try reading the Book of Enoch', it advises[or][The Dragon] questions you: 'Have you read the Book of Lilith?'

Don't worry though, that was a rhetorical question[cycling]"

Before asking the Dragon about "[Cosmos]" for the first time, increment the score.
Instead of asking the Dragon about topic listed in the Table of Dragon Chatter:
  say "[remark entry]."
Understand "the/-- universe/cosmos" or "what is the universe/cosmos" as "[Cosmos]".
Instead of asking the Dragon about "[Cosmos]", say "'Yes, cosmos is my creation', it asserts via telepathy, without spitting its tail out."


Chapter 3 - The Card Game

The Desk is a scenery supporter in the Attic.
The Deck is a closed fixed in place container on the Desk. "On the Desk there is [a deck]."
It has printed name "Deck of Simplified Self-knowledge Cards".
It has description "The suits are: [list of suits]. The ranks are: zero, one, two and three. A total of [number of Self-knowledge cards in words] cards."
It has number called handvalue. It has number called devised. The devised is -1.
It has an object called last handled. The last handled is nothing.
[restrict Deck to disallow 'manually' putting items into it]
Instead of inserting something into the Deck when noun is not a Self-knowledge card:
	say "It can contain nothing but cards."
[TODO this will need to be redone if there will be any more desks in the game:]
Understand "write at the/-- desk" or "sit at the/-- desk" as a mistake ("[if the location is Attic]Led by a sudden impulse to write, you try to establish yourself behind the desk, only to discover that there's no functional chair in the Attic[otherwise]You can't see any such thing[end if]." ).
Understand "play solitaire/bridge", "divine my/-- fortune/fortunes/--", "augur my/-- fortune/fortunes/--", "read my/-- fortune" or "tell my/-- fortune" as a mistake ("[if player is holding the Deck]Now you know what they are for, approximately[otherwise if location is Attic and Deck is fixed in place]These cards are indeed for divination, but you must learn or remember them first[otherwise]You lack tools for that[end if].").
Understand "cards", "card/number/-- game" or "self-knowledge" as "[Self-Knowledge Game]".
Definition: Something is ready rather than notready if player can touch it and it is closed and it is fixed in place.
Check asking the Nurse about "[Self-Knowledge Game]":
	if the Deck is ready:
		say "'Do you want to play the game?', she asks.[paragraph break]";
		if player consents:
			say "'Pick four cards one by one. They will add up to a number in a certain way. If you pick a wrong one, you can return it and try again.'[para]";
			now the Deck is open;
			now handvalue of the Deck is 0;
			now devised of the Deck is a random number from 0 to 255;
			say "'Please show me number [devised of the Deck] on four cards.'";
		otherwise:
			say "'Although having those cards is useful for your future adventures, you can do without them, if you must.'";
		stop the action.

Suit is a kind of value. The suits are Past, Future, Separation and Union.
A Self-knowledge card is a kind of proper-named thing. It has a suit.
It has a number called rank. It has a number called ordinal.
Rule for deciding whether all includes Self-knowledge cards: it does not.

There are 16 Self-knowledge cards in the Deck.

To fill cards:
	let N be 0;
	repeat with arcanum running through the Self-Knowledge cards:
		now ordinal of arcanum is N;
		let S be N divided by 4;
		let W be the remainder after dividing N by 4;
		now rank of arcanum is W;
		now suit of arcanum is entry S + 1 of list of suits;
		now printed name of arcanum is substituted form of "[W in words] of [suit of arcanum]";
		move arcanum to the Deck;
		increment N.
When play begins:
	fill cards.

Instead of taking the Deck when Deck is fixed in place, say "You need to collect all sixteen of them, which is not easy during lucid dreaming."
Report examining Deck for the first time:
  say "You have a flash back of you and your Nurse playing 'show-the-number' game[if player does not know the Nurse]. Perhaps she is still around[end if].";

Instead of entering the Desk when the Deck is on the noun:
	let body part be "back or tummy";
	if word number 1 in player's command in lower case is "sit":
		let body part be "arse";
	if player's command matches the regular expression "^step|stand\b", case insensitively:
		let body part be "feet";
	say "The cards would stick to your [body part], so that might be a bad idea."

Handling card is an action applying to one topic. Understand "pick [text]" or "return [text]" as handling card when player can touch the Deck.
After printing the name of a Self-knowledge card: say " (a card)".
To decide which object is the (D - description of objects) referenced as (T - text):
	repeat with X running through D:
		if "[the printed name of X]" matches the text T, case insensitively:
			decide on X;
	decide on nothing.
[Perhaps we can cajole the parser into working with these names correctly. Until that, let's use this trick:]
Instead of doing something to a Self-knowledge card:
	say "Cards can be picked or returned only. To return cards into the deck: 'return <rank> of <suit>' or 'return all'."

Check handling card:
	if the Deck is ready:
		say "The new game of 'show-the-number' has not yet begun.";
	otherwise if the Deck is closed:
		say "[The Deck] is closed.";
	otherwise:
		continue the action;
	stop the action.
Report taking inventory when player carries two Self-knowledge cards:
	let L be a list of texts;
	repeat with X running through Self-knowledge cards carried by the player:
		add printed name of X to L;
	reverse L;
	say "The cards are: [L][if devised of Deck is greater than -1], summing up to [handvalue of Deck]; left-to-right order matters[end if]."
To recount hand with (outcome - a text):
	now handvalue of Deck is 0;
	let quadripower be 64;
	let L be the list of Self-knowledge cards carried by the player;
	reverse L;
	repeat with X running through L:
		now handvalue of Deck is (handvalue of Deck plus (rank of X multiplied by quadripower));
		now quadripower is (quadripower divided by 4);
	say "[outcome] the Deck[if devised of Deck is greater than -1 and L is non-empty]. Cards in your hand in their exact order sum up to [handvalue of Deck][end if].";
To move (L - list of objects) to (C - container):
	repeat with X running through L:
		move X to C;

['the Self-knowledge card referenced as' does not result in interation over entire world: there is a linked list with head at 'Constant IK17_First = I165_zero_of_past;' and iteration looks like for (x=IK17_First: x: x=x.IK17_Link){...} in the generated I6 code.]
Carry out handling card:
	let cmd be the word number 1 in player's command in lower case;
	if (the topic understood matches "it" and the last handled of Deck is a Self-knowledge card) or the topic understood exactly matches the regular expression "(zero|one|two|three) of (past|future|separation|union)$", case insensitively:
		let mycard be nothing;
		if the topic understood matches "it":
			now mycard is last handled of the Deck;
		otherwise:
			now mycard is the Self-knowledge card referenced as the topic understood;
			now last handled of the Deck is mycard;
		if mycard is nothing:
			say "The card '[topic understood]' cannot be found anywhere right now.";
		otherwise if player is not holding mycard and cmd is "pick":
			move mycard to player;
			recount hand with "Taken from";
			let L be the list of Self-knowledge cards carried by the player;
			if devised of Deck is greater than -1 and number of entries in L is 4:
				move L to the Deck;
				if devised of Deck is handvalue of Deck:
					say "You won!";
					[increment score: 2 points if player won at the 1st attempt, 1 point otherwise]
					increment the score;
					if player knows the Deck:
						now player doesn't know the Deck;
					otherwise:
						increment the score;
					now Deck is portable;
					now Deck is openable;
					now player is holding the Deck;
				otherwise:
					say "You lost, but you may try again with a different number.";						
					now Deck is closed;
					[track player's unsuccessful attempt in order to later increment the score]
					now player knows the Deck;
				now handvalue of Deck is 0;
				now devised of Deck is -1;
		otherwise if player is holding mycard and cmd is "return":
			move mycard to the Deck;
			recount hand with "Returned to";
		otherwise:
			say "[if player carries mycard]You already have it[otherwise]It is already there[end if].";
	otherwise if cmd is "return" and the topic understood matches the regular expression "^all( cards)?$":
		let L be the list of Self-knowledge cards carried by the player;
		move L to the Deck;
		if L is non-empty:
			now handvalue of Deck is 0;
			say "[L] [if number of entries in L is greater than 1]were[otherwise]was[end if] returned.[para]" in sentence case;
		otherwise:
			say "You don't have any of those.";
	otherwise:
		say "There's no such card. Pick or return something like 'zero of Past' or 'three of Union'."
