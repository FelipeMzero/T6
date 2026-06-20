#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\zombies\_zm_utility;
#include maps\mp\zombies\_zm_weapons;
#include maps\mp\zombies\_zm_magicbox;
#include maps\mp\zombies\_zm_score;

main()
{
	replacefunc(maps\mp\zombies\_zm_weapons::get_pack_a_punch_weapon_options, ::pap_melhorado_get_options);
}

init()
{
	level thread pap_melhorado_init();
	level thread pap_melhorado_preco_reduzido();
}

pap_melhorado_init()
{
	level endon("end_game");

	wait 2;

	for (;;)
	{
		level waittill("connected", jogador);
		jogador thread pap_melhorado_jogador();
	}
}

pap_melhorado_jogador()
{
	self endon("disconnect");
	level endon("end_game");

	self.pap_niveis = [];

	self waittill("spawned_player");
	wait 1;

	self iPrintLnBold("^3Pack-a-Punch Melhorado ATIVO");
	self iPrintLnBold("^7Todas as armas podem ser melhoradas! Aperte ^2[{+use}] ^7no PaP");

	self thread pap_monitorar_uso();
}

pap_monitorar_uso()
{
	self endon("disconnect");
	level endon("end_game");

	for (;;)
	{
		self waittill("weapon_upgrade");

		arma = self getCurrentWeapon();

		if (arma == "none")
		{
			continue;
		}

		if (!isDefined(self.pap_niveis[arma]))
		{
			self.pap_niveis[arma] = 0;
		}

		self.pap_niveis[arma]++;

		nivel = self.pap_niveis[arma];

		self thread pap_aplicar_melhorias(arma, nivel);
	}
}

pap_aplicar_melhorias(arma, nivel)
{
	self endon("disconnect");
	level endon("end_game");

	if (nivel == 1)
	{
		self iPrintLnBold("^2Arma Melhorada! ^7(Nivel 1)");
		self notify("pap_complete");
		return;
	}

	multiplicador_dano = 1.0 + (nivel * 0.25);
	bonus_carregador = nivel * 10;
	bonus_municao = nivel * 50;
	bonus_precisao = nivel * 0.05;

	self iPrintLnBold("^3Repack Nivel " + nivel + "!");
	self iPrintLnBold("^7Dano: ^2+" + (nivel * 25) + "% ^7| Carregador: ^2+" + bonus_carregador);

	self notify("pap_complete");
}

pap_melhorado_get_options(arma)
{
	nivel = 1;

	if (self isDefined() && isDefined(self.pap_niveis[arma]))
	{
		nivel = self.pap_niveis[arma] + 1;
	}

	opcoes = [];

	opcoes.weapon = arma;
	opcoes.damage = 1.0 + (nivel * 0.35);
	opcoes.clipsize = weaponClipSize(arma) + (nivel * 15);
	opcoes.maxammo = weaponMaxAmmo(arma) + (nivel * 100);
	opcoes.firetime = 0.95 - (nivel * 0.02);

	if (opcoes.firetime < 0.5)
	{
		opcoes.firetime = 0.5;
	}

	return opcoes;
}

pap_melhorado_preco_reduzido()
{
	level endon("end_game");

	wait 3;

	for (;;)
	{
		gatilhos = getentarray("specialty_weapupgrade", "targetname");

		for (i = 0; i < gatilhos.size; i++)
		{
			if (isDefined(gatilhos[i]) && !isDefined(gatilhos[i].pap_melhorado_modificado))
			{
				gatilhos[i].pap_melhorado_modificado = true;
				gatilhos[i] thread pap_modificar_preco();
			}
		}

		wait 10;
	}
}

pap_modificar_preco()
{
	self endon("end_game");

	preco = 2500;

	for (;;)
	{
		if (isDefined(self) && isDefined(self.zombie_cost))
		{
			if (self.zombie_cost != preco)
			{
				self.zombie_cost = preco;
			}
		}

		self sethintstring("Mantenha [{+activate}] para melhorar sua arma no Pack-a-Punch [Custo: " + preco + "]");

		wait 5;
	}
}
