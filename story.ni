Chapter 1 - Definitions

Field is a room. The description of Field is "The field is a field of flowers. East of the field is a forest. The forest seems dark and menacing. Visiting the forest instinctively feels like a bad idea before getting some rest. West of the field, a large, rustic house in a clearing peaks out from the distance."

Forest is a room. "Trees thickly surround you. Every direction seems to be a mass of greenery. You can see what looks like it used to be a path to the east, but it is quite overgrown.".

Clearing is a room. "The Clearing is small and rustic.".

The times looked in field is a number that varies. The times looked in field is a number that varies.

Nobi is a person.

Bed is an object. Bed is contained by House. "A big, soft bed. It looks very comfortable."

Wilderness is a room. "A vast forest untamed by humanity. It seems to swallow you up almost instantly, immediately destroying any sense of direction that you previously had."

The description of the basement door is "A thick steel door that is shut. It seems to lead to a basement.". The door is locked. The door is openable.  

Arrows is an object. Arrows is contained by House. "A quiver of arrows leans against the wall in the corner."

The basement door is west of Clearing and east of BasementRoom.

BasementRoom is a room."A dark basement dimly lit."

Cage is a container in BasementRoom.

Nobi is contained by Cage.

Poisoned arrows is an object. "A quiver of arrows with some sort of foul smell emitting from it. They seemd dangerous.";

The House is an enterable container. The House is closed and locked.

House is in the Clearing. The description of the House is "It looks like a cozy house with a door. You can't see what's inside until you enter."

mortar is an object contained by the House. The description of the mortar is "A heavy stone mortar, perfect for grinding things."

The mushroom is an object. The description of mushroom is "You see some weird looking mushroom. They seem to be an unrecognizable variety.".

mushroom are edible.

Mushroom paste is an object. The description of mushroom paste is "A smooth, greenish paste made from the mushroom." 

Mushroom paste is not edible.

Steps to evil is a number that varies. Steps to evil is 0.

Barrel is an object. Barrel is contained by House. Barrel is a container. "A small wooden barrel".

Meat is an object. Meat is contained by Barrel. Meat is edible. "Some sort of meat. It has been cured and dried.".

Bow is an object. Bow is contained by House. "A large wooden bow hangs from a peg on the wall."

A door is a kind of thing.

The basement door is a door.  

Steve's blood is an object. 

The player's action count is a number that varies. The player's action count is 0.

The player has a truth state called rulebreaker. The rulebreaker of the player is false.

Steve has a truth state called exposed. The exposed of Steve is false.

Instead of taking house:
	say "You are not superman. You can't pick up an entire house.";

Steve is a man in Clearing. The description of Steve is "Steve is standing outside of his house thinking."

Steve has a number called anger. The anger of Steve is 0.

Steve can be alive or dead. Steve is alive.

The player's steve counter is a number that varies. The player's steve counter is 0.

Asking Steve for anything is bothering Steve. Telling Steve about anything is bothering Steve.

Wolf is an object. Wolf is in forest. The description of the Wolf is "A fierce-looking wolf with sharp eyes."

The Wolf has a truth state called tamed. The tamed of the Wolf is false.

Chapter 2 - Actions
	
Dripping is an action applying to nothing. Understand "drip blood" as dripping.

Shooting is an action applying to one thing. Understand "shoot [something]" as shooting.

Completing the ritual is an action applying to nothing. Understand "complete the ritual" as completing the ritual.

Applying is an action applying to one thing. Understand "apply [something]" as applying.

Feeding is an action applying to one thing. Understand "feed [something]" as feeding.

Understand "grind [something]" as processing. Understand "mash [something]" as processing. Understand "crush [something]" as processing.

Talking is an action applying to one thing. Understand "talk to [somebody]" as talking.

Following is an action applying to one thing. Understand "follow [something]" as following.

Processing is an action applying to one thing. Understand "process [something]" as processing.

Drawing is an action applying to one thing. Understand "draw [something]" as drawing.
	
Draining is an action applying to one object. Understand "drain [somebody]" as draining.

Chapter 3 - Rules
		
After taking something:
	say "You pick up [noun].";

