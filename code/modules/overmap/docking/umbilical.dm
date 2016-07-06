/obj/docking_umbilical
	name = "Docking Umbilical"
	desc = "Connects to nearby ships"
	var/side
	var/obj/effect/overmapobj/ship/ship
	var/broke = FALSE
	var/id = "CHANGE ME OR SUFFER!"

/obj/docking_umbilical/New()
	tag = id

/obj/docking_umbilical/proc/can_connect(var/obj/effect/overmapobj/ship/otherShip, var/id)
	for(var/umbId in otherShip.connectors)
		if (umbId == id)
			var/obj/docking_umbilical/umbObj = locate(umbId)
			if (umbObj.side == turn(side, 180))
				return TRUE
			else
				return FALSE

