/obj/random/flora
	name = "random flora"
	icon_state = "nature-purple"
	alpha = 128
/*
//More will be added later, for now just shrooms
/obj/random/flora/spawn_choices()
	return /obj/effect/spawner/maintshroom/delayed
*/
/obj/random/flora/low_chance
	name = "low chance random flora"
	icon_state = "nature-purple-low"
	spawn_nothing_percentage = 83

/obj/random/flora/blocker
	name = "random fallen tree (50%)"
	spawn_nothing_percentage = 50

/obj/random/flora/blocker/high
	name = "random fallen tree (75%)"
	spawn_nothing_percentage = 25

/obj/random/flora/blocker/low
	name = "random fallen tree (25%)"
	spawn_nothing_percentage = 75

/obj/random/flora/blocker/reallylow
	name = "random fallen tree (5%)"
	spawn_nothing_percentage = 95

/obj/random/flora/blocker/reallyreallylow
	name = "random fallen tree (1%)"
	spawn_nothing_percentage = 99

/obj/random/flora/blocker/spawn_choices()
	return /obj/structure/flora/tree/jungle/baracade

/obj/random/flora/small_jungle_tree
	name = "random small jungle tree (100%)"
	spawn_nothing_percentage = 0

/obj/random/flora/small_jungle_tree/low
	name = "random small jungle tree (90%)"
	spawn_nothing_percentage = 10

/obj/random/flora/small_jungle_tree/spawn_choices()
	return pick(/obj/structure/flora/tree/jungle_small,\
				/obj/structure/flora/tree/jungle_small/variant1,\
				/obj/structure/flora/tree/jungle_small/variant2,\
				/obj/structure/flora/tree/jungle_small/variant3,\
				/obj/structure/flora/tree/jungle_small/variant4,\
				/obj/structure/flora/tree/jungle_small/variant5)

/obj/random/flora/jungle_tree
	name = "random jungle tree (100%)"
	spawn_nothing_percentage = 0

/obj/random/flora/jungle_tree/low
	name = "random jungle tree (90%)"
	spawn_nothing_percentage = 10

/obj/random/flora/jungle_tree/spawn_choices()
	return pick(/obj/structure/flora/tree/jungle,\
				/obj/structure/flora/tree/jungle/variant1,\
				/obj/structure/flora/tree/jungle/variant2,\
				/obj/structure/flora/tree/jungle/variant3,\
				/obj/structure/flora/tree/jungle/variant4,\
				/obj/structure/flora/tree/jungle/variant5)

/obj/effect/spawner/maintshroom
	name = "maintshroom spawner"
	icon = 'icons/mob/screen1.dmi'
	icon_state = "x2"
	var/instant = TRUE
	var/min_light_limit = 0.5
	mouse_opacity = 0

/*
/obj/effect/spawner/maintshroom/proc/spawn_shroom()
	// Skip the spawning if the burrow is in a well lit places.
	var/turf/T = get_turf(src)
	if(T.get_lumcount() > min_light_limit)
		return

	new /obj/effect/plant(get_turf(src), new /datum/seed/mushroom/maintshroom)
	find_or_create_burrow(get_turf(src))

/obj/effect/spawner/maintshroom/Initialize()
	.=..()
	if (instant)
		spawn_shroom()
		return INITIALIZE_HINT_QDEL

//New maintshroom spawner
//Delay on spawning. The object may wait up to 2 hours before spawning the shrooms
/obj/effect/spawner/maintshroom/delayed
	name = "maintshroom spawner delayed"
	var/delaymax = 3 HOURS
	instant = FALSE

/obj/effect/spawner/maintshroom/delayed/Initialize()
	.=..()
	//We spawn a burrow immediately, but the plants come later
	find_or_create_burrow(get_turf(src))

	//Lets decide how long to wait
	var/delay = RAND_F(1, delaymax)

	addtimer(CALLBACK(src, .proc/spawn_shroom), delay)
	alpha = 0 //Make it invisible


/obj/effect/spawner/maintshroom/delayed/spawn_shroom()
	//If all the burrows in the area were destroyed before we spawned, then our spawning is cancelled
	var/obj/structure/burrow/B = find_visible_burrow(src)
	if (!B)
		return

	// Skip the spawning if the burrow is in a well lit places.
	var/turf/T = get_turf(B)
	if(T.get_lumcount() > min_light_limit)
		return

	new /obj/effect/plant(get_turf(B), new /datum/seed/mushroom/maintshroom)

	qdel(src)
*/