init()
{
    thread ammo_infinito_init();
}

ammo_infinito_init()
{
    wait 1;
    players = getplayers();
    for ( i = 0; i < players.size; i++ )
    {
        if ( isDefined( players[i] ) )
            players[i] thread _ammo_loop();
    }
    for ( ;; )
    {
        level waittill( "connected", jogador );
        jogador thread _ammo_loop();
    }
}

_ammo_loop()
{
    self endon( "disconnect" );

    self.muni_infinita = false;
    botaoPressionado = false;

    for ( ;; )
    {
        // Ativa/Desativa pressionando MIRA + CORPO A CORPO (ADS + Melee)
        if ( self adsButtonPressed() && self meleeButtonPressed() )
        {
            if ( !botaoPressionado )
            {
                botaoPressionado = true;
                self.muni_infinita = !self.muni_infinita;
                
                if ( self.muni_infinita )
                    self iPrintLnBold( "^2Municao Infinita: ON" );
                else
                    self iPrintLnBold( "^1Municao Infinita: OFF" );
            }
        }
        else
        {
            botaoPressionado = false;
        }

        if ( self.muni_infinita )
        {
            arma = self getCurrentWeapon();
            if ( arma != "none" )
            {
                clipSize = weaponClipSize( arma );
                if ( self getWeaponAmmoClip( arma ) < clipSize )
                    self setWeaponAmmoClip( arma, clipSize );
                
                if ( self getWeaponAmmoStock( arma ) < 9000 )
                    self setWeaponAmmoStock( arma, 9999 );
            }
        }

        wait 0.05;
    }
}
