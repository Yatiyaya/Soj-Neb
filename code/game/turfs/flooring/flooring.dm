// State values:
// [icon_base]: initial base icon_state without edges or corners.
// if has_base_range is set, append 0-has_base_range ie.
//   [icon_base][has_base_range]
// [icon_base]_broken: damaged overlay.
// if has_damage_range is set, append 0-damage_range for state ie.
//   [icon_base]_broken[has_damage_range]
// [icon_base]_edges: directional overlays for edges.
// [icon_base]_corners: directional overlays for non-edge corners.

/decl/flooring
	var/name
	var/desc
	var/icon
	var/icon_base
	var/color
	var/footstep_type = /decl/footsteps/blank

	var/has_base_range
	var/has_damage_range
	var/has_burn_range
	var/damage_temperature
	var/apply_thermal_conductivity
	var/apply_heat_capacity

	var/build_type      // Unbuildable if not set. Must be /obj/item/stack.
	var/build_material  // Unbuildable if object material var is not set to this.
	var/build_cost = 1  // Stack units.
	var/build_time = 0  // BYOND ticks.

	var/descriptor = "tiles"
	var/flags
	var/remove_timer = 10
	var/can_paint
	var/can_engrave = TRUE

	var/movement_delay

	//How we smooth with other flooring
	var/decal_layer = DECAL_LAYER
	var/floor_smooth = SMOOTH_ALL
	var/list/flooring_whitelist = list() //Smooth with nothing except the contents of this list
	var/list/flooring_blacklist = list() //Smooth with everything except the contents of this list

	//How we smooth with walls
	var/wall_smooth = SMOOTH_ALL
	//There are no lists for walls at this time

	//How we smooth with space and openspace tiles
	var/space_smooth = SMOOTH_ALL
	//There are no lists for spaces
	var/z_flags //same z flags used for turfs, i.e ZMIMIC_DEFAULT etc

	var/height = 0

/decl/flooring/proc/on_remove()
	return

/decl/flooring/grass
	name = "grass"
	desc = "Do they smoke grass out in space, Bowie? Or do they smoke AstroTurf?"
	icon = 'icons/turf/flooring/grass.dmi'
	icon_base = "grass"
	has_base_range = 3
	damage_temperature = T0C+80
	flags = TURF_HAS_EDGES | TURF_HAS_CORNERS | TURF_REMOVE_SHOVEL
	build_type = /obj/item/stack/tile/grass
	can_engrave = FALSE
	floor_smooth = SMOOTH_NONE
	wall_smooth = SMOOTH_ALL
	space_smooth = SMOOTH_NONE
	decal_layer = ABOVE_WIRE_LAYER

/decl/flooring/grass2
	name = "grass"
	icon = 'icons/turf/flooring/grass.dmi'
	build_type = null
	footstep_type = "grass"

/decl/flooring/grass2/virgoforest
	icon_base = "grass-light"

/decl/flooring/grass2/virgoforestdark
	icon_base = "grass-dark"

/decl/flooring/grass2/sif
	icon_base = "grass_sif"

/decl/flooring/grass2/sifdark
	icon_base = "grass_sif_dark"

/decl/flooring/grass2/jungle
	icon_base = "grass_jungle"

/decl/flooring/grass2/snow_grass
	icon_base = "snowgrass_nes"

/decl/flooring/grass2/snowjungle
	icon_base = "snowjungle"

/decl/flooring/grass2/plowed_snow
	icon_base = "plowed_snow"

/decl/flooring/grass2/dry
	icon_base = "grass_dry"

/decl/flooring/grass2/colonial1
	icon_base = "cmgrass1"

/decl/flooring/grass2/colonial2
	icon_base = "cmgrass2"

/decl/flooring/grass2/colonial3
	icon_base = "cmgrass3"

/decl/flooring/grass2/colonialjungle1
	icon_base = "junglegrass1"

/decl/flooring/grass2/colonialjungle2
	icon_base = "junglegrass2"

/decl/flooring/grass2/colonialjungle3
	icon_base = "junglegrass3"

/decl/flooring/grass2/colonialjungle4
	icon_base = "junglegrass4"

/decl/flooring/grass2/colonialbeach
	icon_base = "grassbeach"

/decl/flooring/grass2/colonialbeach/corner
	icon_base = "gbcorner"

