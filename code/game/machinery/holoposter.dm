/obj/machinery/holoposter
	name = "holographic poster"
	desc = "A wall-mounted holographic projector displaying various advertisements."
	icon = 'icons/obj/holoposter.dmi'
	icon_state = "off"
	anchored = 1
	idle_power_usage = 80
	var/icon_forced = FALSE
	var/seclevel = ""
	var/last_launch = 0

	var/list/postertypes = list(
		"ironhammer" = LIGHT_COLOR_BLUE,
		"frozenstar" = LIGHT_COLOR_BLUE,
		"neotheology" = LIGHT_COLOR_ORANGE,
		"asters" = LIGHT_COLOR_GREEN,
		"tehnomancers" = LIGHT_COLOR_ORANGE,
		"moebius" = LIGHT_COLOR_PURPLE,
		"med" = LIGHT_COLOR_GREEN,
	)

/obj/machinery/holoposter/update_icon()
	..()
	if(stat & NOPOWER)
		icon_state = "off"
		set_light(0)
		return
	var/new_color = COLOR_OFF_WHITE
	if(stat & BROKEN)
		icon_state = "glitch"
		new_color = LIGHT_COLOR_VIOLET
	else
		var/decl/security_state/security_state = decls_repository.get_decl(global.using_map.security_state)
		if(security_state.current_security_level_is_same_or_higher_than(security_state.high_security_level))
			icon_state = "attention"
			new_color =  "#AA7039"
		else if(icon_state in postertypes)
			new_color = postertypes[icon_state]

	set_light(l_range = 2, l_power = 2, l_color = new_color)

/obj/machinery/holoposter/proc/set_rand_sprite()
    icon_state = pick(postertypes)
    update_icon()

/obj/machinery/holoposter/attackby(obj/item/W as obj, mob/user as mob)
	src.add_fingerprint(user)
	if(stat & (NOPOWER))
		return
	if (isWirecutter(W))
		playsound(user.loc, 'sound/items/multitool_pulse.ogg', 60, 1)
		icon_state = input("Available Posters", "Holographic Poster") as null|anything in  postertypes + "random"
		if(icon_state == "random")
			stat &= ~BROKEN
			icon_forced = FALSE
			set_rand_sprite()
			return
		icon_forced = TRUE
		stat &= ~BROKEN
		update_icon()
		return

/obj/machinery/holoposter/attack_ai(mob/user as mob)
	return attack_hand(user)

/obj/machinery/holoposter/power_change()
	var/wasUnpowered = stat & NOPOWER
	..()
	if(wasUnpowered != (stat & NOPOWER))
		update_icon()

/obj/machinery/holoposter/emp_act()
	stat |= BROKEN
	update_icon()

/obj/machinery/holoposter/Process()
	if(stat & (NOPOWER|BROKEN))
		return
	if((world.time > last_launch + 1 MINUTES) && (!icon_forced))
		set_rand_sprite()
		last_launch = world.time