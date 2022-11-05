// simulated/floor is currently plating by default, but there really should be an explicit plating type.
/turf/simulated/floor/plating
	name = "plating"
	icon = 'icons/turf/flooring/plating.dmi'
	icon_state = "plating"
	layer = PLATING_LAYER

/turf/simulated/floor/plating/under
	name = "underplating"
	icon_state = "under"
	icon = 'icons/turf/flooring/plating.dmi'

/turf/simulated/floor/bluegrid
	name = "mainframe floor"
	icon = 'icons/turf/flooring/circuit.dmi'
	icon_state = "bcircuit"
	initial_flooring = /decl/flooring/reinforced/circuit
	light_range = 2
	light_power = 3
	light_color = COLOR_BLUE

/turf/simulated/floor/bluegrid/airless
	initial_gas = null

/turf/simulated/floor/greengrid
	name = "mainframe floor"
	icon = 'icons/turf/flooring/circuit.dmi'
	icon_state = "gcircuit"
	initial_flooring = /decl/flooring/reinforced/circuit/green
	light_range = 2
	light_power = 3
	light_color = COLOR_GREEN

/turf/simulated/floor/blackgrid
	name = "mainframe floor"
	icon = 'icons/turf/flooring/circuit.dmi'
	icon_state = "rcircuit"
	initial_flooring = /decl/flooring/reinforced/circuit/red
	light_range = 2
	light_power = 2
	light_color = COLOR_RED

/turf/simulated/floor/greengrid/airless
	initial_gas = null

/turf/simulated/floor/wood
	name = "wooden floor"
	icon = 'icons/turf/flooring/wood.dmi'
	icon_state = "wood"
	color = WOOD_COLOR_GENERIC
	initial_flooring = /decl/flooring/wood

/turf/simulated/floor/wood/mahogany
	color = WOOD_COLOR_RICH
	initial_flooring = /decl/flooring/wood/mahogany

/turf/simulated/floor/wood/maple
	color = WOOD_COLOR_PALE
	initial_flooring = /decl/flooring/wood/maple

/turf/simulated/floor/wood/ebony
	color = WOOD_COLOR_BLACK
	initial_flooring = /decl/flooring/wood/ebony

/turf/simulated/floor/wood/walnut
	color = WOOD_COLOR_CHOCOLATE
	initial_flooring = /decl/flooring/wood/walnut

/turf/simulated/floor/wood/bamboo
	color = WOOD_COLOR_PALE2
	initial_flooring = /decl/flooring/wood/bamboo

/turf/simulated/floor/wood/yew
	color = WOOD_COLOR_YELLOW
	initial_flooring = /decl/flooring/wood/yew

/turf/simulated/floor/wood/wild1
	icon_state = "wooden_floor_s1"
	initial_flooring = /decl/flooring/wood/wild1

/turf/simulated/floor/wood/wild2
	icon_state = "wooden_floor_s2"
	initial_flooring = /decl/flooring/wood/wild2

/turf/simulated/floor/wood/wild3
	icon_state = "wooden_floor_s3"
	initial_flooring = /decl/flooring/wood/wild3

/turf/simulated/floor/wood/wild4
	icon_state = "wooden_floor_s4"
	initial_flooring = /decl/flooring/wood/wild4

/turf/simulated/floor/wood/wild5
	icon_state = "wooden_floor_s5"
	initial_flooring = /decl/flooring/wood/wild5

/turf/simulated/floor/wood_old
	name = "wooden floor"
	icon = 'icons/turf/flooring/wood_old.dmi'
	icon_state = "wood"
	initial_flooring = /decl/flooring/wood/wood_old

/turf/simulated/floor/grass
	name = "grass patch"
	icon = 'icons/turf/flooring/grass.dmi'
	icon_state = "grass0"
	initial_flooring = /decl/flooring/grass

/turf/simulated/floor/carpet
	name = "brown carpet"
	icon = 'icons/turf/flooring/carpet.dmi'
	icon_state = "brown"
	initial_flooring = /decl/flooring/carpet

/turf/simulated/floor/carpet/blue
	name = "blue carpet"
	icon_state = "blue1"
	initial_flooring = /decl/flooring/carpet/blue

/turf/simulated/floor/carpet/blue2
	name = "pale blue carpet"
	icon_state = "blue2"
	initial_flooring = /decl/flooring/carpet/blue2