To shoot Steve:
	if the player is carrying the bow:
		if the player is carrying arrows or the player is carrying poisoned arrows:
			try attacking Steve;
			rule succeeds;
	say "You don't have anything to shoot him with.";

To shoot Wolf:
	if the player is carrying the bow:
		if the player is carrying arrows or the player is carrying poisoned arrows:
			try attacking Wolf;
			rule succeeds;
	say "You don't have anything to shoot it with.";
	
Instead of looking in the House:
	if the player is in the House:
		continue the action;
	otherwise:
		say "You can't look inside until you enter it."

Instead of examining the House:
	if the player is in the House:
		continue the action;
	otherwise:
		say "You can't see inside the house until you enter it."

Instead of entering the House:
	if the player's steve counter is 0:
		say "You can't go in Steve's house without even talking to him.";
		stop the action;
	if the rulebreaker of the player is false:
		now the player is in the House;
		now the house is open;
		now the house is unlocked;
		say "You step inside the house. It's surprisingly well-lit and welcoming.";
	otherwise:
		end the story saying "Steve catches you trying to sneak back into his house. He says 'I hate to kill you, but there was only one thing you needed to refrain from.' Then he kills you ... "

Rule for printing the name of the House: 
    say "cozy wooden house";
    omit contents in listing.

Rule for printing the name of the basement door:
	if the player is in the House:
		continue the action;
	otherwise:
		say "big door through the window of the house";
		rule succeeds.

Before taking something:
	if the player is enclosed by an enterable container (called C) or the player is enclosed by an enterable supporter (called S):
		if the noun is not enclosed by C and the noun is not enclosed by S:
			say "You can't reach [the noun] from here." instead.
Every turn:
	increase the player's action count by 1;
	if the tamed of the Wolf is true:
		move the Wolf to the location of the player.

After eating mushroom:
    end the story saying "You really thought that was safe? Obviously they were poisoned. You collapse to the ground and pass away."

Instead of taking basement door:
	say "You can't take an entire door.";
	
Instead of examining the player:
    say "You have performed [the player's action count] actions so far."

Instead of going through the basement door:
	if the basement door is closed:
		say "The door is shut, and you can't pass through it.";
		stop the action;
	move the player to basementRoom;
	Let flip be a random number from 1 to 25;
	if flip is 1:
		now the rulebreaker of the player is true;
		say "Steve might have noticed you opening the basement door. It might be dangerous to enter his house again.";
		rule succeeds;
	say "A risky move. You make it through without Steve noticing.";

Instead of going west:
	if the player is in Wilderness:
		move the player to Forest;
		the rule succeeds;
	if the player is in Field:
		move the player to Clearing;
		the rule succeeds;
	if the player is in Forest:
		move the player to Field;
		the rule succeeds;
	if the player is in Basement:
		say "There is a wall to the west.";
		the rule succeeds;
	if the player is in Clearing:
		if the player's steve counter is 0:
			say "You can't go in Steve's house without even talking to him.";
			stop the action;
		if the rulebreaker of the player is false:
			now the player is in the House;
			now the house is open;
			now the house is unlocked;
			say "You step inside the house. It's surprisingly well-lit and welcoming.";
		otherwise:
			end the story saying "Steve catches you trying to sneak back into his house. He says 'I hate to kill you, but there was only one thing you needed to refrain from.' Then he kills you ... "

After looking:
	if the player is in the field:
		increase the times looked in field by 1;
		if times looked in field is 3:
			now mushroom is in the field;
	continue the action;

After entering Wilderness:
	if the tamed of the wolf is false:
		end the story saying "You try to make your way through the wilderness but quickly get lost. Days seem to fly by as you make do by substaining on whatever scraps of food you find around you. Eventually, you eat a poisonous fruit and die.";
	say "You are bewildered by the massive forest surrounding you but the wolf still seems to have some sense of direction. It nudges you, seemingly desiring for you to follow it.";

After following wolf:
	if the tamed of the wolf is true:
		end the story saying "Despite your inability to navigate the wilderness, the wolf seems to have an almost supernatural sense of direction. By following it you eventually make your way deep into the forest. At one point, you seem to cross an invisible line and find yourself in Northfield, Minnesota standing on a sidewalk confused about what to do. Nonetheless, you breath a sigh of relief, finally having escaped whatever torturous place you had just found yourself in.";
	say "The wolf seems to be out of its right mind. It is just pacing around in circles panting with hunger.";

