/turf/unsimulated/mineral
	name = "impassable rock"
	icon = 'icons/turf/walls.dmi'
	icon_state = "rock-dark"
	blocks_air = 1
	density = 1
	opacity = 1

/turf/unsimulated/mineral/transition
	name = "path elsewhere"
	desc = "Looks like this leads to a whole new area."
	icon_state = "floor_transition"

var/global/list/mining_floors = list()
/**********************Asteroid**************************/
// Setting icon/icon_state initially will use these values when the turf is built on/replaced.
// This means you can put grass on the asteroid etc.
/turf/simulated/floor/asteroid
	name = "sand"
	icon = 'icons/turf/flooring/asteroid.dmi'
	icon_state = "asteroid"
	base_name = "sand"
	base_desc = "Gritty and unpleasant."
	base_icon = 'icons/turf/flooring/asteroid.dmi'
	base_icon_state = "asteroid"
	footstep_type = /decl/footsteps/asteroid
	initial_flooring = null
	initial_gas = null
	temperature = TCMB

	var/dug = 0       //0 = has not yet been dug, 1 = has already been dug
	var/overlay_detail

/turf/simulated/floor/asteroid/Initialize()
	. = ..()
	if (!mining_floors["[src.z]"])
		mining_floors["[src.z]"] = list()
	mining_floors["[src.z]"] += src
	if(prob(20))
		overlay_detail = "asteroid[rand(0,9)]"

/turf/simulated/floor/asteroid/Destroy()
	if (mining_floors["[src.z]"])
		mining_floors["[src.z]"] -= src
	return ..()

/turf/simulated/floor/asteroid/explosion_act(severity)
	SHOULD_CALL_PARENT(FALSE)
	if(severity == 1 || (severity == 2 && prob(70)))
		gets_dug()

/turf/simulated/floor/asteroid/is_plating()
	return !density

/turf/simulated/floor/asteroid/attackby(obj/item/W, mob/user)
	if(!W || !user)
		return 0

	var/list/usable_tools = list(
		/obj/item/shovel,
		/obj/item/pickaxe/diamonddrill,
		/obj/item/pickaxe/drill,
		/obj/item/pickaxe/borgdrill
		)

	var/valid_tool
	for(var/valid_type in usable_tools)
		if(istype(W,valid_type))
			valid_tool = 1
			break

	if(valid_tool)
		if (dug)
			to_chat(user, "<span class='warning'>This area has already been dug</span>")
			return TRUE

		var/turf/T = user.loc
		if (!(istype(T)))
			return

		to_chat(user, "<span class='warning'>You start digging.</span>")
		playsound(user.loc, 'sound/effects/rustle1.ogg', 50, 1)
		. = TRUE

		if(!do_after(user,40, src)) return

		to_chat(user, "<span class='notice'>You dug a hole.</span>")
		gets_dug()

	else if(istype(W,/obj/item/storage/ore))
		var/obj/item/storage/ore/S = W
		if(S.collection_mode)
			for(var/obj/item/ore/O in contents)
				return O.attackby(W,user)
	else if(istype(W,/obj/item/storage/bag/fossils))
		var/obj/item/storage/bag/fossils/S = W
		if(S.collection_mode)
			for(var/obj/item/fossil/F in contents)
				return F.attackby(W,user)

	else
		return ..(W,user)

/turf/simulated/floor/asteroid/proc/gets_dug()
	if(dug)
		return
	for(var/i=0;i<(rand(3)+2);i++)
		LAZYADD(., new/obj/item/ore/glass(src))
	dug = TRUE
	icon_state = "asteroid_dug"

/turf/simulated/floor/asteroid/proc/updateMineralOverlays(var/update_neighbors)

	overlays.Cut()

	var/list/step_overlays = list("n" = NORTH, "s" = SOUTH, "e" = EAST, "w" = WEST)
	for(var/direction in step_overlays)

		if(isspaceturf(get_step(src, step_overlays[direction])))
			var/image/aster_edge = image('icons/turf/flooring/asteroid.dmi', "asteroid_edges", dir = step_overlays[direction])
			aster_edge.layer = DECAL_LAYER
			overlays += aster_edge

	if(overlay_detail)
		var/image/floor_decal = image(icon = 'icons/turf/flooring/decals.dmi', icon_state = overlay_detail)
		floor_decal.layer = DECAL_LAYER
		overlays |= floor_decal

	if(update_neighbors)
		var/list/all_step_directions = list(NORTH,NORTHEAST,EAST,SOUTHEAST,SOUTH,SOUTHWEST,WEST,NORTHWEST)
		for(var/direction in all_step_directions)
			var/turf/simulated/floor/asteroid/A
			if(istype(get_step(src, direction), /turf/simulated/floor/asteroid))
				A = get_step(src, direction)
				A.updateMineralOverlays()

