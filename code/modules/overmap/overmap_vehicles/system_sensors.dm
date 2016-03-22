/obj/effect/overmapobj/proc/start_tracking_sector(var/obj/machinery/overmap_vehicle/V)
	var/datum/sensor_object/S = PoolOrNew(datum/sensor_object)
	S.my_faction = faction
	S.object_faction = V.iff_faction_broadcast
	S.use_faction_colours = 1
	S.create_images(obj_icon_state = V.sensor_icon_state)

	for(var/mob/M in mobs_tracking)
		S.add_viewmob(M)

	all_sensor_objects.Add(S)
	tracked_vehicles[V] = S