/decl/flooring/dirt
	name = "dirt"
	desc = "Extra dirty."
	icon = 'icons/turf/flooring/grass.dmi'
	icon_base = "dirt"
	has_base_range = 3
	damage_temperature = T0C+80
	can_engrave = FALSE
	footstep_type = /decl/footsteps/grass

/decl/flooring/dirt/dark
	icon_base = "dirtnewdark"

/decl/flooring/dirt/dark/plough
	icon_base = "dirt_ploughed"

/decl/flooring/dirt/flood
	icon_base = "flood_dirt"

/decl/flooring/dirt/flood/plough
	icon_base = "flood_dirt_ploughed"

/decl/flooring/dirt/dust
	icon_base = "dust"

/decl/flooring/dirt/ground
	icon_base = "desert"

/decl/flooring/dirt/coast
	icon_base = "dirtbeach"

/decl/flooring/dirt/coast/corner
	icon_base = "dirtbeachcorner1"

/decl/flooring/dirt/coast/corner2
	icon_base = "dirtbeachcorner2"

/decl/flooring/dirt/burned
	icon_base = "burned_dirt"

/decl/flooring/dirt/mud
	icon_base = "mud_dark"

/decl/flooring/dirt/mud/light
	icon_base = "mud_light"

/*Rock*/
/decl/flooring/rock
	name = "rock"
	icon = 'icons/turf/flooring/dirt.dmi'
	icon_base = "rock"
	build_type = null
	footstep_type = "gravel"

/decl/flooring/rock/alt
	icon_base = "rock_alt"

/decl/flooring/rock/grey
	icon_base = "rock_grey"

/decl/flooring/rock/dark
	icon_base = "rock_dark"

/decl/flooring/rock/old
	icon_base = "rock_old"

/decl/flooring/rock/manmade/ruin1
	icon_base = "stone_old"

/decl/flooring/rock/manmade/ruin2
	icon_base = "stone_old1"

/decl/flooring/rock/manmade/ruin3
	icon_base = "stone_old2"

/decl/flooring/rock/seafloor
	icon_base = "seafloor"

/decl/flooring/rock/manmade/concrete
	icon_base = "concrete6"

/decl/flooring/rock/manmade/asphalt
	icon_base = "asphalt"

/decl/flooring/rock/manmade/road
	icon_base = "road_1"

/decl/flooring/asteroid
	name = "coarse sand"
	desc = "Gritty and unpleasant."
	icon = 'icons/turf/flooring/asteroid.dmi'
	icon_base = "asteroid"
	flags = TURF_HAS_EDGES | TURF_REMOVE_SHOVEL
	build_type = null
	can_engrave = FALSE
	footstep_type = /decl/footsteps/asteroid

/decl/flooring/carpet
	name = "red carpet"
	desc = "Comfy and fancy carpeting."
	icon = 'icons/turf/flooring/carpet.dmi'
	icon_base = "brown"
	build_type = /obj/item/stack/tile/carpet
	damage_temperature = T0C+200
	flags = TURF_HAS_CORNERS | TURF_HAS_INNER_CORNERS | TURF_REMOVE_CROWBAR | TURF_CAN_BURN
	can_engrave = FALSE
	footstep_type = /decl/footsteps/carpet
	floor_smooth = SMOOTH_NONE
	wall_smooth = SMOOTH_NONE
	space_smooth = SMOOTH_NONE

/decl/flooring/carpet/blue
	name = "blue carpet"
	icon_base = "blue1"
	build_type = /obj/item/stack/tile/carpetblue

/decl/flooring/carpet/blue2
	name = "pale blue carpet"
	icon_base = "blue2"
	build_type = /obj/item/stack/tile/carpetblue2

/decl/flooring/carpet/blue3
	name = "sea blue carpet"
	icon_base = "blue3"
	build_type = /obj/item/stack/tile/carpetblue3

/decl/flooring/carpet/magenta
	name = "magenta carpet"
	icon_base = "purple"
	build_type = /obj/item/stack/tile/carpetmagenta

/decl/flooring/carpet/purple
	name = "purple carpet"
	icon_base = "purple"
	build_type = /obj/item/stack/tile/carpetpurple

/decl/flooring/carpet/orange
	name = "orange carpet"
	icon_base = "orange"
	build_type = /obj/item/stack/tile/carpetorange

/decl/flooring/carpet/green
	name = "green carpet"
	icon_base = "green"
	build_type = /obj/item/stack/tile/carpetgreen