/turf/simulated/floor/asteroid/Entered(atom/movable/M)
	..()
	if(istype(M,/mob/living/silicon/robot))
		var/mob/living/silicon/robot/R = M
		if(R.module)
			if(istype(R.module_state_1,/obj/item/storage/ore))
				attackby(R.module_state_1,R)
			else if(istype(R.module_state_2,/obj/item/storage/ore))
				attackby(R.module_state_2,R)
			else if(istype(R.module_state_3,/obj/item/storage/ore))
				attackby(R.module_state_3,R)
			else
				return

/*Grass*/

/turf/simulated/floor/asteroid/grass
	name = "grass"
	icon = 'icons/turf/flooring/grass.dmi'
	icon_state = "grass0"
	initial_flooring = /decl/flooring/grass
	initial_gas = list(/decl/material/gas/oxygen = MOLES_O2STANDARD,
			/decl/material/gas/nitrogen = MOLES_N2STANDARD)

/turf/simulated/floor/asteroid/grass/virgoforest
	icon_state = "grass-light"
	initial_flooring = /decl/flooring/grass2/virgoforest

/turf/simulated/floor/asteroid/grass/virgoforestdark
	icon_state = "grass-dark"
	initial_flooring = /decl/flooring/grass2/virgoforestdark

/turf/simulated/floor/asteroid/grass/sif
	icon_state = "grass_sif"
	initial_flooring = /decl/flooring/grass2/sif

/turf/simulated/floor/asteroid/grass/sifdark
	icon_state = "grass_sif_dark"
	initial_flooring = /decl/flooring/grass2/sifdark

/turf/simulated/floor/asteroid/grass/jungle
	icon_state = "grass_jungle"
	initial_flooring = /decl/flooring/grass2/jungle

/turf/simulated/floor/asteroid/grass/snow_grass
	icon_state = "snowgrass_nes"
	initial_flooring = /decl/flooring/grass2/snow_grass

/turf/simulated/floor/asteroid/grass/snowjungle
	icon_state = "snowjungle"
	initial_flooring = /decl/flooring/grass2/snowjungle

/turf/simulated/floor/asteroid/grass/plowed_snow
	icon_state = "plowed_snow"
	initial_flooring = /decl/flooring/grass2/plowed_snow

/turf/simulated/floor/asteroid/grass/dry
	icon_state = "grass_dry"
	initial_flooring = /decl/flooring/grass2/dry

/turf/simulated/floor/asteroid/grass/colonial1
	icon_state = "cmgrass1"
	initial_flooring = /decl/flooring/grass2/colonial1

/turf/simulated/floor/asteroid/grass/colonial2
	icon_state = "cmgrass2"
	initial_flooring = /decl/flooring/grass2/colonial2

/turf/simulated/floor/asteroid/grass/colonial3
	icon_state = "cmgrass3"
	initial_flooring = /decl/flooring/grass2/colonial3

/turf/simulated/floor/asteroid/grass/colonialjungle1
	icon_state = "junglegrass1"
	initial_flooring =/decl/flooring/grass2/colonialjungle1

/turf/simulated/floor/asteroid/grass/colonialjungle2
	icon_state = "junglegrass2"
	initial_flooring = /decl/flooring/grass2/colonialjungle2

/turf/simulated/floor/asteroid/grass/colonialjungle3
	icon_state = "junglegrass3"
	initial_flooring = /decl/flooring/grass2/colonialjungle3

/turf/simulated/floor/asteroid/grass/colonialjungle4
	icon_state = "junglegrass4"
	initial_flooring = /decl/flooring/grass2/colonialjungle4

/turf/simulated/floor/asteroid/grass/colonialbeach
	icon_state = "grassbeach"
	initial_flooring = /decl/flooring/grass2/colonialbeach

/turf/simulated/floor/asteroid/grass/colonialbeach/corner
	icon_state = "gbcorner"
	initial_flooring = /decl/flooring/grass2/colonialbeach/corner

/*Dirt*/

