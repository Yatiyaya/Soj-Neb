// This type of flooring cannot be altered short of being destroyed and rebuilt.
// Use this to bypass the flooring system entirely ie. event areas, holodeck, etc.

/turf/simulated/floor/fixed
	name = "floor"
	icon = 'icons/turf/flooring/tiles.dmi'
	icon_state = "steel"
	initial_flooring = null
	footstep_type = /decl/footsteps/plating
	is_outside = OUTSIDE_AREA

/turf/simulated/floor/fixed/attackby(var/obj/item/C, var/mob/user)
	if(istype(C, /obj/item/stack) && !isCoil(C))
		return
	return ..()

/turf/simulated/floor/fixed/on_update_icon()
	queue_ao(FALSE)

/turf/simulated/floor/fixed/is_plating()
	return 0

/turf/simulated/floor/fixed/set_flooring()
	return

/turf/simulated/floor/fixed/alium
	name = "alien plating"
	desc = "This obviously wasn't made for your feet."
	icon = 'icons/turf/flooring/alium.dmi'
	icon_state = "jaggy"

/turf/simulated/floor/fixed/alium/attackby(var/obj/item/C, var/mob/user)
	if(isCrowbar(C))
		to_chat(user, "<span class='notice'>There aren't any openings big enough to pry it away...</span>")
		return TRUE
	return ..()

/turf/simulated/floor/fixed/alium/Initialize()
	. = ..()
	var/decl/material/A = GET_DECL(/decl/material/solid/metal/aliumium)
	if(!A)
		return
	color = A.color
	var/style = A.hardness % 2 ? "curvy" : "jaggy"
	icon_state = "[style][(x*y) % 7]"

/turf/simulated/floor/fixed/alium/airless
	initial_gas = null
	temperature = TCMB

/turf/simulated/floor/fixed/alium/explosion_act(severity)
	SHOULD_CALL_PARENT(FALSE)
	var/decl/material/A = GET_DECL(/decl/material/solid/metal/aliumium)
	if(prob(A.explosion_resistance))
		return
	if(severity == 1)
		ChangeTurf(get_base_turf_by_area(src))

/*
Engine water turfs
*/
/turf/simulated/floor/fixed/hydrotile
	name = "freezing cold rushing water"
	desc = "It's freezing cold and moving quite fast, but it only comes up past the knees to the average person. Bit uncomfortable, but safe to stand in."
	icon = 'icons/turf/flooring/beach.dmi'
	icon_state = "coolant"
	temperature = T0C
	thermal_conductivity = OPEN_HEAT_TRANSFER_COEFFICIENT
	wet = 1

/turf/simulated/floor/fixed/hydrotile/shallowcoolant
	name = "cold river water"
	desc = "The ice cold water flows from an underground river to cool the super heated pipes."
	icon_state = "coolantshallow"

/turf/simulated/floor/fixed/hydrotile/inputgate
	name = "river inlet gate"
	desc = "This gate allows the freezing water from an underground river to flow to the engine pipes for cooling."
	icon_state = "input"

/turf/simulated/floor/fixed/hydrotile/outputgate
	name = "river outlet gate"
	desc = "This gate allows the now heated water from an underground river to flow back underground."
	icon_state = "output"