/turf/simulated/floor/carpet/blue3
	name = "sea blue carpet"
	icon_state = "blue3"
	initial_flooring = /decl/flooring/carpet/blue3

/turf/simulated/floor/carpet/magenta
	name = "magenta carpet"
	icon_state = "magenta"
	initial_flooring = /decl/flooring/carpet/magenta

/turf/simulated/floor/carpet/purple
	name = "purple carpet"
	icon_state = "purple"
	initial_flooring = /decl/flooring/carpet/purple

/turf/simulated/floor/carpet/orange
	name = "orange carpet"
	icon_state = "orange"
	initial_flooring = /decl/flooring/carpet/orange

/turf/simulated/floor/carpet/green
	name = "green carpet"
	icon_state = "green"
	initial_flooring = /decl/flooring/carpet/green

/turf/simulated/floor/carpet/red
	name = "red carpet"
	icon_state = "red"
	initial_flooring = /decl/flooring/carpet/red

/*Carpet*/

/turf/simulated/floor/carpet
	name = "red carpet"
	icon = 'icons/turf/flooring/carpet.dmi'
	icon_state = "carpet"
	initial_flooring = /decl/flooring/carpet

/turf/simulated/floor/carpet/bcarpet
	name = "black carpet"
	icon_state = "bcarpet"
	initial_flooring = /decl/flooring/carpet/bcarpet

/turf/simulated/floor/carpet/blucarpet
	name = "blue carpet"
	icon_state = "blucarpet"
	initial_flooring = /decl/flooring/carpet/blucarpet

/turf/simulated/floor/carpet/turcarpet
	name = "turquoise carpet"
	icon_state = "turcarpet"
	initial_flooring = /decl/flooring/carpet/turcarpet

/turf/simulated/floor/carpet/sblucarpet
	name = "silver blue carpet"
	icon_state = "sblucarpet"
	initial_flooring = /decl/flooring/carpet/sblucarpet

/turf/simulated/floor/carpet/gaycarpet
	name = "pink carpet"
	icon_state = "gaycarpet"
	initial_flooring = /decl/flooring/carpet/gaycarpet

/turf/simulated/floor/carpet/purcarpet
	name = "purple carpet"
	icon_state = "purcarpet"
	initial_flooring = /decl/flooring/carpet/purcarpet

/turf/simulated/floor/carpet/oracarpet
	name = "orange carpet"
	icon_state = "oracarpet"
	initial_flooring = /decl/flooring/carpet/oracarpet

/turf/simulated/floor/reinforced
	name = "reinforced floor"
	icon = 'icons/turf/flooring/tiles.dmi'
	icon_state = "reinforced"
	initial_flooring = /decl/flooring/reinforced

/turf/simulated/floor/reinforced/airless
	initial_gas = null

/turf/simulated/floor/reinforced/airmix
	initial_gas = list(/decl/material/gas/oxygen = MOLES_O2ATMOS, /decl/material/gas/nitrogen = MOLES_N2ATMOS)

/turf/simulated/floor/reinforced/nitrogen
	initial_gas = list(/decl/material/gas/nitrogen = ATMOSTANK_NITROGEN)

/turf/simulated/floor/reinforced/hydrogen
	initial_gas = list(/decl/material/gas/hydrogen = ATMOSTANK_HYDROGEN)

/turf/simulated/floor/reinforced/oxygen
	initial_gas = list(/decl/material/gas/oxygen = ATMOSTANK_OXYGEN)

/turf/simulated/floor/reinforced/nitrogen/engine
	name = "engine floor"
	initial_gas = list(/decl/material/gas/nitrogen = MOLES_N2STANDARD)

/turf/simulated/floor/reinforced/hydrogen/fuel
	initial_gas = list(/decl/material/gas/hydrogen = ATMOSTANK_HYDROGEN_FUEL)

/turf/simulated/floor/reinforced/carbon_dioxide
	initial_gas = list(/decl/material/gas/carbon_dioxide = ATMOSTANK_CO2)

/turf/simulated/floor/reinforced/n20
	initial_gas = list(/decl/material/gas/nitrous_oxide = ATMOSTANK_NITROUSOXIDE)

/turf/simulated/floor/reinforced/plasma
	initial_gas = list(/decl/material/gas/hydrogen/tritium = ATMOSTANK_TRITIUM)



