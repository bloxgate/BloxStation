
/datum/job/extraction/marine
	title = "UNSC HRT"
	latejoin_at_spawnpoints = 1
	create_record = 0
	account_allowed = 0
	generate_email = 0
	//TODO: outfit_type
	total_positions = -1
	spawn_positions = -1
	track_players = 1
	selection_color = "#537046"

/datum/job/extraction/marine/is_position_available()
	var/datum/game_mode/extraction/GM = ticker.mode
	var/datum/job/extraction/innie/I = GM.jobs["innie"]
	if(I.current_positions / current_positions > 0.25 || I.current_positions / current_positions == 0)
		return TRUE
	return FALSE

/datum/job/extraction/innie
	title = "Insurrectionist"
	latejoin_at_spawnpoints = 1
	create_record = 0
	account_allowed = 0
	generate_email = 0
	//TODO: outfit_type
	total_positions = 2
	spawn_positions = 2
	track_players = 1
	selection_color = "#a30404"

/datum/job/extraction/innie/is_position_available()
	var/datum/game_mode/extraction/GM = ticker.mode
	var/datum/job/extraction/marine/M = GM.jobs["marines"]
	while(current_positions / M.current_positions < 0.25)
		total_positions += 1
	if(current_positions < total_positions)
		return TRUE
	return FALSE

/datum/job/extraction/hostage
	title = "Hostage"
	latejoin_at_spawnpoints = 1
	create_record = 0
	account_allowed = 0
	generate_email = 0
	//TODO: outfit_type
	total_positions = -1
	spawn_positions = -1
	track_players = 1
	selection_color = "#e5e222"


