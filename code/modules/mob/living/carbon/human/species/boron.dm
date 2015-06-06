/datum/species/boronian
	name = "Boronian"
	name_plural = "Boronians"
	icobase = 'icons/mob/human_races/r_boronian.dmi'
	deform = 'icons/mob/human_races/r_def_boronian.dmi'
	language = "Boronian"
	primitive = /mob/living/carbon/monkey
	unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/punch, /datum/unarmed_attack/bite)

	blurb = "A highly mysterious, but generally peaceful race, the Boronians evolve on a planet \
	rich in boron, rather than carbon. Due to this unusual circumstance they cannot breathe oxygen \
	and will explode if they are exposed to it. </br> </br> \
	Due to their metallic structure, the Boronians are beleived to be extremely strong and able to \
	survive in extreme temperatures. Otherwise they are unbeleivably similar to humans."

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

	breath_type = "diborane"
	poison_type = "oxygen"

/datum/species/boronian/equip(/var/mob/living/carbon/human/H)
	..()
	H.unEquip(H.wear_suit)
	H.unEquip(H.head)
	if(H.mind.assigned_role != "Clown")
		H.unEquip(H.wear_mask)

	H.equip_to_slot_or_del(new /obj/item/clothing/mask/breath(H), slot_wear_mask)
	var/suit = /obj/item/clothing/suit/space
	var/helm = /obj/item/clothing/head/helmet/space
	var/tank_slot = slot_s_store
	var/tank_slot_name = "suit storage"
	H.equip_to_slot_or_del(new suit(H), slot_wear_suit)
	H.equip_to_slot_or_del(new helm(H), slot_head)
	H.equip_to_slot_or_del(new /obj/item/weapon/tank/diborane(H), tank_slot)
	H << "\blue Diborane tank activated from your [tank_slot_name]. Your species cannot breathe oxygen, you will die if you do not breath diborane."
	H.internal = tank_slot
	if(H.internals)
		H.internals.icon_state = "internal1"