/turf/simulated/floor/cult
	name = "engraved floor"
	icon = 'icons/turf/flooring/cult.dmi'
	icon_state = "cult"
	initial_flooring = /decl/flooring/reinforced/cult

/turf/simulated/floor/cult/cultify()
	return

//Tiled floor + sub-types

/turf/simulated/floor/tiled
	name = "steel floor"
	icon = 'icons/turf/flooring/tiles.dmi'
	icon_state = "steel"
	initial_flooring = /decl/flooring/tiling

/turf/simulated/floor/tiled/dark
	name = "dark floor"
	icon = 'icons/turf/flooring/tiles_dark.dmi'
	icon_state = "dark"
	initial_flooring = /decl/flooring/tiling/dark

/turf/simulated/floor/tiled/dark/monotile
	name = "floor"
	icon_state = "monotiledark"
	initial_flooring = /decl/flooring/tiling/mono/dark

/turf/simulated/floor/tiled/dark/airless
	initial_gas = null

/turf/simulated/floor/tiled/white
	name = "white floor"
	icon = 'icons/turf/flooring/tiles_white.dmi'
	icon_state = "white"
	initial_flooring = /decl/flooring/tiling/white

/turf/simulated/floor/tiled/white/monotile
	name = "floor"
	icon_state = "monotile"
	initial_flooring = /decl/flooring/tiling/mono/white

/turf/simulated/floor/tiled/monofloor
	name = "floor"
	icon_state = "steel_monofloor"
	initial_flooring = /decl/flooring/tiling/mono

/turf/simulated/floor/tiled/white/airless
	name = "airless floor"
	initial_gas = null
	temperature = TCMB

/turf/simulated/floor/tiled/freezer
	name = "tiles"
	icon_state = "freezer"
	initial_flooring = /decl/flooring/tiling/freezer

/turf/simulated/floor/tiled/techmaint
	name = "floor"
	icon = 'icons/turf/flooring/tiles.dmi'
	icon_state = "techmaint"
	initial_flooring = /decl/flooring/tiling/new_tile/techmaint

/turf/simulated/floor/tiled/techfloor
	name = "floor"
	icon = 'icons/turf/flooring/techfloor.dmi'
	icon_state = "techfloor_gray"
	initial_flooring = /decl/flooring/tiling/tech

/turf/simulated/floor/tiled/techfloor/grid
	name = "floor"
	icon_state = "techfloor_grid"
	initial_flooring = /decl/flooring/tiling/tech/grid

/turf/simulated/floor/tiled/techmaint_perforated
	name = "floor"
	icon = 'icons/turf/flooring/tiles_maint.dmi'
	icon_state = "techmaint_perforated"
	initial_flooring = /decl/flooring/tiling/techmaint_perforated

/turf/simulated/floor/tiled/techmaint_panels
	name = "floor"
	icon = 'icons/turf/flooring/tiles_maint.dmi'
	icon_state = "techmaint_panels"
	initial_flooring = /decl/flooring/tiling/techmaint_panels

/turf/simulated/floor/tiled/techmaint_cargo
	name = "floor"
	icon = 'icons/turf/flooring/tiles_maint.dmi'
	icon_state = "techmaint_cargo"
	initial_flooring = /decl/flooring/tiling/techmaint_cargo

/turf/simulated/floor/tiled/cafe
	name = "floor"
	icon = 'icons/turf/flooring/tiles.dmi'
	icon_state = "cafe"
	initial_flooring = /decl/flooring/tiling/cafe

/turf/simulated/floor/tiled/monofloor
	name = "floor"
	icon_state = "monofloor"
	initial_flooring = /decl/flooring/tiling/new_tile/monofloor

/turf/simulated/floor/tiled/monotile
	name = "floor"
	icon_state = "steel_monotile"
	initial_flooring = /decl/flooring/tiling/mono

/turf/simulated/floor/tiled/steel_grid
	name = "floor"
	icon_state = "steel_grid"
	initial_flooring = /decl/flooring/tiling/new_tile/steel_grid

/turf/simulated/floor/tiled/steel_ridged
	name = "floor"
	icon_state = "steel_ridged"
	initial_flooring = /decl/flooring/tiling/new_tile/steel_ridged

/turf/simulated/floor/tiled/old_tile
	name = "floor"
	icon_state = "tile_full"
	initial_flooring = /decl/flooring/tiling/new_tile

