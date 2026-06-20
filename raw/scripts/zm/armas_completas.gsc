#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\zombies\_zm_utility;
#include maps\mp\zombies\_zm_magicbox;
#include maps\mp\zombies\_zm_weapons;

main()
{
}

init()
{
	level thread armas_completas_init();
	level thread spawn_novas_armas_parede();
}

armas_completas_init()
{
	level endon("end_game");

	wait 2;

	level thread conectar_jogadores();

	wait 1;

	pool_unificado = armas_completas_lista_zm();

	level.zombie_box_pool_1 = pool_unificado;
	level.zombie_box_pool_2 = pool_unificado;
	level.zombie_box_pool_3 = pool_unificado;
	level.zombie_box_pool_4 = pool_unificado;

	for (;;)
	{
		wait 10;

		if (isDefined(level.zombie_box_pool_1))
		{
			level.zombie_box_pool_1 = pool_unificado;
		}
		if (isDefined(level.zombie_box_pool_2))
		{
			level.zombie_box_pool_2 = pool_unificado;
		}
		if (isDefined(level.zombie_box_pool_3))
		{
			level.zombie_box_pool_3 = pool_unificado;
		}
		if (isDefined(level.zombie_box_pool_4))
		{
			level.zombie_box_pool_4 = pool_unificado;
		}
	}
}

conectar_jogadores()
{
	for (;;)
	{
		level waittill("connected", jogador);
		jogador thread avisar_armas_completas();
	}
}

avisar_armas_completas()
{
	self endon("disconnect");
	self waittill("spawned_player");
	wait 2;
	self iPrintLnBold("^2Armas Completas ATIVO");
	self iPrintLnBold("^7Todas as armas de todas as fases liberadas na caixa misteriosa!");
}

armas_completas_lista_zm()
{
	armas = [];

	armas[armas.size] = "m14_zm";
	armas[armas.size] = "rottweil72_zm";
	armas[armas.size] = "870mcs_zm";
	armas[armas.size] = "ak74u_zm";
	armas[armas.size] = "mp5k_zm";
	armas[armas.size] = "m16_zm";
	armas[armas.size] = "b23r_zm";
	armas[armas.size] = "m1911_zm";
	armas[armas.size] = "python_zm";
	armas[armas.size] = "m1927_zm";
	armas[armas.size] = "uzi_zm";
	armas[armas.size] = "mp40_zm";
	armas[armas.size] = "fiveseven_zm";
	armas[armas.size] = "svu_zm";
	armas[armas.size] = "galil_zm";
	armas[armas.size] = "fal_zm";
	armas[armas.size] = "remington_new_model_army_zm";
	armas[armas.size] = "m8a1_zm";
	armas[armas.size] = "an94_zm";
	armas[armas.size] = "type25_zm";
	armas[armas.size] = "swat556_zm";
	armas[armas.size] = "mtar_zm";
	armas[armas.size] = "scorpion_zm";
	armas[armas.size] = "vector_zm";
	armas[armas.size] = "mp7_zm";
	armas[armas.size] = "chicom_zm";
	armas[armas.size] = "pdw57_zm";
	armas[armas.size] = "dsr50_zm";
	armas[armas.size] = "ballista_zm";
	armas[armas.size] = "svg_zm";
	armas[armas.size] = "xpr50_zm";
	armas[armas.size] = "rmb_zm";
	armas[armas.size] = "lsat_zm";
	armas[armas.size] = "mk48_zm";
	armas[armas.size] = "hammr_zm";
	armas[armas.size] = "rpk_zm";
	armas[armas.size] = "s12_zm";
	armas[armas.size] = "m1216_zm";
	armas[armas.size] = "saiga12_zm";
	armas[armas.size] = "ksg_zm";
	armas[armas.size] = "executioner_zm";
	armas[armas.size] = "tac45_zm";
	armas[armas.size] = "kap40_zm";
	armas[armas.size] = "browninghp_zm";
	armas[armas.size] = "mr6_zm";
	armas[armas.size] = "usp45_zm";
	armas[armas.size] = "raygun_zm";
	armas[armas.size] = "raygun_mark2_zm";

	armas[armas.size] = "wunderwaffe_zm";
	armas[armas.size] = "thundergun_zm";
	armas[armas.size] = "scavenger_zm";
	armas[armas.size] = "wintershowl_zm";
	armas[armas.size] = "babymaker_zm";

	armas[armas.size] = "staff_ice_zm";
	armas[armas.size] = "staff_fire_zm";
	armas[armas.size] = "staff_wind_zm";
	armas[armas.size] = "staff_lightning_zm";
	armas[armas.size] = "staff_ice_upgraded_zm";
	armas[armas.size] = "staff_fire_upgraded_zm";
	armas[armas.size] = "staff_wind_upgraded_zm";
	armas[armas.size] = "staff_lightning_upgraded_zm";

	armas[armas.size] = "jetgun_zm";
	armas[armas.size] = "sliquifier_zm";
	armas[armas.size] = "blundergat_zm";
	armas[armas.size] = "acid_gat_zm";
	armas[armas.size] = "paralyzer_zm";
	armas[armas.size] = "one_inch_punch_zm";
	armas[armas.size] = "tomahawk_zm";

	return armas;
}

spawn_novas_armas_parede()
{
	level endon("end_game");

	wait 3;

	if (!isDefined(level.zombie_weapons))
	{
		return;
	}

	interesses = getentarray("zombie_weapon_upgrade", "targetname");

	if (!isDefined(interesses) || interesses.size <= 0)
	{
		return;
	}

	novas_armas =
	[
		["raygun_mark2_zm", 1000],
		["an94_zm", 2000],
		["pdw57_zm", 1500],
		["galil_zm", 2000],
		["mp40_zm", 1000],
		["rpk_zm", 2500],
		["svu_zm", 1500],
		["ksg_zm", 1500],
		["dsr50_zm", 2000],
		["browninghp_zm", 1000],
		["staff_ice_zm", 5000],
		["staff_fire_zm", 5000],
		["staff_wind_zm", 5000],
		["staff_lightning_zm", 5000],
		["staff_ice_upgraded_zm", 10000],
		["staff_fire_upgraded_zm", 10000],
		["staff_wind_upgraded_zm", 10000],
		["staff_lightning_upgraded_zm", 10000],
		["jetgun_zm", 3000],
		["sliquifier_zm", 5000],
		["blundergat_zm", 5000],
		["acid_gat_zm", 8000],
		["paralyzer_zm", 5000],
		["one_inch_punch_zm", 3000],
		["tomahawk_zm", 2000]
	];

	for (i = 0; i < novas_armas.size; i++)
	{
		arma_nome = novas_armas[i][0];
		arma_custo = novas_armas[i][1];

		if (!isDefined(level.zombie_weapons[arma_nome]))
		{
			level.zombie_weapons[arma_nome] = [];
			level.zombie_weapons[arma_nome].cost = arma_custo;
			level.zombie_weapons[arma_nome].hint = "Mantenha [{+activate}] para comprar ^3" + arma_nome + " ^7[Custo: " + arma_custo + "]";
		}
	}
}
