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

/datum/game_mode/extraction/proc/manage_players()
	marines = list()
	innies = list()
	hostages = list()

	for(var/mob/living/carbon/human/H in world)
		if(H.mind.assigned_role == jobs["marine"])
			marines += H
		else if(H.mind.assigned_role == jobs["innie"])
			innies += H
		else
			hostages += H

/datum/game_mode/extraction/post_setup()
	..()
	manage_players()

/datum/game_mode/extraction/check_finished()
	. = ..()
	for(var/mob/living/carbon/human/H in marines)
		if(H.stat != DEAD)
			break
		return 1
	for(var/mob/living/carbon/human/H in innies)
		if(H.stat != DEAD)
			break
		return 1
	for(var/mob/living/carbon/human/H in hostages)
		if(H.stat != DEAD)
			break
		return 1

/datum/game_mode/extraction/check_win()
	. = ..()
	manage_players() //Update player lists as needed

/datum/game_mode/extraction/declare_completion()
	. = ..()
	for(var/mob/living/carbon/human/H in hostages)
		if(H.stat != DEAD)
			break
		to_world("<FONT size = 3><B>Stalemate</B></FONT>")
		to_world("Hostages terminated")
		feedback_set_details("round_end_result", "halfwin - hostages died")
	for(var/mob/living/carbon/human/H in marines)
		if(H.stat == DEAD)
			break
		to_world("<FONT size = 3><B>UNSC Major Victory!</B></FONT>")
		to_world("<B>Insurrectionists Eliminated</B>")
		feedback_set_details("round_end_result", "loss - unsc terminated insurrection")
	for(var/mob/living/carbon/human/H in innies)
		if(H.stat == DEAD)
			break
		to_world("<FONT size = 3><B>Insurrectionist Major Victory!</B></FONT>")
		to_world("<B>UNSC Eliminated; Hostages Secured</B>")
		feedback_set_details("round_end_result", "win - unsc eliminated - hostages survive")