/turf/simulated/floor/tiled/old_cargo
	name = "floor"
	icon_state = "cargo_one_full"
	initial_flooring = /decl/flooring/tiling/new_tile/cargo_one

/turf/simulated/floor/tiled/kafel_full
	name = "floor"
	icon_state = "kafel_full"
	initial_flooring = /decl/flooring/tiling/new_tile/kafel

/turf/simulated/floor/tiled/stone
	name = "stone slab floor"
	icon_state = "stone_full"
	initial_flooring = /decl/flooring/tiling/stone

/turf/simulated/floor/lino
	name = "lino"
	icon = 'icons/turf/flooring/linoleum.dmi'
	icon_state = "lino"
	initial_flooring = /decl/flooring/linoleum

//ATMOS PREMADES
/turf/simulated/floor/reinforced/airless
	name = "vacuum floor"
	initial_gas = null
	temperature = TCMB

/turf/simulated/floor/airless
	name = "airless plating"
	initial_gas = null
	temperature = TCMB

/turf/simulated/floor/tiled/airless
	name = "airless floor"
	initial_gas = null
	temperature = TCMB

/turf/simulated/floor/bluegrid/airless
	name = "airless floor"
	initial_gas = null
	temperature = TCMB

/turf/simulated/floor/greengrid/airless
	name = "airless floor"
	initial_gas = null
	temperature = TCMB

/turf/simulated/floor/greengrid/nitrogen
	initial_gas = list(/decl/material/gas/nitrogen = MOLES_N2STANDARD)

// Placeholders
/turf/simulated/floor/airless/lava
	name = "lava"
	icon = 'icons/turf/flooring/lava.dmi'
	icon_state = "lava"

/turf/simulated/floor/ice
	name = "ice"
	icon = 'icons/turf/exterior/ice.dmi'
	icon_state = "0"

/turf/simulated/floor/snow
	name = "snow"
	icon = 'icons/turf/snow.dmi'
	icon_state = "snow"
	initial_flooring = /decl/flooring/snow

/turf/simulated/floor/light
/turf/simulated/floor/airless/ceiling

/turf/simulated/floor/beach
	name = "beach"
	icon = 'icons/turf/flooring/beach.dmi'

/turf/simulated/floor/beach/sand
	name = "sand"
	icon_state = "sand"

/turf/simulated/floor/beach/sand/desert
	icon_state = "desert"

/turf/simulated/floor/beach/sand/desert/Initialize()
	. = ..()
	icon_state = "desert[rand(0,5)]"

/turf/simulated/floor/beach/sand/drywater
	icon_state = "sand1"

/turf/simulated/floor/beach/coastline
	name = "coastline"
	icon = 'icons/turf/flooring/beach2.dmi'
	icon_state = "sandwater"
	turf_flags = TURF_IS_WET

/turf/simulated/floor/beach/water
	name = "water"
	icon_state = "water"
	turf_flags = TURF_IS_WET

/turf/simulated/floor/beach/water/is_flooded(lying_mob, absolute)
	. = absolute ? ..() : lying_mob

/turf/simulated/floor/beach/water/update_dirt()
	return	// Water doesn't become dirty

/turf/simulated/floor/beach/water/ocean
	icon_state = "seadeep"

/turf/simulated/floor/beach/water/Initialize()
	. = ..()
	overlays += image("icon"='icons/turf/flooring/beach.dmi',"icon_state"="water5","layer"=MOB_LAYER+0.1)

/turf/simulated/floor/beach/water/coastwater
	icon_state = "beach"

/turf/simulated/floor/beach/water/coastwatercorner
	icon_state = "beachcorner"

/turf/simulated/floor/beach/water/swamp
	icon_state = "seashallow_swamp"

/turf/simulated/floor/beach/water/jungle
	icon_state = "seashallow_jungle1"

/turf/simulated/floor/beach/water/flooded
	icon_state = "seashallow_jungle2"

/turf/simulated/floor/beach/water/ice
	icon_state = "seashallow_frozen"

/turf/simulated/floor/beach/water/ocean
	icon_state = "seadeep"

/turf/simulated/floor/beach/water/jungledeep
	icon_state = "seashallow_jungle3"

/turf/simulated/floor/beach/water/shallow
	icon_state = "seashallow"