/decl/flooring/carpet/red
	name = "red carpet"
	icon_base = "red"
	build_type = /obj/item/stack/tile/carpetred

/decl/flooring/carpet/bcarpet
	name = "black carpet"
	icon_base = "bcarpet"
	build_type = /obj/item/stack/tile/carpet/bcarpet

/decl/flooring/carpet/blucarpet
	name = "blue carpet"
	icon_base = "blucarpet"
	build_type = /obj/item/stack/tile/carpet/blucarpet

/decl/flooring/carpet/turcarpet
	name = "turquoise carpet"
	icon_base = "turcarpet"
	build_type = /obj/item/stack/tile/carpet/turcarpet

/decl/flooring/carpet/sblucarpet
	name = "silver blue carpet"
	icon_base = "sblucarpet"
	build_type = /obj/item/stack/tile/carpet/sblucarpet

/decl/flooring/carpet/gaycarpet
	name = "pink carpet"
	icon_base = "gaycarpet"
	build_type = /obj/item/stack/tile/carpet/gaycarpet

/decl/flooring/carpet/purcarpet
	name = "purple carpet"
	icon_base = "purcarpet"
	build_type = /obj/item/stack/tile/carpet/purcarpet

/decl/flooring/carpet/oracarpet
	name = "orange carpet"
	icon_base = "oracarpet"
	build_type = /obj/item/stack/tile/carpet/oracarpet

/decl/flooring/linoleum
	name = "linoleum"
	desc = "It's like the 2090's all over again."
	icon = 'icons/turf/flooring/linoleum.dmi'
	icon_base = "lino"
	can_paint = 1
	build_type = /obj/item/stack/tile/linoleum
	flags = TURF_REMOVE_SCREWDRIVER
	footstep_type = /decl/footsteps/tiles

/decl/flooring/tiling
	name = "floor"
	desc = "A solid, heavy set of flooring plates."
	icon = 'icons/turf/flooring/tiles.dmi'
	icon_base = "tiled"
	color = COLOR_DARK_GUNMETAL
	has_damage_range = 4
	damage_temperature = T0C+1400
	flags = TURF_REMOVE_CROWBAR | TURF_CAN_BREAK | TURF_CAN_BURN
	build_type = /obj/item/stack/tile/floor
	can_paint = 1
	footstep_type = /decl/footsteps/tiles

/decl/flooring/tiling/mono
	icon_base = "monotile"
	build_type = /obj/item/stack/tile/mono

/decl/flooring/tiling/mono/dark
	color = COLOR_DARK_GRAY
	build_type = /obj/item/stack/tile/mono/dark

/decl/flooring/tiling/mono/white
	icon_base = "monotile_light"
	color = COLOR_OFF_WHITE
	build_type = /obj/item/stack/tile/mono/white

/decl/flooring/tiling/white
	icon = 'icons/turf/flooring/tiles_white.dmi'
	icon_base = "tiled_light"
	desc = "How sterile."
	color = COLOR_OFF_WHITE
	build_type = /obj/item/stack/tile/floor_white

/decl/flooring/tiling/dark
	icon = 'icons/turf/flooring/tiles_dark.dmi'
	desc = "How ominous."
	color = COLOR_DARK_GRAY
	build_type = /obj/item/stack/tile/floor_dark

/decl/flooring/tiling/dark/mono
	icon_base = "monotile"
	build_type = null

/decl/flooring/tiling/freezer
	desc = "Don't slip."
	icon_base = "freezer"
	color = null
	has_damage_range = null
	flags = TURF_REMOVE_CROWBAR
	build_type = /obj/item/stack/tile/floor_freezer

/decl/flooring/tiling/tech
	icon = 'icons/turf/flooring/techfloor.dmi'
	icon_base = "techfloor_gray"
	build_type = /obj/item/stack/tile/techgrey
	color = null

/decl/flooring/tiling/tech/grid
	icon_base = "techfloor_grid"
	build_type = /obj/item/stack/tile/techgrid

/decl/flooring/tiling/new_tile
	icon_base = "tile_full"
	color = null
	build_type = null

/decl/flooring/tiling/new_tile/cargo_one
	icon_base = "cargo_one_full"
	build_type = null

/decl/flooring/tiling/new_tile/kafel
	icon_base = "kafel_full"
	build_type = null

/decl/flooring/tiling/stone
	icon_base = "stone"
	build_type = /obj/item/stack/tile/stone

