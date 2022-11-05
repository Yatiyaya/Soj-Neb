//This file was auto-corrected by findeclaration.exe on 25.5.2012 20:42:33

/obj/machinery/containment_field
	name = "Containment Field"
	desc = "An energy field."
	icon = 'icons/obj/singularity.dmi'
	icon_state = "Contain_F"
	anchored = 1
	density = 0
	unacidable = 1
	use_power = POWER_USE_OFF
	uncreated_component_parts = null
	light_range = 4
	movable_flags = MOVABLE_FLAG_PROXMOVE
	var/obj/machinery/field_generator/FG1 = null
	var/obj/machinery/field_generator/FG2 = null
	var/hasShocked = 0 //Used to add a delay between shocks. In some cases this used to crash servers by spawning hundreds of sparks every second.

/obj/machinery/containment_field/Destroy()
	if(FG1 && !FG1.clean_up)
		FG1.cleanup()
	if(FG2 && !FG2.clean_up)
		FG2.cleanup()
	. = ..()

/obj/machinery/containment_field/physical_attack_hand(mob/user)
	return shock(user)

/obj/machinery/containment_field/explosion_act(severity)
	SHOULD_CALL_PARENT(FALSE)
	return 0

/obj/machinery/containment_field/HasProximity(atom/movable/AM)
	. = ..()
	if(.)
		if(istype(AM,/mob/living/silicon) && prob(40))
			shock(AM)
			return TRUE
		if(istype(AM,/mob/living/carbon) && prob(50))
			shock(AM)
			return TRUE
		return FALSE

/obj/machinery/containment_field/shock(mob/living/user)
	if(hasShocked)
		return 0
	if(!FG1 || !FG2)
		qdel(src)
		return 0
	if(isliving(user))
		hasShocked = 1
		var/shock_damage = min(rand(30,40),rand(30,40))
		user.electrocute_act(shock_damage, src)

		var/atom/target = get_edge_target_turf(user, get_dir(src, get_step_away(user, src)))
		user.throw_at(target, 200, 4)

		sleep(20)

		hasShocked = 0
		return TRUE

/obj/machinery/containment_field/proc/set_master(var/master1,var/master2)
	if(!master1 || !master2)
		return 0
	FG1 = master1
	FG2 = master2
	return 1