/turf/simulated/floor/crystal
	name = "crystal floor"
	icon = 'icons/turf/flooring/crystal.dmi'
	icon_state = ""
	initial_flooring = /decl/flooring/crystal

/turf/simulated/floor/glass
	name = "glass floor"
	icon = 'icons/turf/flooring/glass.dmi'
	icon_state = "glass"
	initial_flooring = /decl/flooring/glass

/turf/simulated/floor/glass/boro
	initial_flooring = /decl/flooring/glass/boro

//Water go splish
/turf/simulated/floor/pool
	name = "pool floor"
	icon = 'icons/turf/flooring/pool.dmi'
	icon_state = "pool"
	initial_flooring = /decl/flooring/pool

//Soj

/turf/simulated/floor/tiled/steel
	name = "floor"
	icon = 'icons/turf/flooring/tiles_steel.dmi'
	icon_state = "tiles"
	initial_flooring = /decl/flooring/tiling/steel

/turf/simulated/floor/tiled/steel/panels
	icon_state = "panels"
	initial_flooring = /decl/flooring/tiling/steel/panels

/turf/simulated/floor/tiled/steel/techfloor
	icon_state = "techfloor"
	initial_flooring = /decl/flooring/tiling/steel/techfloor

/turf/simulated/floor/tiled/steel/techfloor_grid
	icon_state = "techfloor_grid"
	initial_flooring = /decl/flooring/tiling/steel/techfloor_grid

/turf/simulated/floor/tiled/steel/brown_perforated
	icon_state = "brown_perforated"
	initial_flooring = /decl/flooring/tiling/steel/brown_perforated

/turf/simulated/floor/tiled/steel/gray_perforated
	icon_state = "gray_perforated"
	initial_flooring = /decl/flooring/tiling/steel/gray_perforated

/turf/simulated/floor/tiled/steel/cargo
	icon_state = "cargo"
	initial_flooring = /decl/flooring/tiling/steel/cargo

/turf/simulated/floor/tiled/steel/brown_platform
	icon_state = "brown_platform"
	initial_flooring = /decl/flooring/tiling/steel/brown_platform

/turf/simulated/floor/tiled/steel/gray_platform
	icon_state = "gray_platform"
	initial_flooring = /decl/flooring/tiling/steel/gray_platform

/turf/simulated/floor/tiled/steel/danger
	icon_state = "danger"
	initial_flooring = /decl/flooring/tiling/steel/danger

/turf/simulated/floor/tiled/steel/golden
	icon_state = "golden"
	initial_flooring = /decl/flooring/tiling/steel/golden

/turf/simulated/floor/tiled/steel/bluecorner
	icon_state = "bluecorner"
	initial_flooring = /decl/flooring/tiling/steel/bluecorner

/turf/simulated/floor/tiled/steel/orangecorner
	icon_state = "orangecorner"
	initial_flooring = /decl/flooring/tiling/steel/orangecorner

/turf/simulated/floor/tiled/steel/cyancorner
	icon_state = "cyancorner"
	initial_flooring = /decl/flooring/tiling/steel/cyancorner

/turf/simulated/floor/tiled/steel/violetcorener
	icon_state = "violetcorener"
	initial_flooring = /decl/flooring/tiling/steel/violetcorener

/turf/simulated/floor/tiled/steel/monofloor
	icon_state = "monofloor"
	initial_flooring = /decl/flooring/tiling/steel/monofloor

/turf/simulated/floor/tiled/steel/bar_flat
	icon_state = "bar_flat"
	initial_flooring = /decl/flooring/tiling/steel/bar_flat

/turf/simulated/floor/tiled/steel/bar_dance
	icon_state = "bar_dance"
	initial_flooring = /decl/flooring/tiling/steel/bar_dance

/turf/simulated/floor/tiled/steel/bar_light
	icon_state = "bar_light"
	initial_flooring = /decl/flooring/tiling/steel/bar_light

/turf/simulated/floor/tiled/dark/panels
	icon_state = "panels"
	initial_flooring = /decl/flooring/tiling/dark/panels

/turf/simulated/floor/tiled/dark/techfloor
	icon_state = "techfloor"
	initial_flooring = /decl/flooring/tiling/dark/techfloor

/turf/simulated/floor/tiled/dark/techfloor_grid
	icon_state = "techfloor_grid"
	initial_flooring = /decl/flooring/tiling/dark/techfloor_grid

