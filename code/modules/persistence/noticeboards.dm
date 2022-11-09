/obj/structure/noticeboard
	name = "notice board"
	desc = "A board for pinning important notices upon."
	icon = 'icons/obj/structures/noticeboard.dmi'
	icon_state = "nboard00"
	density = 0
	anchored = 1
	layer = ABOVE_WINDOW_LAYER
	tool_interaction_flags = TOOL_INTERACTION_DECONSTRUCT

	var/list/notices
	var/base_icon_state = "nboard0"
	var/const/max_notices = 5

/obj/structure/noticeboard/Initialize(var/ml)
	. = ..()

	// Grab any mapped notices.
	if(ml)
		for(var/obj/item/paper/note in get_turf(src))
			add_paper(note, skip_icon_update = TRUE)
			if(LAZYLEN(notices) >= max_notices)
				break

	// Automatically place noticeboards that aren't mapped to specific positions.
	if(default_pixel_x == 0 && default_pixel_y == 0)
		var/turf/here = get_turf(src)
		for(var/checkdir in global.cardinal)
			var/turf/T = get_step(here, checkdir)
			if(T && T.density)
				set_dir(global.reverse_dir[checkdir])
				break

	update_icon()

/obj/structure/noticeboard/set_dir(var/ndir)
	. = ..()
	if(dir & SOUTH)
		default_pixel_y = 32
	else // NORTH is also 0-offset due to the icon.
		default_pixel_y = 0
	if(dir & WEST)
		default_pixel_x = 32
	else if(dir & EAST)
		default_pixel_x = -32
	else
		default_pixel_x = 0
	reset_offsets(0)

/obj/structure/noticeboard/proc/add_paper(var/atom/movable/paper, var/skip_icon_update)
	if(istype(paper))
		LAZYDISTINCTADD(notices, paper)
		paper.forceMove(src)
		if(!skip_icon_update)
			update_icon()

/obj/structure/noticeboard/proc/remove_paper(var/atom/movable/paper, var/skip_icon_update)
	if(istype(paper) && paper.loc == src)
		paper.dropInto(loc)
		LAZYREMOVE(notices, paper)
		if(!skip_icon_update)
			update_icon()

/obj/structure/noticeboard/dismantle()
	for(var/thing in notices)
		remove_paper(thing, skip_icon_update = TRUE)
	. = ..()

/obj/structure/noticeboard/Destroy()
	QDEL_NULL_LIST(notices)
	. = ..()

/obj/structure/noticeboard/explosion_act(var/severity)
	. = ..()
	if(.)
		physically_destroyed()

/obj/structure/noticeboard/on_update_icon()
	..()
	icon_state = "[base_icon_state][LAZYLEN(notices)]"

/obj/structure/noticeboard/attackby(var/obj/item/thing, var/mob/user)
	. = ..()
	if(!.)

		if(isScrewdriver(thing))
			var/choice = input("Which direction do you wish to place the noticeboard?", "Noticeboard Offset") as null|anything in list("North", "South", "East", "West")
			if(choice && CanPhysicallyInteract(user))
				playsound(loc, 'sound/items/Screwdriver.ogg', 50, 1)
				switch(choice)
					if("North")
						set_dir(SOUTH)
					if("South")
						set_dir(NORTH)
					if("East")
						set_dir(WEST)
					if("West")
						set_dir(EAST)
			return TRUE

		if(!istype(thing, /obj/item/paper/sticky) && (istype(thing, /obj/item/paper) || istype(thing, /obj/item/photo)))
			if(jobban_isbanned(user, "Graffiti"))
				to_chat(user, SPAN_WARNING("You are banned from leaving persistent information across rounds."))
			else if(LAZYLEN(notices) < max_notices && user.unEquip(thing, src))
				add_fingerprint(user)
				add_paper(thing)
				to_chat(user, SPAN_NOTICE("You pin \the [thing] to \the [src]."))
			else
				to_chat(user, SPAN_WARNING("You hesitate, certain \the [thing] will not be seen among the many others already attached to \the [src]."))
			return TRUE

/obj/structure/noticeboard/attack_ai(var/mob/user)
	examine(user)

/obj/structure/noticeboard/attack_hand(var/mob/user)
	examine(user)

