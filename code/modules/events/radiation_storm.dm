/datum/event/radiation_storm
	var/const/enterBelt		= 30
	var/const/radIntervall 	= 5	// Enough time between enter/leave belt for 10 hits, as per original implementation
	var/const/leaveBelt		= 80
	var/const/revokeAccess	= 135
	announceWhen			= 1
	endWhen					= revokeAccess
	var/postStartTicks 		= 0
	var/radtype                = ""

/datum/event/radiation_storm/announce()
	radtype = pick("alpha","beta","gamma","delta")
	command_announcement.Announce("High levels of [radtype] radiation detected near the station. Please evacuate into one of the shielded maintenance tunnels.", "Anomaly Alert", new_sound = 'sound/AI/radiation.ogg')

/datum/event/radiation_storm/start()
	make_maint_all_access()

/datum/event/radiation_storm/tick()
	if(activeFor == enterBelt)
		command_announcement.Announce("The station has entered the radiation belt. Please remain in a sheltered area until we have passed the radiation belt.", "Anomaly Alert")
		radiate()

	if(activeFor >= enterBelt && activeFor <= leaveBelt)
		postStartTicks++

	if(postStartTicks == radIntervall)
		postStartTicks = 0
		radiate()

	else if(activeFor == leaveBelt)
		command_announcement.Announce("The station has passed the radiation belt. Please report to medbay if you experience any unusual symptoms. Maintenance will lose all access again shortly.", "Anomaly Alert")

/datum/event/radiation_storm/proc/radiate()
	//world << "radiation proc called for rad storm"
	for(var/mob/living/carbon/C in living_mob_list)
		var/area/A = get_area(C)
		if(!A)
			world << "area exists"
			continue
		if((A.z in config.station_levels))
			world << "area on station"
			continue
		if(A.rad_shielded)
			world << "area not shielded"
			continue
		//world << "mob passed location checks"

		if(istype(C,/mob/living/carbon/human))
			//world << "mob is human"
			var/mob/living/carbon/human/H = C
			H.apply_effect((rand(15,35)),IRRADIATE,0,radtype)
			//world << "radiation applied to [H]"
			if(prob(5))
				H.apply_effect((rand(40,70)),IRRADIATE,0,radtype)
				if (prob(75))
					randmutb(H) // Applies bad mutation
					domutcheck(H,null,MUTCHK_FORCED)
				else
					randmutg(H) // Applies good mutation
					domutcheck(H,null,MUTCHK_FORCED)
		else if(istype(C,/mob/living/carbon/monkey))
			C.apply_effect((rand(5,25)),IRRADIATE,0,radtype)

/datum/event/radiation_storm/end()
	revoke_maint_all_access()