/turf/simulated/floor/tiled/dark/brown_perforated
	icon_state = "brown_perforated"
	initial_flooring = /decl/flooring/tiling/dark/brown_perforated

/turf/simulated/floor/tiled/dark/gray_perforated
	icon_state = "gray_perforated"
	initial_flooring = /decl/flooring/tiling/dark/gray_perforated

/turf/simulated/floor/tiled/dark/cargo
	icon_state = "cargo"
	initial_flooring = /decl/flooring/tiling/dark/cargo

/turf/simulated/floor/tiled/dark/brown_platform
	icon_state = "brown_platform"
	initial_flooring = /decl/flooring/tiling/dark/brown_platform

/turf/simulated/floor/tiled/dark/gray_platform
	icon_state = "gray_platform"
	initial_flooring = /decl/flooring/tiling/dark/gray_platform

/turf/simulated/floor/tiled/dark/danger
	icon_state = "danger"
	initial_flooring = /decl/flooring/tiling/dark/danger

/turf/simulated/floor/tiled/dark/golden
	icon_state = "golden"
	initial_flooring = /decl/flooring/tiling/dark/golden

/turf/simulated/floor/tiled/dark/bluecorner
	icon_state = "bluecorner"
	initial_flooring = /decl/flooring/tiling/dark/bluecorner

/turf/simulated/floor/tiled/dark/orangecorner
	icon_state = "orangecorner"
	initial_flooring = /decl/flooring/tiling/dark/orangecorner

/turf/simulated/floor/tiled/dark/cyancorner
	icon_state = "cyancorner"
	initial_flooring = /decl/flooring/tiling/dark/cyancorner

/turf/simulated/floor/tiled/dark/violetcorener
	icon_state = "violetcorener"
	initial_flooring = /decl/flooring/tiling/dark/violetcorener

/turf/simulated/floor/tiled/dark/monofloor
	icon_state = "monofloor"
	initial_flooring = /decl/flooring/tiling/dark/monofloor

/turf/simulated/floor/tiled/white/panels
	icon_state = "panels"
	initial_flooring = /decl/flooring/tiling/white/panels

/turf/simulated/floor/tiled/white/techfloor
	icon_state = "techfloor"
	initial_flooring = /decl/flooring/tiling/white/techfloor

/turf/simulated/floor/tiled/white/techfloor_grid
	icon_state = "techfloor_grid"
	initial_flooring = /decl/flooring/tiling/white/techfloor_grid

/turf/simulated/floor/tiled/white/brown_perforated
	icon_state = "brown_perforated"
	initial_flooring = /decl/flooring/tiling/white/brown_perforated

/turf/simulated/floor/tiled/white/gray_perforated
	icon_state = "gray_perforated"
	initial_flooring = /decl/flooring/tiling/white/gray_perforated

/turf/simulated/floor/tiled/white/cargo
	icon_state = "cargo"
	initial_flooring = /decl/flooring/tiling/white/cargo

/turf/simulated/floor/tiled/white/brown_platform
	icon_state = "brown_platform"
	initial_flooring = /decl/flooring/tiling/white/brown_platform

/turf/simulated/floor/tiled/white/gray_platform
	icon_state = "gray_platform"
	initial_flooring = /decl/flooring/tiling/white/gray_platform

/turf/simulated/floor/tiled/white/danger
	icon_state = "danger"
	initial_flooring = /decl/flooring/tiling/white/danger

/turf/simulated/floor/tiled/white/golden
	icon_state = "golden"
	initial_flooring = /decl/flooring/tiling/white/golden

/turf/simulated/floor/tiled/white/bluecorner
	icon_state = "bluecorner"
	initial_flooring = /decl/flooring/tiling/white/bluecorner

/turf/simulated/floor/tiled/white/orangecorner
	icon_state = "orangecorner"
	initial_flooring = /decl/flooring/tiling/white/orangecorner

/turf/simulated/floor/tiled/white/cyancorner
	icon_state = "cyancorner"
	initial_flooring = /decl/flooring/tiling/white/cyancorner

/turf/simulated/floor/tiled/white/violetcorener
	icon_state = "violetcorener"
	initial_flooring = /decl/flooring/tiling/white/violetcorener

/turf/simulated/floor/tiled/white/monofloor
	icon_state = "monofloor"
	initial_flooring = /decl/flooring/tiling/white/monofloor