/obj/structure/noticeboard/examine(mob/user)
	. = ..()
	var/list/dat = list("<table>")
	for(var/thing in notices)
		LAZYADD(dat, "<tr><td>[thing]</td><td>")
		if(istype(thing, /obj/item/paper))
			LAZYADD(dat, "<a href='?src=\ref[src];read=\ref[thing]'>Read</a><a href='?src=\ref[src];write=\ref[thing]'>Write</a>")
		else if(istype(thing, /obj/item/photo))
			LAZYADD(dat, "<a href='?src=\ref[src];look=\ref[thing]'>Look</a>")
		LAZYADD(dat, "<a href='?src=\ref[src];remove=\ref[thing]'>Remove</a></td></tr>")
	var/datum/browser/popup = new(user, "noticeboard-\ref[src]", "Noticeboard")
	popup.set_content(jointext(dat, null))
	popup.open()

/obj/structure/noticeboard/OnTopic(var/mob/user, var/list/href_list)

	if(href_list["read"])
		var/obj/item/paper/P = locate(href_list["read"])
		if(P && P.loc == src)
			P.show_content(user)
		. = TOPIC_HANDLED

	if(href_list["look"])
		var/obj/item/photo/P = locate(href_list["look"])
		if(P && P.loc == src)
			P.show(user)
		. = TOPIC_HANDLED

	if(href_list["remove"])
		remove_paper(locate(href_list["remove"]))
		add_fingerprint(user)
		. = TOPIC_REFRESH

	if(href_list["write"])
		var/obj/item/P = locate(href_list["write"])
		if(!P)
			return
		var/obj/item/pen/pen = locate() in user.get_held_items()
		if(istype(pen))
			add_fingerprint(user)
			P.attackby(pen, user)
		else
			to_chat(user, SPAN_WARNING("You need a pen to write on \the [P]."))
		. = TOPIC_REFRESH

	if(. == TOPIC_REFRESH)
		interact(user)

/obj/structure/noticeboard/anomaly
	icon_state = "nboard05"

/obj/structure/noticeboard/anomaly/Initialize()
	. = ..()
	var/obj/item/paper/P = new()
	P.SetName("Memo RE: proper analysis procedure")
	P.info = "<br>We keep test dummies in pens here for a reason, so standard procedure should be to activate newfound alien artifacts and place the two in close proximity. Promising items I might even approve monkey testing on."
	P.stamped = list(/obj/item/stamp/rd)
	P.overlays = list("paper_stamped_rd")
	add_paper(P, skip_icon_update = TRUE)

	P = new()
	P.SetName("Memo RE: materials gathering")
	P.info = "Corasang,<br>the hands-on approach to gathering our samples may very well be slow at times, but it's safer than allowing the blundering miners to roll willy-nilly over our dig sites in their mechs, destroying everything in the process. And don't forget the escavation tools on your way out there!<br>- R.W"
	P.stamped = list(/obj/item/stamp/rd)
	P.overlays = list("paper_stamped_rd")
	add_paper(P, skip_icon_update = TRUE)

	P = new()
	P.SetName("Memo RE: ethical quandaries")
	P.info = "Darion-<br><br>I don't care what his rank is, our business is that of science and knowledge - questions of moral application do not come into this. Sure, so there are those who would employ the energy-wave particles my modified device has managed to abscond for their own personal gain, but I can hardly see the practical benefits of some of these artifacts our benefactors left behind. Ward--"
	P.stamped = list(/obj/item/stamp/rd)
	P.overlays = list("paper_stamped_rd")
	add_paper(P, skip_icon_update = TRUE)

	P = new()
	P.SetName("READ ME! Before you people destroy any more samples")
	P.info = "how many times do i have to tell you people, these xeno-arch samples are del-i-cate, and should be handled so! careful application of a focussed, concentrated heat or some corrosive liquids should clear away the extraneous carbon matter, while application of an energy beam will most decidedly destroy it entirely - like someone did to the chemical dispenser! W, <b>the one who signs your paychecks</b>"
	P.stamped = list(/obj/item/stamp/rd)
	P.overlays = list("paper_stamped_rd")
	add_paper(P, skip_icon_update = TRUE)

	P = new()
	P.SetName("Reminder regarding the anomalous material suits")
	P.info = "Do you people think the anomaly suits are cheap to come by? I'm about a hair trigger away from instituting a log book for the damn things. Only wear them if you're going out for a dig, and for god's sake don't go tramping around in them unless you're field testing something, R"
	P.stamped = list(/obj/item/stamp/rd)
	P.overlays = list("paper_stamped_rd")
	add_paper(P)

