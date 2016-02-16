/*
ORES
*/

/obj/resources/ore
	var/name = "Generic Ore" //ore name
	var/desc = "A lump or ore"
	var/process = "Standard" //processing type
	var/resource = "generic" //processed result
	var/list/by_products = list("rock" = 1)
	var/list/chem_products = list()

/obj/resources/rock
	var/name = "Rock"
	var/desc = "chunks of rock"

/obj/resources/ore/copper_sulfide
	name = "Copper Sulfide"
	process = "sulfides"
	resource = "copper"
	by_products = list("selenide" = 1)

/obj/resources/ore/nickel_sulfide
	name = "Nickel Sulfide"
	process = "Nickel"
	resource = "copper"
	by_products = list("selenide" = 1)

/obj/resources/ore/lead_sulfide
	name = "Copper Sulfide"
	process = "sulfides"
	resource = "copper"
	by_products = list("selenide" = 1)

/obj/resources/ore/uraninite
	name = "Uraninite"
	process = "Standard"
	resource = "uranium"
	by_products = list("technetium" = 1, "lead oxide" = 1, "helium" = 1, "thorium" = 1, "prometheum" = 1)
	chem_products = list("radium" = 1)

/obj/resources/ore/thoranite
	name = "Thoranite"
	process = "Standard"
	resource = "thorium"
	by_products = list("uranium" = 1, "lanthanum" = 1, "cerium" = 1, "praseodymium" = 1, "neodymium" = 1, "helium" = 1)

/obj/resources/ore/chalcopyrite
	name = "Chalcopyrite"
	process = "Standard"
	resource = "copper"
	by_products = list("selenium dioxide" = 1)

/obj/resources/ore/chalcocite
	name = "Chalcocite"
	process = "Standard"
	resource = "copper"
	by_products = list("selenium dioxide" = 1)
/*
PROCESSES
*/
/datum/resource_process
	var/name = "Standard"
	var/list/requirements
	var/list/by_products
	var/list/chem_products
	var/list/valid_resources

/datum/resource_process
	name = "sulfides"
	chem_products = list("cyanide" = 1)