#if !defined(using_map_DATUM)

	#include "areas/hostage_areas.dm"
	#include "arcadia1.dmm"
	#include "arcadia2.dmm"
	#include "hrt_ship.dmm"
	#include "mapdef.dm"

	#define using_map_DATUM /datum/map/hostage_rescue

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Scenario: Hostage Rescue

#endif