// put actual, filled noticeboards here. These are for adding actual notices via code. Be careful! Anything written here will likely be taken as law by those that read them

/obj/structure/noticeboard/marshal
	name = "Marshal bulletin board"
	desc = "A board containing vital notices and official memos for Marshal Officers."
	icon_state = "nboard03"
	notices = 3

/obj/structure/noticeboard/marshal/New()
//add some memos, make sure to break them up so it's relatively readable in code!
	var/obj/item/paper/P = new()
	P.name = "Memo RE: Equipment handling"
	P.info = "<br>Officers and Troopers alike, remember to properly secure lockers and weaponry. This is not a daycare, you should not need to be reminded that duty-gear is not to be left lying around and unsecured - Agent Sanja"
	P.copy_overlays(list("paper_stamp-dots"), TRUE)
	P.stamped = list(/obj/item/stamp/hos)
	src.contents += P

	P = new()
	P.name = "Memo RE: Recorder"
	P.info = "<br>A small note for all personnel, new and old alike. It has come to our attention that there is a fatal operating error in the software of handheld universal recorders that causes them to make \
	audio files inaccessible should the file fill up. Make a note of it, and switch to a new file BEFORE the recorder turns off due to a full-file, the techies are getting a bit tired of recovering data from these broken files - Ranger Doe"
	P.copy_overlays(list("paper_stamp-dots"), TRUE)
	P.stamped = list(/obj/item/stamp/hos)
	src.contents += P

	P = new()
	P.name = "Memo; Daily Routine"
	P.info = "<hr><hr><b><center>Daily Routine check list</b><br><small>Marshal E.R.T. Officer Moore</small></center><hr> <ul><li>Record checks <small>{Every hour or when needed. Keeping our eyes on the past and those around us is key to stopping any issues that may fall on the colony. As the old saying goes 'The devil hides in the details'.}</small> \
<li> Clearing hallway maintenance tunnels and any potential dangers <small>{The main point is to avoid any local vermin from wandering into the hallways and to reduce any potential injuries. Take it slow if you must and bring back up when needed. You're the last line of defence for the colony when others fail or are too weak to defend themselves. Stay alive and stay smart}</small><li> Scocial presence and patrols \
<small>{Our job is not to sit around and hide in our box, get out there and keep the public trust with a simple 'Hello' and asking about their day. We're what they look to for support when times get tough. Keep your eyes open for possible infractions and always represent the marshals with the safety of the colony in mind}</small> <li> Study and training\
<small>{It's not a shameful thing to look back on your knowledge for help, some days we all need a hand. Being able to keep an active mind like steel and the ability to accurately divine the law will be a well  used skill. Much like our local church they teach us to keep body spirit and mind in balance, so to must we learn to improve on these with mental drills, situational training with our team, and rest when we need it.}</small></ul> <hr><hr>"
	P.copy_overlays(list("paper_stamp-dots"), TRUE)
	P.stamped = list(/obj/item/stamp/hos)
	src.contents += P

	P = new()
	P.name = "Instructions; Bullet Fabrication Operation"
	P.info = "<br>An instructional guide to the usage of our newly aquired bullet fabricator. <br> - Do <b>NOT</b> stick your hand in it. <br> - Do <b>NOT</b> stick your head in it. <br> - Do <b>NOT</b> insert wood into it. <br> - The <b>better</b> quality of the resources inserted, the more ammo you can print; including refined scrap."
	P.copy_overlays(list("paper_stamp-dots"), TRUE)
	P.stamped = list(/obj/item/stamp/hos)
	src.contents += P

/obj/structure/noticeboard/blackshield
	name = "Blackshield bulletin board"
	desc = "A board containing vital notices and official memos for the Blackshield Militia"
	icon_state = "nboard02"
	notices = 2

