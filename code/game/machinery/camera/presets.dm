/obj/machinery/camera/network/engineering
	preset_channels = list(CAMERA_CAMERA_CHANNEL_ENGINEERING)
	initial_access = list(access_engine)

/obj/machinery/camera/network/ert
	preset_channels = list(CAMERA_CHANNEL_ERT)
	cameranet_enabled = FALSE
	initial_access = list(access_engine)

/obj/machinery/camera/network/medbay
	preset_channels = list(CAMERA_CHANNEL_MEDICAL)
	initial_access = list(access_medical)

/obj/machinery/camera/network/mercenary
	preset_channels = list(CAMERA_CHANNEL_MERCENARY)
	cameranet_enabled = FALSE
	initial_access = list(access_syndicate)

/obj/machinery/camera/network/mining
	preset_channels = list(CAMERA_CHANNEL_MINE)
	initial_access = list(access_mining)

/obj/machinery/camera/network/research
	preset_channels = list(CAMERA_CHANNEL_RESEARCH)
	initial_access = list(access_research_equipment)

/obj/machinery/camera/network/security
	preset_channels = list(CAMERA_CHANNEL_SECURITY)
	initial_access = list(access_security)

/obj/machinery/camera/network/television
	preset_channels = list(CAMERA_CHANNEL_TELEVISION)
	cameranet_enabled = FALSE
	requires_connection = FALSE

/obj/machinery/camera/network/crescent
	preset_channels = list(NETWORK_CRESCENT)

/obj/machinery/camera/network/gate
	preset_channels = list(NETWORK_GATE)
	initial_access = list(access_gateway)

/obj/machinery/camera/network/cargo
	preset_channels = list(NETWORK_CARGO)
	initial_access = list(access_cargo)

/obj/machinery/camera/network/colony_surface
	preset_channels = list(NETWORK_COLONY_SURFACE)

/obj/machinery/camera/network/colony_underground
	preset_channels = list(NETWORK_COLONY_UNDERGROUND)

/obj/machinery/camera/network/colony_transition
	preset_channels = list(NETWORK_COLONY_TRANSITION)

/obj/machinery/camera/network/church
	preset_channels = list(NETWORK_CHURCH)

/obj/machinery/camera/network/propis
	preset_channels = list(NETWORK_PROP)
	initial_access = list(access_prospector)

/obj/machinery/camera/network/plasma_tag
	preset_channels = list(NETWORK_PLASMA_TAG)

/obj/machinery/camera/network/command
	preset_channels = list(NETWORK_COMMAND)
	initial_access = list(access_heads)

/obj/machinery/camera/network/engine
	preset_channels = list(NETWORK_ENGINE)
	initial_access = list(access_engine)

/obj/machinery/camera/network/engineering
	preset_channels = list(NETWORK_ENGINEERING)
	initial_access = list(access_engine)

/obj/machinery/camera/network/cev_eris
	preset_channels = list(NETWORK_CEV_ERIS)

/obj/machinery/camera/network/mining
	preset_channels = list(NETWORK_MINE)
	initial_access = list(access_mining_station)

/obj/machinery/camera/network/prison
	preset_channels = list(NETWORK_PRISON)
	initial_access = list(access_security)

/obj/machinery/camera/network/medbay
	preset_channels = list(NETWORK_MEDICAL)
	initial_access = list(access_moebius)

/obj/machinery/camera/network/research
	preset_channels = list(NETWORK_RESEARCH)
	initial_access = list(access_moebius)

/obj/machinery/camera/network/research_outpost
	preset_channels = list(NETWORK_RESEARCH_OUTPOST)
	initial_access = list(access_moebius)

/obj/machinery/camera/network/security
	preset_channels = list(NETWORK_SECURITY)
	initial_access = list(access_security)

/obj/machinery/camera/network/telecom
	preset_channels = list(NETWORK_TELECOM)
	initial_access = list(access_tcomsat)

/obj/machinery/camera/network/thunder
	preset_channels = list(NETWORK_THUNDER)
	cameranet_enabled = FALSE
	requires_connection = FALSE

// EMP

/obj/machinery/camera/emp_proof/populate_parts(full_populate)
	. = ..()
	install_component(/obj/item/stock_parts/capacitor/adv, TRUE)

// X-RAY

/obj/machinery/camera/xray
	icon_state = "xraycam" // Thanks to Krutchen for the icons.

/obj/machinery/camera/xray/populate_parts(full_populate)
	. = ..()
	install_component(/obj/item/stock_parts/scanning_module/adv, TRUE)

// MOTION

/obj/machinery/camera/motion/populate_parts(full_populate)
	. = ..()
	install_component(/obj/item/stock_parts/micro_laser, TRUE)

// ALL UPGRADES

/obj/machinery/camera/all/populate_parts(full_populate)
	. = ..()
	install_component(/obj/item/stock_parts/capacitor/adv, TRUE)
	install_component(/obj/item/stock_parts/scanning_module/adv, TRUE)
	install_component(/obj/item/stock_parts/micro_laser, TRUE)

// AUTONAME left as a map stub
/obj/machinery/camera/autoname

// SOJ