After following something:
	if the noun is not wolf:
		say "You can't follow [noun]";

Instead of going east:
	if the player is in Clearing:
		move the player to Field;
		the rule succeeds;
	if the player is in House:
		move the player to Clearing;
		the rule succeeds;
	if the player is in Basement:
		say "There is a wall to the east.";
		the rule succeeds;
	if the player is in Field:
		move the player to Forest;
		the rule succeeds;
	if Steve is dead:
		move the player to the wilderness;
	otherwise:
		say "Before you can enter the wilderness, Steve suddenly appears in front of you. He makes a gesture and an invisible wall seems to appear, stopping you from moving forwards. He says 'I hoped it wouldn't come to this. I am sorry but I cannot let you cross here. It is too risky if you escape this place.' before vanishing again.";
		now the exposed of Steve is true;

Instead of taking Barrel:
	say "It is nailed to the ground.";

After talking Nobi:
	say "He responds quietly 'Please help me escape this hellhole. I just want freedom.'";
	
After taking mushroom:
	now steps to evil is 1;

After processing mushroom:
	now steps to evil is 2;

After applying mushroom paste:
	now steps to evil is 3;

Instead of taking Cage:
	say "It is too heavy.";

Instead of taking Nobi:
	stop the action;

Instead of taking something:
	if the number of things carried by the player is greater than 4:
		say "You can't carry any more stuff.";
	otherwise:
		now the player carries the noun.

Instead of eating Meat:
	say "You are not hungry.";
	
Instead of talking Steve:
	now the player's steve counter is 1;
	if Steve is alive:
		if the anger of Steve is 0:
			say "Steve notices you and looks up. 'Hello traveler. I'm Steve. If you need somewhere to stay tonight feel free to come into my house. Just make sure not to go in the basement. You cannot go in the basement but anything else is ok. If you have any questions to ask me I am happy to answer them,' he says.";
		otherwise:
			say "Steve ignores you.";
	otherwise:
		say "You can't talk to Steve. He is dead.";

Instead of taking Steve:
	if the anger of Steve is 0:
		say "Steve says 'What the hell! Get off me.'";
		now the anger of Steve is 1;
	otherwise:
		say "Steve frowns. He menacingly tells you 'You are making me angry. Get away from my house.'";
		now the anger of Steve is 2;

Instead of bothering Steve:
	now the player's steve counter is 1;
	if Steve is alive:
		if the anger of Steve is 0:
			say "Steve notices you and looks up. 'Hello traveler. I'm Steve. If you need somewhere to stay tonight feel free to come into my house. Just make sure not to go in the basement. You cannot go in the basement but anything else is ok. If you have any questions to ask me I am happy to answer them,' he says.";
		otherwise:
			say "Steve ignores you.";
	otherwise:
		say "You can't talk to Steve. He is dead.";

Instead of attacking Steve:
	if the player is carrying the bow and the player is carrying the arrows:
		end the story saying "You shoot Steve through the heart. He seemingly doesn't even react to the arrow sticking out of his chest. 'Did you really think that I am a being of flesh and blood like you?' he says disdainfully. Then he kills you.";
	if the player is carrying the bow and the player is carrying the poisoned arrows:
		say "You shoot Steve through the hear. He seemingly doesn't even react to the arrow sticking out of his chest. 'Did you really think that ...' he begins before interuptting himself by coughing up blood. 'What! How could you find such a poison.' he chokes out, before keeling over and dieing.";
		now Steve is dead;
		now the steps to evil is 4;
		the rule succeeds;
	end the story saying "You try attacking Steve but are simply too weak. He easily dispatches you. Still, appreciating your courage in the attempt, he buries you with honor.";

Instead of attacking Wolf:
	say "How foolish. Nature is much too powerful for any man to defeat. It tears you to pieces.";
	end the story.

Instead of taking Wolf:
	if the tamed of the Wolf is true:
		say "The wolf, seeming to have enjoyed its meal, now is following you.";
	otherwise:
		say "The wolf rushes over, seemingly almost gone mad with hunger. You attempt to flee but trip over a vine and are devoured.";
		end the story.

