/decl/hierarchy/outfit/job/hrt
	name = "Rifleman"
	l_ear = /obj/item/device/radio/headset/unsc/odst
	glasses = /obj/item/clothing/glasses/hud/tactical
	uniform = /obj/item/clothing/under/unsc/odst_jumpsuit
	gloves = /obj/item/clothing/gloves/tactical
	shoes = /obj/item/clothing/shoes/jungleboots
	gloves = /obj/item/clothing/gloves/thick/combat
	belt = /obj/item/weapon/gun/projectile/m6c_magnum_s
	id_type = /obj/item/weapon/card/id/odst
	starting_accessories = list (/obj/item/clothing/accessory/rank/marine/enlisted/e4, /obj/item/clothing/accessory/holster/thigh, /obj/item/clothing/accessory/badge/tags)

	flags = 0

	hierarchy_type = /decl/hierarchy/outfit/job

/datum/job/extraction/marine
	title = "UNSC HRT"
	latejoin_at_spawnpoints = 1
	create_record = 0
	account_allowed = 0
	generate_email = 0
	outfit_type = /decl/hierarchy/outfit/job/hrt
	total_positions = 8
	spawn_positions =8
	track_players = 1
	selection_color = "#537046"

/decl/hierarchy/outfit/job/innie
	name = "Insurrectionist Crewmember"

	head = /obj/item/clothing/head/helmet/tactical
	glasses = /obj/item/clothing/glasses/hud/tactical
	mask = /obj/item/clothing/mask/balaclava/tactical
	suit = /obj/item/clothing/suit/storage/vest/tactical
	uniform = /obj/item/clothing/under/tactical
	shoes = /obj/item/clothing/shoes/tactical
	l_ear = /obj/item/device/radio/headset/insurrection
	gloves = /obj/item/clothing/gloves/tactical
	pda_slot = null

	flags = 0

/datum/job/extraction/innie
	title = "Insurrectionist"
	latejoin_at_spawnpoints = 1
	create_record = 0
	account_allowed = 0
	generate_email = 0
	outfit_type = /decl/hierarchy/outfit/job/innie
	total_positions = 4
	spawn_positions = 4
	track_players = 1
	selection_color = "#a30404"

/decl/hierarchy/outfit/job/hostage
	name = "Hostage"

	uniform = /obj/item/clothing/under/color/orange
	shoes = /obj/item/clothing/shoes/black
	mask = /obj/item/clothing/mask/muzzle/tape
	gloves = /obj/item/weapon/handcuffs/cable
	pda_slot = null

/datum/job/extraction/hostage
	title = "Hostage"
	latejoin_at_spawnpoints = 1
	create_record = 0
	account_allowed = 0
	generate_email = 0
	outfit_type = /decl/hierarchy/outfit/job/hostage
	total_positions = -1
	spawn_positions = -1
	track_players = 1
	selection_color = "#e5e222"


