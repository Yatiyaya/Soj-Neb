/mob/living/silicon/ai/verb/wipe_core()
	set name = "Wipe Core"
	set category = "OOC"
	set desc = "Wipe your core. This is functionally equivalent to cryo or robotic storage, freeing up your job slot."

	if(istype(loc, /obj/item))
		to_chat(src, "You cannot wipe your core when you are on a portable storage device.")
		return

	// Guard against misclicks, this isn't the sort of thing we want happening accidentally
	if(alert("WARNING: This will immediately wipe your core and ghost you, removing your character from the round permanently (similar to cryo and robotic storage). Are you entirely sure you want to do this?",
					"Wipe Core", "No", "No", "Yes") != "Yes")
		return

	if(istype(loc, /obj/item))
		to_chat(src, "You cannot wipe your core when you are on a portable storage device.")
		return

	if(is_special_character(src))
		log_and_message_admins("removed themselves from the round via Wipe Core")

	// We warned you.
	empty_playable_ai_cores += new /obj/structure/aicore/deactivated(loc)
	var/obj/item/radio/announcer = get_global_announcer()
	announcer.autosay("[src] has been moved to intelligence storage.", "Artificial Intelligence Oversight")

	//Handle job slot/tater cleanup.
	clear_client()

/obj/abstract/landmark/start/ai
	name = "AI"

/obj/abstract/landmark/start/ai/Initialize()
	. = ..()
	//The job subsystem does its thing before we can, so we've got to handle this
	empty_playable_ai_cores += new /obj/structure/aicore/deactivated(get_turf(loc))