Instead of feeding Wolf:
	if player is carrying Meat:
		now the tamed of Wolf is true;
		remove the meat from play;
		say "The wolf dashes over and digs into the meat. Afterwards, it hesitantly nudges over towards you. It seems friendly. The wolf seems to want you to follow it somewhere.";
	otherwise:
		say "That isn't edible. Maybe Steve's house has some food.".

Instead of feeding Steve:
	if player is carrying Meat:
		say "Steve isn't hungry.";
	otherwise:
		say "That isn't edible.".

Chapter 4 - Conversation

Table of Nobi Responses 1
topic	question type	reply
"Nobi/he/it"	what	"'I,' Nobi muses, 'am just an innocent traveler like you. Steve deceived me and trapped me here against my will.'"
"Nobi/he/it"	who		"'I,' Nobi muses, 'am just an innocent traveler like you. Steve deceived me and trapped me here against my will.'"
"trapped/imprisoned/stuck"	why		"'I don't know,' Nobi says thoughtfully, 'but I just want to get out of here.'"
"Steve"	who		"'I don't know. I don't even know why he decided to trap me here. Please help me!' Nobi begs."
"free/help/assist"    	how	    	         "'You need to find a poisonous mushroom in the field.'Nobi explains. He continues, 'Then come back here. I can keep leading you.'"

Table of Nobi Responses 2
topic	question type	reply
"Nobi/he/it"	what	"'I,' Nobi muses, 'am just an innocent traveler like you. Steve deceived me and trapped me here against my will.'"
"Nobi/he/it"	who		"'I,' Nobi muses, 'am just an innocent traveler like you. Steve deceived me and trapped me here against my will.'"
"trapped/imprisoned/stuck"	why		"'I don't know,' Nobi says thoughtfully, 'but I just want to get out of here.'"
"Steve"	who		"'I don't know. I don't even know why he decided to trap me here. Please help me!' Nobi begs."
"free/help/assist"    	how	    	         "'Bring the mushroom you found to the mortar in Steve's house.'Nobi explains. He continues, 'Grind it into a paste with that mortar. Then come back here. I can keep leading you.'"

Table of Nobi Responses 3
topic	question type	reply
"Nobi/he/it"	what	"'I,' Nobi muses, 'am just an innocent traveler like you. Steve deceived me and trapped me here against my will.'"
"Nobi/he/it"	who		"'I,' Nobi muses, 'am just an innocent traveler like you. Steve deceived me and trapped me here against my will.'"
"trapped/imprisoned/stuck"	why		"'I don't know,' Nobi says thoughtfully, 'but I just want to get out of here.'"
"Steve"	who		"'I don't know. I don't even know why he decided to trap me here. Please help me!' Nobi begs."
"free/help/assist"    	how	    	         "'Take that paste and apply it to Steve's arrows. Take the bow and the arrows.'Nobi explains. He continues, 'Then come back here. I can keep leading you.'"

Table of Nobi Responses 4
topic	question type	reply
"Nobi/he/it"	what	"'I,' Nobi muses, 'am just an innocent traveler like you. Steve deceived me and trapped me here against my will.'"
"Nobi/he/it"	who		"'I,' Nobi muses, 'am just an innocent traveler like you. Steve deceived me and trapped me here against my will.'"
"trapped/imprisoned/stuck"	why		"'I don't know,' Nobi says thoughtfully, 'but I just want to get out of here.'"
"Steve"	who		"'I don't know. I don't even know why he decided to trap me here. Please help me!' Nobi begs."
"free/help/assist"    	how	    	         "'Very good. Now take that bow and arrow and shoot Steve. The paste will kill him, letting us both escape from this place.' Nobi explains. He continues, 'Then come back here. I can keep leading you.'"