/decl/flooring/tiling/new_tile/techmaint
	icon_base = "techmaint"
	build_type = /obj/item/stack/tile/techmaint

/decl/flooring/tiling/cafe
	name = "floor"
	icon_base = "cafe"
	icon = 'icons/turf/flooring/tiles.dmi'
	build_type = /obj/item/stack/tile/floor/cafe
	footstep_type = "floor"

/decl/flooring/tiling/techmaint
	name = "floor"
	icon_base = "techmaint"
	icon = 'icons/turf/flooring/tiles_maint.dmi'
	build_type = /obj/item/stack/tile/floor/techmaint
	footstep_type = "floor"

	floor_smooth = SMOOTH_WHITELIST
	flooring_whitelist = list(/decl/flooring/tiling/techmaint_perforated, /decl/flooring/tiling/techmaint_panels)

/decl/flooring/tiling/techmaint_perforated
	name = "floor"
	icon_base = "techmaint_perforated"
	icon = 'icons/turf/flooring/tiles_maint.dmi'
	build_type = /obj/item/stack/tile/floor/techmaint/perforated
	footstep_type = "floor"

	floor_smooth = SMOOTH_WHITELIST
	flooring_whitelist = list(/decl/flooring/tiling/techmaint, /decl/flooring/tiling/techmaint_panels)

/decl/flooring/tiling/techmaint_panels
	name = "floor"
	icon_base = "techmaint_panels"
	icon = 'icons/turf/flooring/tiles_maint.dmi'
	build_type = /obj/item/stack/tile/floor/techmaint/panels
	footstep_type = "floor"

	floor_smooth = SMOOTH_WHITELIST
	flooring_whitelist = list(/decl/flooring/tiling/techmaint_perforated, /decl/flooring/tiling/techmaint)

/decl/flooring/tiling/techmaint_cargo
	name = "floor"
	icon_base = "techmaint_cargo"
	icon = 'icons/turf/flooring/tiles_maint.dmi'
	build_type = /obj/item/stack/tile/floor/techmaint/cargo
	footstep_type = "floor"

/decl/flooring/tiling/new_tile/monofloor
	icon_base = "monofloor"
	color = COLOR_GUNMETAL

/decl/flooring/tiling/new_tile/steel_grid
	icon_base = "grid"
	color = COLOR_GUNMETAL
	build_type = /obj/item/stack/tile/grid

/decl/flooring/tiling/new_tile/steel_ridged
	icon_base = "ridged"
	color = COLOR_GUNMETAL
	build_type = /obj/item/stack/tile/ridge

/decl/flooring/wood
	name = "wooden floor"
	desc = "Polished wood planks."
	icon = 'icons/turf/flooring/wood.dmi'
	icon_base = "wood"
	has_damage_range = 6
	damage_temperature = T0C+200
	descriptor = "planks"
	build_type = /obj/item/stack/tile/wood
	flags = TURF_CAN_BREAK | TURF_IS_FRAGILE | TURF_REMOVE_SCREWDRIVER
	footstep_type = /decl/footsteps/wood
	color = WOOD_COLOR_GENERIC

/decl/flooring/wood/mahogany
	color = WOOD_COLOR_RICH
	build_type = /obj/item/stack/tile/mahogany

/decl/flooring/wood/maple
	color = WOOD_COLOR_PALE
	build_type = /obj/item/stack/tile/maple

/decl/flooring/wood/ebony
	color = WOOD_COLOR_BLACK
	build_type = /obj/item/stack/tile/ebony

/decl/flooring/wood/walnut
	color = WOOD_COLOR_CHOCOLATE
	build_type = /obj/item/stack/tile/walnut

/decl/flooring/wood/bamboo
	color = WOOD_COLOR_PALE2
	build_type = /obj/item/stack/tile/bamboo

/decl/flooring/wood/yew
	color = WOOD_COLOR_YELLOW
	build_type = /obj/item/stack/tile/yew

/decl/flooring/wood/wild1
	icon_base = "wooden_floor_s1"
	build_type = /obj/item/stack/tile/wood/ashen/red

/decl/flooring/wood/wild2
	icon_base = "wooden_floor_s2"
	build_type = /obj/item/stack/tile/wood/ashen/dull

/decl/flooring/wood/wild3
	icon_base = "wooden_floor_s3"
	build_type = /obj/item/stack/tile/wood/ashen