/obj/structure/noticeboard/blackshield/New()
	var/obj/item/paper/P = new()
	P.name = "Memo RE: Equipment handling"
	P.info = "<br>Officers and Troopers alike, remember to properly secure lockers and weaponry. This is not a daycare, you should not need to be reminded that duty-gear is not to be left lying around - Agent Sanja"
	P.copy_overlays(list("paper_stamp-dots"), TRUE)
	P.stamped = list(/obj/item/stamp/hos2)
	src.contents += P

	P = new()
	P.name = "Memo RE: Gate procedure"
	P.info = "<br>This is a firm reminder to all Blackshield Personnel to draw their attention to the Gate Operations section of S.O.P, <b>particularly</b> the section detailing proper bolting of the gate when present and \
	<b><i>UNBOLTING</b></i> of the gate when NOT present. The next trooper to get a fax sent because he left the foreman bolted outside is going to be scrubbing the latrines with his toothbrust - Sgt Dansen"
	P.copy_overlays(list("paper_stamp-dots"), TRUE)
	P.stamped = list(/obj/item/stamp/hos2)
	src.contents += P

/obj/structure/noticeboard/medical
	name = "Medical bulletin board"
	desc = "A board containing vital notices and official memos for Soteria Medical"
	icon_state = "nboard01"
	notices = 1

/obj/structure/noticeboard/medical/New()
	var/obj/item/paper/P = new()
	P.name = "Memo RE: Initial setup"
	P.info = "<br>Note to all biolab staff:<br> Please remember to set up the cryo cooler to 80K, attach anesthetic tanks to the surgery stands and make the following basic chems -<br><ul> <li> Bicaridine<br><li> Keloderm (1 part Kelotane, 1 part Dermaline)<br>\
	<li> Carthatoline<br><li> Dexalin Plus (in 5u pills)<br> <li> Tramadol (in 5u pills)<br><li> Sanguinum<br><li> Peridaxon using the leftover Cronexadone<br><li> Cronexadone (to be mixed in two parts with the beakers next to the cryo tubes)</ul><br>Thank you Dears - Dr M. Bright"
	P.copy_overlays(list("paper_stamp-dots"), TRUE)
	P.stamped = list(/obj/item/stamp/cmo)
	src.contents += P


/obj/structure/noticeboard/research
	name = "Research bulletin board"
	desc = "A board containing vital notices and official memos for the Soteria research"
	icon_state = "nboard00"
	notices = 1

/obj/structure/noticeboard/research/New()
	var/obj/item/paper/P = new()
	P = new()
	P.name = "Memo RE: Ameridian handling"
	P.info = "Remember, when dealing with Ameridian Crystals, to :<ol> \
	<li> Wear a Radiation Suit. The crystals are radioactive with a radius of 2 meters, and the small ones are as radioactive as the grown ones.\
	<li> Let the crystals grow. Only a fully grown crystal will spread and allow for a sustainable field.\
	<li> Not let it grow out of control. If enough fully matured crystals are close enough together, golems can appear.\
	<li> Retreat past the Sonic Fence if golems appear. The Sonic Fence will instantly destroy the golems that touches it. You can also use the Handheld Sonic emitter to destroy the golem.\
	<li> Not turn off the Sonic Fence or allow it to be turned off. The Sonic Fence is a perfect containment to Ameridian, when it is active. If it turned off, the crystal will be able to spread out of control. If it needs to be turned off for whatever reason, either keep an eye on the crystals, or harvest them all to prevent unwanted spread.\
	<li> Reseed the field. In case the field get removed completely, more crystals can be seeded with either 5 ameridian shard, or by splashing at least 10u of Liquid Ameridian on the floor.\
	<li> Refine the shards. While Ameridian is valuable on its own, it's true value can only be used when refining it into Liquid Ameridian using an Ameridian Refinery, after which it can be further transformed into regular materials in the Liquid Ameridian Processor.\
	<li> Carry the shards through the fence. Your body interfere with the Sonic Fence, allowing you to carry ameridian shards through the fence. The same cannot be said for dragged or thrown crystals, which will get destroyed on contact. Do not throw money away.</ol> "
	P.copy_overlays(list("paper_stamp-dots"), TRUE)
	P.stamped = list(/obj/item/stamp/rd)
	src.contents += P

/obj/structure/noticeboard/guild
	name = "Artificers Guild bulletin board"
	desc = "A board containing vital notices and official memos for the colonies resident Guild"
	icon_state = "nboard00"
	notices = 0

/obj/structure/noticeboard/prospectors
	name = "Prospectors bulletin board"
	desc = "A board containing vital notices and official memos for the colonies most underappreciated trashmen"
	icon_state = "nboard00"
	notices = 0

/obj/structure/noticeboard/lonestar_service
	name = "Lonestar Shipping bulletin board"
	desc = "A board containing vital notices and official memos for Lonestar-Service Employees"
	icon_state = "nboard00"
	notices = 0

