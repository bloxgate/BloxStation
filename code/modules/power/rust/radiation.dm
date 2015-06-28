
/obj/machinery/rust/rad_source
	var/mega_energy = 0
	var/time_alive = 0
	var/source_alive = 2
	New()
		..()

	process()
		..()
		//fade away over time
		for(var/mob/living/carbon/C in range(15, src))
			C.apply_effect(mega_energy, IRRADIATE)
		for(var/obj/machinery/power/rad_collector/R in rad_collectors)
			if(get_dist(R, src) <= 15) // Better than using orange() every process
				R.receive_pulse(mega_energy)
		if(source_alive > 0)
			time_alive++
			source_alive--
		else
			time_alive -= 0.1
			if(time_alive < 0)
				del(src)

		//radiate mobs nearby here
		//

/*
/obj/machinery/rust
	proc/RadiateParticle(var/energy, var/ionizing, var/dir = 0)
		if(!dir)
			RadiateParticleRand(energy, ionizing)
		var/obj/effect/accelerated_particle/particle = new
		particle.set_dir(dir)
		particle.ionizing = ionizing
		if(energy)
			particle.energy = energy
			//particle.invisibility = 2
		//
		return particle

	proc/RadiateParticleRand(var/energy, var/ionizing)
		var/turf/target
		var/particle_range = 3 * round(energy) + rand(3,20)
		if(energy > 1)
			//for penetrating radiation
			for(var/mob/M in range(particle_range))
				var/dist_ratio = particle_range / get_dist(M, src)
				//particles are more likely to hit a person if the person is closer
				// 1/8 = 12.5% (closest)
				// 1/360 = 0.27% (furthest)
				// variation of 12.2%
				if( rand() < (0.25 + dist_ratio * 12.5) )
					target = get_turf(M)
					break
			if(!target)
				target = pick(range(particle_range))
		else
			//for slower, non-penetrating radiation
			for(var/mob/M in view(particle_range))
				var/dist_ratio = particle_range / get_dist(M, src)
				if( rand() < (0.25 + dist_ratio * 12.5) )
					target = get_turf(M)
					break
			if(!target)
				target = pick(view(particle_range))
		var/obj/effect/accelerated_particle/particle = new
		particle.target = target
		particle.ionizing = ionizing
		if(energy)
			particle.energy = energy
			//particle.invisibility = 2
		//
		return particle
*/

/obj/machinery/computer/rust_radiation_monitor
	name = "Radiation Monitor"
	icon_state = "power"

/obj/machinery/computer/rust_radiation_monitor/proc/energy_levels()
	var/energy = 0
	for(var/obj/effect/rust_em_field/R in range(25, src))
		energy += R.mega_energy
	return energy

/obj/machinery/computer/rust_radiation_monitor/proc/rad_levels()
	var/rads = 0
	for(var/obj/machinery/rust/rad_source/R in range(25, src))
		rads += R.mega_energy
	return rads

/obj/machinery/computer/rust_radiation_monitor/attack_ai(mob/user)
	attack_hand(user)

/obj/machinery/computer/rust_radiation_monitor/attack_hand(mob/user)
	add_fingerprint(user)
	interact(user)

/obj/machinery/computer/rust_radiation_monitor/interact(mob/user)
	if(stat & BROKEN)
		user.unset_machine()
		user << browse(null, "window=core_rads")
		return
	if (!istype(user, /mob/living/silicon) && (get_dist(src, user) > 1 ))
		user.unset_machine()
		user << browse(null, "window=core_rads")
		return
	var/dat = ""
	if(stat & NOPOWER)
		return
	else
		dat += "<B>Reactor Core Radiation Monitor</B><BR>"
		dat += "Total Energy Level: <B>[energy_levels()]</B><BR>"
		dat += "Detected Core Radioemissions: <B>[rad_levels()]</B> rads/second<BR>"
		dat += "<hr>"
		dat += "<a href='?src=\ref[src];refresh=1'>Refresh data?</a><BR>"
		dat += "<a href='?src=\ref[src];close=1'>Close?</a><BR>"

	user << browse(dat, "window=core_rads;size=500x400")
	user.set_machine(src)

/obj/machinery/computer/rust_radiation_monitor/Topic(href, href_list)
	..()

	if( href_list["refresh"] )
		updateDialog()
	if( href_list["close"] )
		usr << browse(null, "window=core_rads")
		usr.unset_machine()
		updateDialog()