Table of Nobi Responses 5
topic	question type	reply
"Nobi/he/it"	what	"'I,' Nobi muses, 'am just an innocent traveler like you. Steve deceived me and trapped me here against my will.'"
"Nobi/he/it"	who		"'I,' Nobi muses, 'am just an innocent traveler like you. Steve deceived me and trapped me here against my will.'"
"trapped/imprisoned/stuck"	why		"'I don't know,' Nobi says thoughtfully, 'but I just want to get out of here.'"
"Steve"	who		"'I don't know. I don't even know why he decided to trap me here. Please help me!' Nobi begs."
"free/help/assist"    	how	    	         "'Drain Steve's blood. Bring it here after that.'Nobi explains. He continues, 'Then come back here. I can keep leading you. This is the only way for us to escape.'"

Table of Nobi Responses 6
topic	question type	reply
"Nobi/he/it"	what	"'I,' Nobi muses, 'am just an innocent traveler like you. Steve deceived me and trapped me here against my will.'"
"Nobi/he/it"	who		"'I,' Nobi muses, 'am just an innocent traveler like you. Steve deceived me and trapped me here against my will.'"
"trapped/imprisoned/stuck"	why		"'I don't know,' Nobi says thoughtfully, 'but I just want to get out of here.'"
"Steve"	who		"'I don't know. I don't even know why he decided to trap me here. Please help me!' Nobi begs."
"free/help/assist"    	how	    	         "'We are almost free from this place. I just need you to paint a diagram on this door. Then drip some of your blood on it. By completing that ritual, 'Nobi explains, 'I will be set free. Then I can take us out of this place.'"

Table of Steve Responses 1
topic	question type	reply
"Steve/he/it"	what	"'I,' Steve muses, 'am just an innocent farmer. I have been living here for many years.'"
"Steve/he/it"	who		"'I,' Steve muses, 'am just an innocent farmer. I have been living here for many years.'"
"trap Nobi/imprison Nobi/trapped Nobi/imprisoned Nobi"	why		"'You must have heard him when you stayed at my house. I am so sorry. Nobi murdered my family. I used to live here with them. I have stayed here in an effort to keep him contained so nobody else faces the horrors that I did.' explains Steve solemnly."
"to escape/to get out/to get away/to leave"	how  	         "'I don't know. There used to be a path through the forest but nowadays, it is much too overgrown for anybody to find their way out.'"
"help/assist/live"    	how  	         "'You can try to find your own way home or stay here and accept a life here. I have adjusted to living here after so long myself.'"
"do"    	what	    	         "'I don't know. You could try to find your own way out of here.'"

Table of Steve Responses 2
topic	question type	reply
"Steve/he/it"	what	"'I,' Steve muses, 'am a person who has given their all for the good of the world. It might not make sense to you, but without me everything would be ruined.'"
"Steve/he/it"	who		"I,' Steve muses, 'am a person who has given their all for the good of the world. It might not make sense to you, but without me everything would be ruined.'"
"trap Nobi/imprison Nobi/trapped Nobi/imprisoned Nobi"	why		"'That thing,' Steve spits out, 'is a great evil on this world. The dark ages would come again if it managed to escape.'"
"escape/leave/get out/get away"    	how	    	         "'I am sorry, but now that you have seen me, I cannot risk your escape. Even without you knowing, there are beings that might find the entrance to this place through you and free that demon from here.' Steve says apologetically.'However, as long as you don't try to act against me, you can continue living here peacefully until the end of your life. I am sure you will get used to it after a while.'"

Table of Steve House Responses
topic	question type	reply
"house/dwelling/residence/living"	what	"'My house,' Steve deliberates, 'Yes of course you can rest in my house.'"
"house/dwelling/residence/living"	why	"'My house,' Steve deliberates, 'Yes of course you can rest in my house.'"
"house/dwelling/residence/living"	where	"'My house,' Steve deliberates, 'Yes of course you can rest in my house.'"
"house/live/survive/endure"	how	"Steve thinks for a minute. Then he says 'Of course you can stay in my house.'"

Table of Steve About Responses
topic	reply
"house/dwelling/residence/living"	"'My house,' Steve deliberates, 'Yes of course you can rest in my house.'"
"housing/living/surviving/enduring"	"Steve thinks for a minute. Then he says 'Of course you can stay in my house.'"

Interrogative is a kind of value. 
The interrogatives are who, what, when, where, how, and why.

Current question is an interrogative that varies.