/turf/simulated/floor/asteroid/dirt
	name = "dirt"
	desc = "Course and unpleasent."
	icon = 'icons/turf/flooring/dirt.dmi'
	icon_state = "dirt"
	initial_flooring = /decl/flooring/dirt
	initial_gas = list(/decl/material/gas/oxygen = MOLES_O2STANDARD,
			/decl/material/gas/nitrogen = MOLES_N2STANDARD)

/turf/simulated/floor/asteroid/dirt/dark
	icon_state = "dirtnewdark"
	initial_flooring = /decl/flooring/dirt/dark

/turf/simulated/floor/asteroid/dirt/dark/plough
	icon_state = "dirt_ploughed"
	initial_flooring = /decl/flooring/dirt/dark/plough

/turf/simulated/floor/asteroid/dirt/flood
	icon_state = "flood_dirt"
	initial_flooring = /decl/flooring/dirt/flood

/turf/simulated/floor/asteroid/dirt/flood/plough
	icon_state = "flood_dirt_ploughed"
	initial_flooring = /decl/flooring/dirt/flood/plough

/turf/simulated/floor/asteroid/dirt/dust
	icon_state = "dust"
	initial_flooring = /decl/flooring/dirt/dust

/turf/simulated/floor/asteroid/dirt/ground
	icon_state = "desert"
	initial_flooring = /decl/flooring/dirt/ground

/turf/simulated/floor/asteroid/dirt/coast
	name = "coastline"
	icon_state = "dirtbeach"
	initial_flooring = /decl/flooring/dirt/coast

/turf/simulated/floor/asteroid/dirt/coast/corner
	icon_state = "dirtbeachcorner1"
	initial_flooring = /decl/flooring/dirt/coast/corner

/turf/simulated/floor/asteroid/dirt/coast/corner2
	icon_state = "dirtbeachcorner2"
	initial_flooring = /decl/flooring/dirt/coast/corner2

/turf/simulated/floor/asteroid/dirt/burned
	icon_state = "burned_dirt"
	initial_flooring = /decl/flooring/dirt/burned

/turf/simulated/floor/asteroid/dirt/mud
	name = "mud"
	icon_state = "mud_dark"
	initial_flooring = /decl/flooring/dirt/mud

/turf/simulated/floor/asteroid/dirt/mud/light
	name = "mud"
	icon_state = "mud_light"
	initial_flooring = /decl/flooring/dirt/mud/light

/*Rock*/

/turf/simulated/floor/rock
	name = "rocks"
	icon = 'icons/turf/flooring/dirt.dmi'
	icon_state = "rock"
	initial_flooring = /decl/flooring/rock

/turf/simulated/floor/rock/alt
	name = "rocks"
	icon_state = "rock_alt"
	initial_flooring = /decl/flooring/rock/alt

/turf/simulated/floor/rock/grey
	name = "rocks"
	icon_state = "rock_grey"
	initial_flooring = /decl/flooring/rock/grey

/turf/simulated/floor/rock/dark
	name = "rocks"
	icon_state = "rock_dark"
	initial_flooring = /decl/flooring/rock/dark

/turf/simulated/floor/rock/old
	name = "rocks"
	icon_state = "rock_old"
	initial_flooring = /decl/flooring/rock/old

/turf/simulated/floor/rock/manmade/ruin1
	name = "rocks"
	icon_state = "stone_old"
	initial_flooring = /decl/flooring/rock/manmade/ruin1

/turf/simulated/floor/rock/manmade/ruin2
	name = "rocks"
	icon_state = "stone_old1"
	initial_flooring = /decl/flooring/rock/manmade/ruin2

/turf/simulated/floor/rock/manmade/ruin3
	name = "rocks"
	icon_state = "stone_old2"
	initial_flooring = /decl/flooring/rock/manmade/ruin3

/turf/simulated/floor/rock/seafloor
	name = "rocks"
	icon_state = "seafloor"
	initial_flooring = /decl/flooring/rock/seafloor

/turf/simulated/floor/rock/manmade/concrete
	name = "concrete"
	icon_state = "concrete6"
	initial_flooring = /decl/flooring/rock/manmade/concrete

/turf/simulated/floor/rock/manmade/asphalt
	name = "asphalt"
	icon_state = "asphalt"
	initial_flooring = /decl/flooring/rock/manmade/asphalt

/turf/simulated/floor/rock/manmade/road
	name = "gravel road"
	icon_state = "road_1"
	initial_flooring = /decl/flooring/rock/manmade/road