/decl/flooring/wood/wild4
	icon_base = "wooden_floor_s4"
	build_type = /obj/item/stack/tile/wood/old

/decl/flooring/wood/wild5
	icon_base = "wooden_floor_s5"
	build_type = /obj/item/stack/tile/wood/old/veridical

/decl/flooring/wood/wood_old
	icon = 'icons/turf/flooring/wood_old.dmi'
	icon_base = "wood"
	build_type = /obj/item/stack/tile/wood/wood_old

/decl/flooring/reinforced
	name = "reinforced floor"
	desc = "Heavily reinforced with a latticework on top of regular plating."
	icon = 'icons/turf/flooring/tiles.dmi'
	icon_base = "reinforced"
	flags = TURF_REMOVE_WRENCH | TURF_ACID_IMMUNE
	build_type = /obj/item/stack/material/sheet
	build_material = /decl/material/solid/metal/steel
	build_cost = 1
	build_time = 30
	apply_thermal_conductivity = 0.025
	apply_heat_capacity = 325000
	can_paint = 1
	footstep_type = /decl/footsteps/plating

/decl/flooring/reinforced/circuit
	name = "processing strata"
	icon = 'icons/turf/flooring/circuit.dmi'
	icon_base = "bcircuit"
	build_type = null
	flags = TURF_ACID_IMMUNE | TURF_CAN_BREAK | TURF_REMOVE_WRENCH
	can_paint = 1
	can_engrave = FALSE

/decl/flooring/reinforced/circuit/green
	icon_base = "gcircuit"

/decl/flooring/reinforced/circuit/red
	icon_base = "rcircuit"
	flags = TURF_ACID_IMMUNE
	can_paint = 0

/decl/flooring/reinforced/cult
	name = "engraved floor"
	desc = "Unsettling whispers waver from the surface..."
	icon = 'icons/turf/flooring/cult.dmi'
	icon_base = "cult"
	build_type = null
	has_damage_range = 6
	flags = TURF_ACID_IMMUNE | TURF_CAN_BREAK | TURF_REMOVE_WRENCH
	can_paint = null

/decl/flooring/reinforced/cult/on_remove()
	var/decl/special_role/cultist/cult = GET_DECL(/decl/special_role/cultist)
	cult.remove_cultiness(CULTINESS_PER_TURF)

/decl/flooring/reinforced/shuttle
	name = "floor"
	icon = 'icons/turf/shuttle.dmi'
	build_type = null
	flags = TURF_ACID_IMMUNE | TURF_CAN_BREAK | TURF_REMOVE_CROWBAR
	can_paint = 1
	can_engrave = FALSE

/decl/flooring/reinforced/shuttle/blue
	icon_base = "floor"

/decl/flooring/reinforced/shuttle/yellow
	icon_base = "floor2"

/decl/flooring/reinforced/shuttle/white
	icon_base = "floor3"

/decl/flooring/reinforced/shuttle/red
	icon_base = "floor4"

/decl/flooring/reinforced/shuttle/purple
	icon_base = "floor5"

/decl/flooring/reinforced/shuttle/darkred
	icon_base = "floor6"

/decl/flooring/reinforced/shuttle/black
	icon_base = "floor7"

/decl/flooring/crystal
	name = "crystal floor"
	icon = 'icons/turf/flooring/crystal.dmi'
	build_type = null
	flags = TURF_ACID_IMMUNE | TURF_CAN_BREAK | TURF_REMOVE_CROWBAR
	color = "#00ffe1"

/decl/flooring/glass
	name = "glass flooring"
	desc = "A window to the world outside. Or the world beneath your feet, rather."
	icon = 'icons/turf/flooring/glass.dmi'
	icon_base = "glass"
	build_type = /obj/item/stack/material/pane
	build_material = /decl/material/solid/glass
	build_cost = 1
	build_time = 30
	damage_temperature = T100C
	flags = TURF_REMOVE_CROWBAR | TURF_ACID_IMMUNE
	can_engrave = FALSE
	color = GLASS_COLOR
	z_flags = ZM_MIMIC_DEFAULTS
	footstep_type = /decl/footsteps/plating

/decl/flooring/glass/boro
	name = "borosilicate glass flooring"
	build_material = /decl/material/solid/glass/borosilicate
	color = GLASS_COLOR_SILICATE
	damage_temperature = T0C + 4000

