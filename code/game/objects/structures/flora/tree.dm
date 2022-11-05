//trees
/obj/structure/flora/tree
	name = "tree"
	anchored = 1
	density = 1
	pixel_x = -16
	layer = ABOVE_HUMAN_LAYER
	var/protects_against_weather = FALSE
	var/stump = TRUE //Do we have a stump when cut down?
	var/shadow = TRUE //Do we have a shadow to drop?
	var/shadow_overlay = "shadow_overlay" //Are shadow underlay, looks nice
	var/stump_type = /obj/structure/flora/stump //What type stump do we have
	var/modular_shadow = TRUE //Are rng picker var, yes or no basiclly
	var/infested = FALSE //Is this tree infested?

/obj/structure/flora/tree/pine
	name = "pine tree"
	icon = 'icons/obj/flora/pinetrees.dmi'
	icon_state = "pine_1"
	protects_against_weather = TRUE

/obj/structure/flora/tree/pine/Initialize()
	. = ..()
	icon_state = "pine_[rand(1, 3)]"

/obj/structure/flora/tree/pine/xmas
	name = "\improper Christmas tree"
	desc = "O Christmas tree, O Christmas tree..."
	icon = 'icons/obj/flora/pinetrees.dmi'
	icon_state = "pine_c"

/obj/structure/flora/tree/pine/xmas/Initialize()
	. = ..()
	icon_state = "pine_c"

/obj/structure/flora/tree/dead
	icon = 'icons/obj/flora/deadtrees.dmi'
	icon_state = "tree_1"

/obj/structure/flora/tree/dead/Initialize()
	. = ..()
	icon_state = "tree_[rand(1, 6)]"

/obj/structure/flora/stump
	icon = 'icons/obj/flora/jungletree.dmi'
	name = "Tree stump"
	desc = "Once a tall tree, now a small stub in the groumd, without a voice..."
	anchored = FALSE
	density = FALSE
	icon_state = "tree_stump"
	pixel_x = -50
	pixel_y = -16

/obj/structure/flora/stump/small
	icon = 'icons/obj/flora/jungletreesmall.dmi'
	desc = "Once a growing tree, now a small stub in the groumd, without a voice..."
	icon_state = "tree_stump"

/obj/structure/flora/stump/small/New()
	..()
	icon_state = "tree_stump[rand(0, 6)]"

/obj/structure/flora/tree/sif
	name = "glowing tree"
	desc = "It's a tree, except this one seems quite alien. It glows a deep blue."
	icon = 'icons/obj/flora/deadtrees.dmi'
	icon_state = "tree_sif"
	stump = FALSE
	shadow = FALSE

/obj/structure/flora/tree/palm
	icon = 'icons/obj/flora/palmtrees.dmi'
	icon_state = "palm1"
	stump = FALSE
	shadow = FALSE

/obj/structure/flora/tree/jungle
	name = "tree"
	icon = 'icons/obj/flora/jungletree.dmi'
	shadow_overlay = "shadow_overlay"
	icon_state = "tree"
	pixel_x = -45
	pixel_y = -16

/obj/structure/flora/tree/jungle/baracade
	name = "fallen tree"
	desc = "A fallen tree, a natural blockage in jungels."
	icon = 'icons/obj/flora/jungletree.dmi'
	icon_state = "cant_get_up"
	pixel_x = -32
	pixel_y = -50
	stump = FALSE
	shadow = FALSE

/obj/structure/flora/tree/jungle/variant1
	icon = 'icons/obj/flora/jungletree.dmi'
	shadow_overlay = "shadow_overlay1"
	icon_state = "tree2"
	pixel_x = -45
	pixel_y = -16

/obj/structure/flora/tree/jungle/variant2
	icon = 'icons/obj/flora/jungletree.dmi'
	shadow_overlay = "shadow_overlay2"
	icon_state = "tree3"
	pixel_x = -45
	pixel_y = -16

/obj/structure/flora/tree/jungle/variant3
	icon = 'icons/obj/flora/jungletree.dmi'
	shadow_overlay = "shadow_overlay3"
	icon_state = "tree4"
	pixel_x = -45
	pixel_y = -16

/obj/structure/flora/tree/jungle/variant4
	icon = 'icons/obj/flora/jungletree.dmi'
	shadow_overlay = "shadow_overlay4"
	icon_state = "tree5"
	pixel_x = -45
	pixel_y = -16

/obj/structure/flora/tree/jungle/variant5
	icon = 'icons/obj/flora/jungletree.dmi'
	shadow_overlay = "shadow_overlay5"
	icon_state = "tree6"
	pixel_x = -45
	pixel_y = -16

/obj/structure/flora/tree/jungle_small
	icon = 'icons/obj/flora/jungletreesmall.dmi'
	shadow_overlay = "shadow_overlay"
	stump_type = /obj/structure/flora/stump/small
	icon_state = "tree"
	pixel_x = -30
	pixel_y = -16

/obj/structure/flora/tree/jungle_small/variant1
	icon = 'icons/obj/flora/jungletreesmall.dmi'
	shadow_overlay = "shadow_overlay1"
	icon_state = "tree2"
	pixel_x = -30
	pixel_y = -16

/obj/structure/flora/tree/jungle_small/variant2
	icon = 'icons/obj/flora/jungletreesmall.dmi'
	shadow_overlay = "shadow_overlay2"
	icon_state = "tree3"
	pixel_x = -30
	pixel_y = -16

/obj/structure/flora/tree/jungle_small/variant3
	icon = 'icons/obj/flora/jungletreesmall.dmi'
	shadow_overlay = "shadow_overlay3"
	icon_state = "tree4"
	pixel_x = -30
	pixel_y = -16

/obj/structure/flora/tree/jungle_small/variant4
	icon = 'icons/obj/flora/jungletreesmall.dmi'
	shadow_overlay = "shadow_overlay4"
	icon_state = "tree5"
	pixel_x = -30
	pixel_y = -16

/obj/structure/flora/tree/jungle_small/variant5
	icon = 'icons/obj/flora/jungletreesmall.dmi'
	shadow_overlay = "shadow_overlay5"
	icon_state = "tree6"
	pixel_x = -30
	pixel_y = -16

/obj/structure/flora/church_tree //fancy red tree
	name = "Cherry Tree"
	icon = 'icons/obj/flora/church_stuff.dmi'
	icon_state = "red_tree_alt"
	desc = "A large hard wood tree with bark like steel, typically used for meditation."
	anchored = TRUE
	density = FALSE
	layer = ABOVE_HUMAN_LAYER
	mouse_opacity = 2