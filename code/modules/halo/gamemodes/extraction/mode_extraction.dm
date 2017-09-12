/datum/game_mode/extraction
	name = "Hostage Extraction"
	round_description = "Rescue hostages from the insurrectionists"
	extended_round_description = "Insurrectionists have taken hostages on one of the outer colonies. A team of UNSC hostage rescue specialists has been dispatched to retreive them"
	config_tag = "extraction"
	votable = 1
	probability = 0

	required_players = 8
	ert_disabled = 1 //No help for you, *YOU* are the special ops team this time!
	auto_recall_shuttle = 1 //This shouldn't happen. But just in case

	var/list/marines = list()
	var/list/innies = list()
	var/list/hostages = list()
	var/list/jobs = list("marine" = /datum/job/extraction/marine, "innie" = /datum/job/extraction/innie, "hostage" = /datum/job/extraction/hostage)

	var/hostages_alive = 0
	var/marines_alive = 0
	var/innies_alive = 0

/datum/game_mode/extraction/post_setup()
	..()
	for(var/mob/living/carbon/human/H in world)
		if(H.mind.assigned_role == jobs["marine"])
			marines += H
		else if(H.mind.assigned_role == jobs["innie"])
			innies += H
		else
			hostages += H