/decl/flooring/snow
	name = "snow"
	desc = "Let it sno-ow... Let it snow..."
	icon = 'icons/turf/snow.dmi'
	icon_base = "snow"
	has_base_range = 12
	flags = TURF_REMOVE_SHOVEL
	build_type = null
	can_engrave = FALSE
	footstep_type = /decl/footsteps/snow

/decl/flooring/pool
	name = "pool floor"
	desc = "Sunken flooring designed to hold liquids."
	icon = 'icons/turf/flooring/pool.dmi'
	icon_base = "pool"
	build_type = /obj/item/stack/tile/pool
	flags = TURF_HAS_CORNERS | TURF_HAS_INNER_CORNERS | TURF_REMOVE_CROWBAR
	footstep_type = /decl/footsteps/tiles
	floor_smooth = SMOOTH_NONE
	wall_smooth = SMOOTH_NONE
	space_smooth = SMOOTH_NONE
	height = -FLUID_OVER_MOB_HEAD * 2

// SOJ
/decl/flooring/tiling/steel
	name = "floor"
	icon_base = "tiles"
	icon = 'icons/turf/flooring/tiles_steel.dmi'
	build_type = /obj/item/stack/tile/floor/steel
	footstep_type = "floor"

/decl/flooring/tiling/steel/panels
	icon_base = "panels"
	build_type = /obj/item/stack/tile/floor/steel/panels

/decl/flooring/tiling/steel/techfloor
	icon_base = "techfloor"
	build_type = /obj/item/stack/tile/floor/steel/techfloor

/decl/flooring/tiling/steel/techfloor_grid
	icon_base = "techfloor_grid"
	build_type = /obj/item/stack/tile/floor/steel/techfloor_grid

/decl/flooring/tiling/steel/brown_perforated
	icon_base = "brown_perforated"
	build_type = /obj/item/stack/tile/floor/steel/brown_perforated

/decl/flooring/tiling/steel/gray_perforated
	icon_base = "gray_perforated"
	build_type = /obj/item/stack/tile/floor/steel/gray_perforated

/decl/flooring/tiling/steel/cargo
	icon_base = "cargo"
	build_type = /obj/item/stack/tile/floor/steel/cargo

/decl/flooring/tiling/steel/brown_platform
	icon_base = "brown_platform"
	build_type = /obj/item/stack/tile/floor/steel/brown_platform

/decl/flooring/tiling/steel/gray_platform
	icon_base = "gray_platform"
	build_type = /obj/item/stack/tile/floor/steel/gray_platform

/decl/flooring/tiling/steel/danger
	icon_base = "danger"
	build_type = /obj/item/stack/tile/floor/steel/danger

/decl/flooring/tiling/steel/golden
	icon_base = "golden"
	build_type = /obj/item/stack/tile/floor/steel/golden

/decl/flooring/tiling/steel/bluecorner
	icon_base = "bluecorner"
	build_type = /obj/item/stack/tile/floor/steel/bluecorner

/decl/flooring/tiling/steel/orangecorner
	icon_base = "orangecorner"
	build_type = /obj/item/stack/tile/floor/steel/orangecorner

/decl/flooring/tiling/steel/cyancorner
	icon_base = "cyancorner"
	build_type = /obj/item/stack/tile/floor/steel/cyancorner

/decl/flooring/tiling/steel/violetcorener
	icon_base = "violetcorener"
	build_type = /obj/item/stack/tile/floor/steel/violetcorener

/decl/flooring/tiling/steel/monofloor
	icon_base = "monofloor"
	build_type = /obj/item/stack/tile/floor/steel/monofloor
	has_base_range = 15

/decl/flooring/tiling/steel/bar_flat
	icon_base = "bar_flat"
	build_type = /obj/item/stack/tile/floor/steel/bar_flat

/decl/flooring/tiling/steel/bar_dance
	icon_base = "bar_dance"
	build_type = /obj/item/stack/tile/floor/steel/bar_dance

/decl/flooring/tiling/steel/bar_light
	icon_base = "bar_light"
	build_type = /obj/item/stack/tile/floor/steel/bar_light

/decl/flooring/tiling/dark/panels
	icon_base = "panels"
	build_type = /obj/item/stack/tile/floor/dark/panels

/decl/flooring/tiling/dark/techfloor
	icon_base = "techfloor"
	build_type = /obj/item/stack/tile/floor/dark/techfloor

