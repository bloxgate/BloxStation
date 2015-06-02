/datum/species/boronian
	name = "Boronian"
	name_plural = "Boronians"
	language = "Boronian"
	primitive = /mob/living/carbon/monkey
	unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/punch, /datum/unarmed_attack/bite)

	blurb = "A highly mysterious, but generally peaceful race, the Boronians evolve on a planet \
	rich in boron, rather than carbon. Due to this unusual circumstance they cannot breathe oxygen \
	and will explode if they are exposed to it. </br> </br> \
	Due to their metallic structure, the Boronians are beleived to be extremely strong and able to \
	survive in extreme temperatures."

	cold_level_1 = 100
	cold_level_2 = 75
	cold_level_3 = 50

	heat_level_1 = 2349
	heat_level_2 = 3000
	heat_level_3 = 4200

	flags = CAN_JOIN | IS_WHITELISTED | HAS_LIPS | HAS_UNDERWEAR | HAS_EYE_COLOR

	flesh_color = "#808080"

	reagent_tag = IS_BORON
	base_color = "#555555"

	heat_discomfort_level = 1000
	heat_discomfort_strings = list(
		"A small trickle of boron rolls down your arm.",
		"You sweat slightly.",
		"You feel unusually warm."
		)
	cold_discomfort_level = 200
	cold_discomfort_strings = list(
		"Your metallic skin begins to contract.",
		"You feel ice forming on your skin."
		)