Understand "ask [someone] about [text]" as asking it about.

Understand "ask [someone] [text]" as asking it about.

After asking Nobi about something:
    respond to the question.

After asking Steve about something:
	if Steve is alive:
		answer the question;
	otherwise:
		say "You can't ask Steve any questions. He is dead.";
		
To answer the question:
	repeat through the table of Steve About Responses:
		if the topic understood includes topic entry:
			say "[reply entry][paragraph break]";
			now the player's steve counter is 1;
			rule succeeds;
	if the anger of Steve is 2 or the anger of Steve is 3:
		say "I am fed up talking to you. Leave me alone";
		now the player's steve counter is 1;
		rule succeeds;
	repeat through the table of Steve House Responses:
		if the topic understood includes topic entry:
			if the current question is the question type entry:
				say "[reply entry][paragraph break]";
				now the player's steve counter is 1;
				rule succeeds;
	if the exposed of Steve is false:
		repeat through the Table of Steve Responses 1:
			if the topic understood includes topic entry:
				if the current question is the question type entry:
					say "[reply entry][paragraph break]";
					rule succeeds;
	if the exposed of Steve is true:
		repeat through the Table of Steve Responses 2:
			if the topic understood includes topic entry:
				if the current question is the question type entry:
					say "[reply entry][paragraph break]";
					rule succeeds;
	say "Sorry I don't know what you're talking about. If you have any more specific questions maybe I can answer them though."
	
After reading a command:
	if the player's command includes "[interrogative]":
		now the current question is the interrogative understood.

To respond to the question:
	if steps to evil is 0:
		repeat through the Table of Nobi Responses 1:
			if the topic understood includes topic entry:
				if the current question is the question type entry:
					say "[reply entry][paragraph break]";
					rule succeeds;
	otherwise if steps to evil is 1: 
		repeat through the Table of Nobi Responses 2:
			if the topic understood includes topic entry:
				if the current question is the question type entry:
					say "[reply entry][paragraph break]";
					rule succeeds;
	otherwise if steps to evil is 2: 
		repeat through the Table of Nobi Responses 3:
			if the topic understood includes topic entry:
				if the current question is the question type entry:
					say "[reply entry][paragraph break]";
					rule succeeds;
	otherwise if steps to evil is 3: 
		repeat through the Table of Nobi Responses 4:
			if the topic understood includes topic entry:
				if the current question is the question type entry:
					say "[reply entry][paragraph break]";
					rule succeeds;
	otherwise if steps to evil is 4: 
		repeat through the Table of Nobi Responses 5:
			if the topic understood includes topic entry:
				if the current question is the question type entry:
					say "[reply entry][paragraph break]";
					rule succeeds;
	otherwise if steps to evil is 5 or the steps to evil is 6: 
		repeat through the Table of Nobi Responses 6:
			if the topic understood includes topic entry:
				if the current question is the question type entry:
					say "[reply entry][paragraph break]";
					rule succeeds;
	say "Nobi shifts. 'That doesn't matter.' he says.'Please help me escape from this place.'";

Chapter 5 - Evil storyline stuff

Instead of processing something:
	if noun is not mushroom:
		say "That isn't processable.";

Instead of processing mushroom:
	if player is contained by House:
		say "You grind the mushroom into a paste and store it in a bag.";
		now the player is carrying mushroom paste;
		now mushroom is nowhere;
		now the steps to evil is 3;
	otherwise:
		say "Process it with what?";

Instead of dropping mushroom paste:
	say "That might come in handy. Maybe you could apply it to a weapon.";

Instead of taking mortar:
	say "It's too heavy to move.";
	stop the action;

Instead of applying mushroom paste:
	if player is contained by House:
		if arrows is contained by House:
			say "You apply the paste to the arrows.";
			now arrows is nowhere;
			now poisoned arrows are contained by House;
			now the steps to evil is 4;
	otherwise:
		say "Apply it to what?";

After draining Steve:
	if Steve is dead:
		now Steve is nowhere;
		now the player is carrying Steve's blood;
		now the steps to evil is 5;
	otherwise:
		say "Steve isn't just going to let you do that.".