/decl/flooring/tiling/dark/techfloor_grid
	icon_base = "techfloor_grid"
	build_type = /obj/item/stack/tile/floor/dark/techfloor_grid

/decl/flooring/tiling/dark/brown_perforated
	icon_base = "brown_perforated"
	build_type = /obj/item/stack/tile/floor/dark/brown_perforated

/decl/flooring/tiling/dark/gray_perforated
	icon_base = "gray_perforated"
	build_type = /obj/item/stack/tile/floor/dark/gray_perforated

/decl/flooring/tiling/dark/cargo
	icon_base = "cargo"
	build_type = /obj/item/stack/tile/floor/dark/cargo

/decl/flooring/tiling/dark/brown_platform
	icon_base = "brown_platform"
	build_type = /obj/item/stack/tile/floor/dark/brown_platform

/decl/flooring/tiling/dark/gray_platform
	icon_base = "gray_platform"
	build_type = /obj/item/stack/tile/floor/dark/gray_platform

/decl/flooring/tiling/dark/danger
	icon_base = "danger"
	build_type = /obj/item/stack/tile/floor/dark/danger

/decl/flooring/tiling/dark/golden
	icon_base = "golden"
	build_type = /obj/item/stack/tile/floor/dark/golden

/decl/flooring/tiling/dark/bluecorner
	icon_base = "bluecorner"
	build_type = /obj/item/stack/tile/floor/dark/bluecorner

/decl/flooring/tiling/dark/orangecorner
	icon_base = "orangecorner"
	build_type = /obj/item/stack/tile/floor/dark/orangecorner

/decl/flooring/tiling/dark/cyancorner
	icon_base = "cyancorner"
	build_type = /obj/item/stack/tile/floor/dark/cyancorner

/decl/flooring/tiling/dark/violetcorener
	icon_base = "violetcorener"
	build_type = /obj/item/stack/tile/floor/dark/violetcorener

/decl/flooring/tiling/dark/monofloor
	icon_base = "monofloor"
	build_type = /obj/item/stack/tile/floor/dark/monofloor
	has_base_range = 15

/decl/flooring/tiling/white/panels
	icon_base = "panels"
	build_type = /obj/item/stack/tile/floor/white/panels

/decl/flooring/tiling/white/techfloor
	icon_base = "techfloor"
	build_type = /obj/item/stack/tile/floor/white/techfloor

/decl/flooring/tiling/white/techfloor_grid
	icon_base = "techfloor_grid"
	build_type = /obj/item/stack/tile/floor/white/techfloor_grid

/decl/flooring/tiling/white/brown_perforated
	icon_base = "brown_perforated"
	build_type = /obj/item/stack/tile/floor/white/brown_perforated

/decl/flooring/tiling/white/gray_perforated
	icon_base = "gray_perforated"
	build_type = /obj/item/stack/tile/floor/white/gray_perforated

/decl/flooring/tiling/white/cargo
	icon_base = "cargo"
	build_type = /obj/item/stack/tile/floor/white/cargo

/decl/flooring/tiling/white/brown_platform
	icon_base = "brown_platform"
	build_type = /obj/item/stack/tile/floor/white/brown_platform

/decl/flooring/tiling/white/gray_platform
	icon_base = "gray_platform"
	build_type = /obj/item/stack/tile/floor/white/gray_platform

/decl/flooring/tiling/white/danger
	icon_base = "danger"
	build_type = /obj/item/stack/tile/floor/white/danger

/decl/flooring/tiling/white/golden
	icon_base = "golden"
	build_type = /obj/item/stack/tile/floor/white/golden

/decl/flooring/tiling/white/bluecorner
	icon_base = "bluecorner"
	build_type = /obj/item/stack/tile/floor/white/bluecorner

/decl/flooring/tiling/white/orangecorner
	icon_base = "orangecorner"
	build_type = /obj/item/stack/tile/floor/white/orangecorner

/decl/flooring/tiling/white/cyancorner
	icon_base = "cyancorner"
	build_type = /obj/item/stack/tile/floor/white/cyancorner

/decl/flooring/tiling/white/violetcorener
	icon_base = "violetcorener"
	build_type = /obj/item/stack/tile/floor/white/violetcorener

/decl/flooring/tiling/white/monofloor
	icon_base = "monofloor"
	build_type = /obj/item/stack/tile/floor/white/monofloor
	has_base_range = 15