/obj/structure/noticeboard/lonestar_supply
	name = "Lonestar Shipping bulletin board"
	desc = "A board containing vital notices and official memos for Lonestar-Supply Employees"
	icon_state = "nboard00"
	notices = 2

/obj/structure/noticeboard/lonestar_supply/New()
	var/obj/item/paper/P = new()
	P.name = "Memo RE: Mining Drills"
	P.info = "<ul><li>seismic activity 1: The lowest possible pretty much. Should be a cakewalk even if you've got basic equipment or don't quite know what you're doing just yet. \
	The scariest you'll run into is a spitter or two, at worst maybe a singular warrior. It'll also be only two burrows per drill, each spewing out groups of three until you smash'em. \
	<li>Seismic activity 2: The biggest difference between 1 and 2 is the fact that the chances for warriors, spitters or worse is higher. Otherwise it is just three burrows that spit out groups of three. \
	<li> Seismic activity 3: While we stay with only three burrows, each of them will now spew out four termites up until you break it, also at a faster rate. \
	<li>Seismic activity 4: Four burrows, four termites and a relatively high chance for beefier termites to show up. \
	<li> Seismic activity 5: Five burrows, four termites. At this point you can expect termites almost every minute out of a burrow, and a burrow every two minutes. Should have some serious firepower if you wanna tackle that. \
	<li> Seismic activity 6: SEVEN BURROWS. FIVE TERMITES. Expect basically ONLY the beefy motherfuckers and get ready to BEAT SHIT DOWN FAST. THEY ARE COMING, AND THERE ARE MANY. Now it's literally two minutes between burrows and only sixty seconds between large groups coming from them. \
	<b>Do not put your drill on an activity 6 spot if you ain't prepared for it, stuff WILL get out of hand, you WILL be overrun.</b></ul><br>Yeah that's about it, see ya'.<br>\
P.S - <u><h1>Don't leave the drills running unattended!</u></h1>"
	P.copy_overlays(list("paper_stamp-dots"), TRUE)
	P.stamped = list(/obj/item/stamp/qm)
	src.contents += P

	P = new()
	P.name = "Memo RE: Ameridian handling"
	P.info = "Remember, when dealing with Ameridian Crystals, to :<ol> \
	<li> Wear a Radiation Suit. The crystals are radioactive with a radius of 2 meters, and the small ones are as radioactive as the grown ones.\
	<li> Let the crystals grow. Only a fully grown crystal will spread and allow for a sustainable field.\
	<li> Not let it grow out of control. If enough fully matured crystals are close enough together, golems can appear.\
	<li> Retreat past the Sonic Fence if golems appear. The Sonic Fence will instantly destroy the golems that touches it. You can also use the Handheld Sonic emitter to destroy the golem.\
	<li> Not turn off the Sonic Fence or allow it to be turned off. The Sonic Fence is a perfect containment to Ameridian, when it is active. If it turned off, the crystal will be able to spread out of control. If it needs to be turned off for whatever reason, either keep an eye on the crystals, or harvest them all to prevent unwanted spread.\
	<li> Reseed the field. In case the field get removed completely, more crystals can be seeded with either 5 ameridian shard, or by splashing at least 10u of Liquid Ameridian on the floor.\
	<li> Refine the shards. While Ameridian is valuable on its own, it's true value can only be used when refining it into Liquid Ameridian using an Ameridian Refinery, after which it can be further transformed into regular materials in the Liquid Ameridian Processor.\
	<li> Carry the shards through the fence. Your body interfere with the Sonic Fence, allowing you to carry ameridian shards through the fence. The same cannot be said for dragged or thrown crystals, which will get destroyed on contact. Do not throw money away.</ol> "
	P.copy_overlays(list("paper_stamp-dots"), TRUE)
	P.stamped = list(/obj/item/stamp/qm)
	src.contents += P


/obj/structure/noticeboard/church
	name = "Church of the Absolute bulletin board"
	desc = "A board containing vital notices and official memos for the faithful"
	icon_state = "nboard00"
	notices = 0

/obj/structure/noticeboard/church/New()
	var/obj/item/paper/P = new()
	P.name = "Memo RE: Bio-gen troubleshooting"
	P.info = "<br>Write this later, idr the steps..."
	P.copy_overlays(list("paper_stamp-dots"), TRUE)
	P.stamped = list(/obj/item/stamp/pr)
	src.contents += P
