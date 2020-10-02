
/* M118 Rounds */
//used by: MA5B, M739, M392

/obj/item/ammo_casing/m118
	desc = "A 7.62mm bullet casing."
	caliber = "7.62mm"
	projectile_type = /obj/item/projectile/bullet/m118

/obj/item/projectile/bullet/m118
	damage = 30
	shield_damage = -10 //Unspecialised kinetics are less powerful vs shields

/* M118 TTR Rounds */

/obj/item/ammo_casing/m118_ttr
	desc = "A 7.62mm TTR bullet casing."
	caliber = "7.62mm"
	projectile_type = /obj/item/projectile/bullet/m118_ttr

/obj/item/projectile/bullet/m118_ttr
	armor_penetration = 0
	nodamage = 1
	agony = 10
	damage_type = PAIN
	penetrating = 0

/* M119 Rounds */

/obj/item/ammo_casing/m119
	desc = "A 7.62mm HE bullet casing."
	caliber = "7.62mm"
	projectile_type = /obj/item/projectile/bullet/m119

/obj/item/projectile/bullet/m119
	damage = 35
	shield_damage = -10

/* M120 Rounds */

/obj/item/ammo_casing/m120
	desc = "A 7.62mm HP bullet casing."
	caliber = "7.62mmdmr"
	projectile_type = /obj/item/projectile/bullet/m120

/obj/item/projectile/bullet/m120
	damage = 40
	armor_penetration = 20
	shield_damage = 20
