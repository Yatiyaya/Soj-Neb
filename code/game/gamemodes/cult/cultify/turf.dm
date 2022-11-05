/turf/proc/cultify()
	return

/turf/simulated/floor/cultify()
	//todo: flooring datum cultify check
	cultify_floor()

/turf/simulated/shuttle/wall/cultify()
	cultify_wall()

/turf/simulated/wall/cultify()
	cultify_wall()

/turf/simulated/wall/cult/cultify()
	return

/turf/unsimulated/wall/cult/cultify()
	return

/turf/unsimulated/beach/cultify()
	return

/turf/unsimulated/wall/cultify()
	cultify_wall()

/turf/simulated/floor/proc/cultify_floor()
	set_flooring(GET_DECL(/decl/flooring/reinforced/cult))
	var/decl/special_role/cultist/cult = GET_DECL(/decl/special_role/cultist)
	cult.add_cultiness(CULTINESS_PER_TURF)

/turf/proc/cultify_wall()
	var/turf/simulated/wall/wall = src
	if(!istype(wall))
		return
	if(wall.reinf_material)
		ChangeTurf(/turf/simulated/wall/cult/reinf)
	else
		ChangeTurf(/turf/simulated/wall/cult)
	var/decl/special_role/cultist/cult = GET_DECL(/decl/special_role/cultist)
	cult.add_cultiness(CULTINESS_PER_TURF)

/turf/simulated/wall/tomb_king
	name = "strange wall"
	desc = "A reinforced wall painted obsidian and gold, glyphs and strange depictions of unknown tales told in images decorate the base."
	icon = 'icons/turf/wall_masks.dmi'
	icon_state = "Nashef_standard"
	material = /decl/material/solid/metallic_hydrogen
	reinf_material = /decl/material/solid/metal/gold


/turf/simulated/wall/church
	name = "church wall"
	desc = "A reinforced wall with golden triming, latin and with faithful depictions of tales told in images decorate the base."
	icon = 'icons/turf/wall_masks.dmi'
	icon_state = "church_standard"
	material = /decl/material/solid/metal/steel
	reinf_material = /decl/material/solid/metal/plasteel


/turf/simulated/wall/church_reinforced
	name = "church wall"
	desc = "A reinforced wall with golden triming, latin and with faithful depictions of tales told in images decorate the base."
	icon_state = "church_reinforced"
	material = /decl/material/solid/metal/plasteel
	reinf_material = /decl/material/solid/metal/plasteel
	icon = 'icons/turf/wall_masks.dmi'

/turf/simulated/wall/rock
	name = "rock wall"
	desc = "A wall of rocks."
	icon = 'icons/turf/wall_masks.dmi'
	icon_state = "rockold"