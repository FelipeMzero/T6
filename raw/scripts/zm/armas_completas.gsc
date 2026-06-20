#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\zombies\_zm_utility;
#include maps\mp\zombies\_zm_magicbox;
#include maps\mp\zombies\_zm_weapons;
#include maps\mp\zombies\_zm_score;

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
	self iPrintLnBold("^7Todas as armas DLC na caixa + parede aleatoria em todo mapa!");
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

	armas_nomes = [];
	armas_custos = [];

	armas_nomes[0] = "raygun_mark2_zm"; armas_custos[0] = 1000;
	armas_nomes[1] = "an94_zm"; armas_custos[1] = 2000;
	armas_nomes[2] = "pdw57_zm"; armas_custos[2] = 1500;
	armas_nomes[3] = "galil_zm"; armas_custos[3] = 2000;
	armas_nomes[4] = "mp40_zm"; armas_custos[4] = 1000;
	armas_nomes[5] = "rpk_zm"; armas_custos[5] = 2500;
	armas_nomes[6] = "svu_zm"; armas_custos[6] = 1500;
	armas_nomes[7] = "ksg_zm"; armas_custos[7] = 1500;
	armas_nomes[8] = "dsr50_zm"; armas_custos[8] = 2000;
	armas_nomes[9] = "browninghp_zm"; armas_custos[9] = 1000;
	armas_nomes[10] = "staff_ice_zm"; armas_custos[10] = 5000;
	armas_nomes[11] = "staff_fire_zm"; armas_custos[11] = 5000;
	armas_nomes[12] = "staff_wind_zm"; armas_custos[12] = 5000;
	armas_nomes[13] = "staff_lightning_zm"; armas_custos[13] = 5000;
	armas_nomes[14] = "staff_ice_upgraded_zm"; armas_custos[14] = 10000;
	armas_nomes[15] = "staff_fire_upgraded_zm"; armas_custos[15] = 10000;
	armas_nomes[16] = "staff_wind_upgraded_zm"; armas_custos[16] = 10000;
	armas_nomes[17] = "staff_lightning_upgraded_zm"; armas_custos[17] = 10000;
	armas_nomes[18] = "jetgun_zm"; armas_custos[18] = 3000;
	armas_nomes[19] = "sliquifier_zm"; armas_custos[19] = 5000;
	armas_nomes[20] = "blundergat_zm"; armas_custos[20] = 5000;
	armas_nomes[21] = "acid_gat_zm"; armas_custos[21] = 8000;
	armas_nomes[22] = "paralyzer_zm"; armas_custos[22] = 5000;
	armas_nomes[23] = "one_inch_punch_zm"; armas_custos[23] = 3000;
	armas_nomes[24] = "tomahawk_zm"; armas_custos[24] = 2000;

	if (isDefined(level.zombie_weapons))
	{
		for (i = 0; i < armas_nomes.size; i++)
		{
			arma_nome = armas_nomes[i];
			arma_custo = armas_custos[i];

			if (!isDefined(level.zombie_weapons[arma_nome]))
			{
				level.zombie_weapons[arma_nome] = [];
				level.zombie_weapons[arma_nome].cost = arma_custo;
				level.zombie_weapons[arma_nome].hint = "Mantenha [{+activate}] para comprar ^3" + arma_nome + " ^7[Custo: " + arma_custo + "]";
			}
		}
	}

	level thread caixa_multiplas_localizacoes();
	level thread parede_comprar_aleatorio();
}

caixa_multiplas_localizacoes()
{
	level endon("end_game");

	wait 2;

	for (;;)
	{
		if (isDefined(level.chests))
		{
			for (i = 0; i < level.chests.size; i++)
			{
				if (isDefined(level.chests[i]) && !isDefined(level.chests[i].caixa_ativa_extra))
				{
					level.chests[i].caixa_ativa_extra = true;
					level.chests[i] thread caixa_reativar_periodicamente();
				}
			}
		}

		wait 15;
	}
}

caixa_reativar_periodicamente()
{
	self endon("end_game");

	for (;;)
	{
		if (isDefined(self) && isDefined(self.unitrigger_stub))
		{
			self.unitrigger_stub.enabled = true;
		}

		wait 10;
	}
}

parede_comprar_aleatorio()
{
	level endon("end_game");

	wait 4;

	origens = [];
	spawns = getentarray("info_player_start", "classname");

	for (i = 0; i < spawns.size; i++)
	{
		if (isDefined(spawns[i]) && isDefined(spawns[i].origin))
		{
			origens[origens.size] = spawns[i].origin;
		}
	}

	if (origens.size <= 0)
	{
		return;
	}

	for (i = 0; i < 15; i++)
	{
		origem_aleatoria = origens[randomint(origens.size)];

		offset_x = randomint(2000) - 1000;
		offset_y = randomint(2000) - 1000;

		pos = (origem_aleatoria[0] + offset_x, origem_aleatoria[1] + offset_y, origem_aleatoria[2]);

		indice_arma = randomint(armas_nomes.size);
		nome_arma = armas_nomes[indice_arma];
		custo_arma = armas_custos[indice_arma];

		trigger = spawn("trigger_use", pos);

		if (isDefined(trigger))
		{
			trigger.arma_aleatoria = nome_arma;
			trigger.custo_aleatorio = custo_arma;
			trigger.targetname = "compra_aleatoria";
			trigger.radius = 60;
			trigger thread trigger_compra_loop(nome_arma, custo_arma);
		}
	}
}

trigger_compra_loop(nome_arma, custo_arma)
{
	self endon("end_game");

	self sethintstring("Mantenha [{+activate}] para comprar ^3" + nome_arma + " ^7[Custo: " + custo_arma + "]");

	for (;;)
	{
		players = getplayers();

		for (p = 0; p < players.size; p++)
		{
			if (!isDefined(players[p]) || !isAlive(players[p]))
			{
				continue;
			}

			dist = distance(self.origin, players[p].origin);

			if (dist < 60 && players[p] useButtonPressed())
			{
				pontos = players[p] maps\mp\zombies\_zm_score::get_player_score();

				if (pontos >= custo_arma)
				{
					players[p] maps\mp\zombies\_zm_score::add_to_player_score(custo_arma * -1);
					players[p] giveWeapon(nome_arma);
					players[p] iPrintLnBold("^2Comprou: ^3" + nome_arma + " ^7por ^2" + custo_arma + " ^7pontos!");
				}
				else
				{
					players[p] iPrintLnBold("^1Pontos insuficientes! Precisa de ^2" + custo_arma);
				}
			}
		}

		wait 0.5;
	}
}
