// zm_sem_neblina.gsc
// Remove neblina de todos os mapas ZM (TranZit, Die Rise, Buried, Origins, etc.)

init()
{
	thread zm_sem_neblina_init();
}

zm_sem_neblina_init()
{
	// Aguarda o mapa inicializar completamente
	wait 1;

	// Aplica nos jogadores já conectados
	players = getplayers();
	for ( i = 0; i < players.size; i++ )
	{
		if ( isDefined( players[i] ) )
			players[i] thread _sem_neblina_jogador();
	}

	// Aplica para novos jogadores que entram durante a partida
	for ( ;; )
	{
		level waittill( "connected", jogador );
		jogador thread _sem_neblina_jogador();
	}
}

_sem_neblina_jogador()
{
	self endon( "disconnect" );

	// Pequeno delay para garantir que o cliente esteja pronto
	wait 0.5;

	for ( ;; )
	{
		// Desliga o sistema de neblina principal
		self setClientDvar( "r_fog",            "0"      );

		// Remove neblina de haze (bruma atmosférica)
		self setClientDvar( "r_fogHazeDensity", "0"      );
		self setClientDvar( "r_fogHazeSpread",  "0"      );

		// Empurra as distâncias de neblina para muito longe
		self setClientDvar( "r_fogBaseDist",    "999999" );
		self setClientDvar( "r_fogStartDist",   "999999" );
		self setClientDvar( "r_fogMaxDist",     "999999" );

		// Remove neblina de altura
		self setClientDvar( "r_fogHeight",      "999999" );

		// Aguarda antes de reaplicar (mapas como TranZit resetam os valores)
		wait 3;
	}
}
