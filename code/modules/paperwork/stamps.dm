/obj/item/stamp
	name = "rubber stamp"
	desc = "A rubber stamp for stamping important documents."
	icon = 'icons/obj/bureaucracy.dmi'
	icon_state = "stamp-deckchief"
	item_state = "stamp"
	throwforce = 0
	w_class = ITEM_SIZE_TINY
	throw_speed = 7
	throw_range = 15
	material = /decl/material/solid/metal/steel
	attack_verb = list("stamped")

/obj/item/stamp/captain
	name = "captain's rubber stamp"
	icon_state = "stamp-cap"

/obj/item/stamp/ce
	name = "chief engineer's rubber stamp"
	icon_state = "stamp-ce"

/obj/item/stamp/rd
	name = "chief science officer's rubber stamp"
	icon_state = "stamp-rd"

/obj/item/stamp/cmo
	name = "chief medical officer's rubber stamp"
	icon_state = "stamp-cmo"

/obj/item/stamp/denied
	name = "\improper DENIED rubber stamp"
	icon_state = "stamp-deny"

/obj/item/stamp/clown
	name = "clown's rubber stamp"
	icon_state = "stamp-clown"

/obj/item/stamp/boss
	name = "boss' rubber stamp"
	icon_state = "stamp-boss"

/obj/item/stamp/boss/Initialize()
	name = "[global.using_map.boss_name]'s' rubber stamp"
	. = ..()

/obj/item/stamp/cargo
	name = "cargo rubber stamp"
	icon_state = "stamp-cargo"

// Syndicate stamp to forge documents.
/obj/item/stamp/chameleon/attack_self(mob/user)

	var/list/stamp_types = typesof(/obj/item/stamp) - src.type // Get all stamp types except our own
	var/list/stamps = list()

	// Generate them into a list
	for(var/stamp_type in stamp_types)
		var/obj/item/stamp/S = new stamp_type
		stamps[capitalize(S.name)] = S

	var/list/show_stamps = list("EXIT" = null) + sortTim(stamps, /proc/cmp_text_asc) // the list that will be shown to the user to pick from

	var/input_stamp = input(user, "Choose a stamp to disguise as.", "Choose a stamp.") in show_stamps

	if(user && (src in user.contents))

		var/obj/item/stamp/chosen_stamp = stamps[capitalize(input_stamp)]

		if(chosen_stamp)
			SetName(chosen_stamp.name)
			icon_state = chosen_stamp.icon_state

// SOJ

/obj/item/stamp/hop
	name = "steward's rubber stamp"
	icon_state = "stamp-hop"

/obj/item/stamp/hos
	name = "warrant officer's rubber stamp"
	icon_state = "stamp-hos"

/obj/item/stamp/hos2
	name = "blackshield commander's rubber stamp"
	icon_state = "stamp-hos"

/obj/item/stamp/pr
	name = "prime's rubber stamp"
	icon_state = "stamp-pr"

/obj/item/stamp/qm
	name = "chief executive officer's stamp"
	icon_state = "stamp-qm"

/obj/item/stamp/fr
	name = "foreman's stamp"
	icon_state = "stamp-fr"