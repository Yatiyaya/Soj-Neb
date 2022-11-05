/obj/random/booze
	name = "random booze"
	icon_state = "cannister-red"

/obj/random/booze/spawn_choices()
	return list(/obj/item/chems/drinks/bottle/small/beer = 7,
				/obj/item/chems/drinks/bottle/small/ale = 1,
				/obj/item/chems/drinks/bottle/absinthe = 1,
				/obj/item/chems/drinks/bottle/bluecuracao = 1,
				/obj/item/chems/drinks/bottle/gin = 1,
				/obj/item/chems/drinks/bottle/kahlua = 1,
				/obj/item/chems/drinks/bottle/melonliquor = 1,
				/obj/item/chems/drinks/bottle/rum = 1,
				/obj/item/chems/drinks/bottle/tequila = 1,
				/obj/item/chems/drinks/bottle/vodka = 2,
				/obj/item/chems/drinks/bottle/whiskey = 1,
				/obj/item/chems/drinks/bottle/patron = 1,
				/obj/item/chems/drinks/bottle/goldschlager = 1,
				/obj/item/chems/drinks/bottle/wine = 1,
				/obj/item/chems/drinks/bottle/cognac = 1,
				/obj/item/chems/drinks/bottle/vermouth = 1,
				/obj/item/chems/drinks/bottle/pwine = 1)

/obj/random/booze/low_chance
	name = "low chance random booze"
	icon_state = "cannister-red-low"
	spawn_nothing_percentage = 60