After drawing blood:
	if the player is in the house:
		say "You complete the pentagram on the metal door to the cage with blood as instructed by Nobi. Now the last step is to drip your own blood on that door.";
		now the steps to evil is 6;
	otherwise:
		say "Why would you do that here?";

Instead of dripping:
	if the steps to evil is 6:
		end the story saying "You complete the ritual as instructed by Nobi. The door creaks open and something inhuman rushes out. Before you can process what you are seeing, your vision goes black. You die.";
		
Instead of completing the ritual:
	if the player is in House:
		if the steps to evil is 5:
			try drawing blood;
			rule succeeds;
		if the steps to evil is 6:
			try dripping;
			rule succeeds;
	if the steps to evil is 5 or the steps to evil is 6:
		say "You can't do that here.";
		rule succeeds;
	say "What's that?";

Chapter 6 - Sleep and dreams

Table of Dreams
dream number	dream text
1	"You find yourself standing in a peaceful meadow, surrounded by flowers. The sun is shining, and everything feels calm... until you hear a distant echo coming from the basement of the house. You shiver, but the vision fades as quickly as it appeared. Suddenly, you awake, heart racing."
2	"You’re walking down a long corridor of your childhood home, the familiar creak of the floorboards beneath your feet. Suddenly, a door at the end of the hall opens by itself. You hesitate. Something from the basement calls your name, a voice too low to understand. You turn, but no one is there. You feel a cold chill and wake up in a start."
3	"The kitchen is warm, and the smell of fresh bread fills the air. Steve walks in with a broad smile, handing you a slice. You accept it, but as you bite down, the room warps. The walls begin to breathe, and the ground beneath you cracks open, revealing an endless staircase leading down to the basement. A voice whispers your name, but before you can respond, you wake up, drenched in sweat."
4	"You're sitting on a beach, the sound of waves gently lapping at the shore. The sky is a soft orange as the sun sets. As you relax, you notice something strange – a dark figure standing at the edge of the water, calling for you in a voice that sounds eerily familiar. You turn, but when you look back, the figure is gone. You blink, and suddenly, you awake with a jolt."
5	"You walk into the living room, where the fireplace is crackling. There’s a sense of peace, but then the fire sputters and goes out. A cold draft fills the room, and you hear faint footsteps coming from the basement. The door to the basement creaks open, and a voice, hoarse and desperate, beckons you closer. You try to take a step forward, but everything goes black and you wake up, breathless."
6	"You're climbing a ladder in a vast, dark space. You reach a door at the top, but as you push it open, you're plunged into darkness. A deep voice calls from below, and you feel a pull, an unnatural force urging you to go down. The darkness churns and seems alive, like it's waiting for you. Before you can move, the dream shatters and you wake up with a racing heartbeat."
7	"The room is familiar, but the shadows seem longer than usual. You're in the attic, rummaging through boxes when a sudden crash from below startles you. You run downstairs, but as you approach the basement door, you hesitate. There’s something down there... something calling your name, drawing you toward it. You step forward, and in an instant, you wake up, gasping for air."
8	"You’re back in your childhood bedroom, the smell of fresh laundry in the air. You sit on the bed, and everything seems perfectly normal. But then you hear a scraping sound from the basement—louder, closer. You get up and start toward the door, but a voice says, ‘Don’t go.’ It sounds like your own voice, but twisted. With a start, you wake up, feeling uneasy."
9	"The landscape around you is shifting rapidly, a blur of colors and shapes. You can’t keep up, and as the world spins, you hear something from the basement—low, guttural, almost growling. It’s like it’s calling to you, pulling you deeper into the chaos of your dream. Just as it reaches for you, you wake up, disoriented and anxious."
10	"You’re sitting at a table, having dinner with friends. It’s calm, and everything feels right. But suddenly, the walls start to close in, and the basement door creaks open by itself. A strange force compels you to approach. Just as you reach for the handle, you’re jolted awake, your heart racing."


Dream is a number that varies.

Instead of sleeping:
	if the player is contained by House:
		say "You quickly fall asleep on the bed. Then, you quickly slip into dream.";
		now dream is a random number from 1 to 10;
		say the dream text in row dream of the Table of Dreams;
		rule succeeds;
	say "There is nowhere to sleep here.";
