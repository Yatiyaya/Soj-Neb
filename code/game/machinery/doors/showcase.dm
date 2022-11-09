/obj/machinery/door/blast/shutters/glass
	name = "showcase"
	icon = 'icons/obj/doors/showcase.dmi'
	icon_state = "closed"
	health = 100
	maxhealth = 100
	opacity = 0
	layer = 4.2
	var/have_glass = TRUE
	hitsound = 'sound/effects/Glasshit.ogg'


/obj/machinery/door/blast/shutters/glass/attack_hand(mob/user)
	return



/obj/machinery/door/blast/shutters/glass/bullet_act(var/obj/item/projectile/Proj)
	if(Proj.get_structure_damage())
		take_damage(Proj.get_structure_damage())
	..()


/obj/machinery/door/blast/shutters/glass/set_broken()
	stat |= BROKEN
	qdel(src)

/obj/machinery/door/blast/shutters/glass/Destroy()
	playsound(loc, 'sound/effects/Glassbr3.ogg', 75, 1)
	new /obj/item/shard(src.loc)
	return ..()

/obj/machinery/door/blast/shutters/glass/update_icon()
	..()
	cut_overlays()
	if(density)
		icon_state = "closed"
		if(!have_glass)
			icon_state += "_empty"
		else if(stat&BROKEN)
			icon_state += "-broken"
		else if(health < maxhealth)
			var/ratio = health / maxhealth
			ratio = CEILING(ratio * 4) * 25
			add_overlay("damage[ratio]")
	else
		icon_state = "open"

/obj/machinery/door/blast/shutters/glass/open()
	if(operating)
		return
	operating = TRUE

	if(!have_glass)
		flick("opening-empty", src)

	else if(stat&BROKEN)
		flick("opening-broken", src)

	else
		var/ratio = health / maxhealth
		ratio = CEILING(ratio * 4) * 25
		cut_overlays()
		flick("opening[ratio]", src)

	density = 0
	operating = FALSE
	update_icon()


/obj/machinery/door/blast/shutters/glass/close()
	if(operating)
		return

	operating = TRUE
	cut_overlays()
	if(!have_glass)
		flick("closing-empty", src)
		icon_state = "closed-empty"

	else if(stat&BROKEN)
		flick("closing-broken", src)
		icon_state = "closed-broken"

	else
		var/ratio = health / maxhealth
		ratio = CEILING(ratio * 4) * 25
		flick("closing[ratio]", src)

	density = 1
	update_icon()
	airlock_crush()
	operating = FALSE
