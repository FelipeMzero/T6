#include maps\mp\_utility;
#include common_scripts\utility;
#include maps\mp\gametypes_zm\_hud_util;
#include maps\mp\zombies\_zm_utility;

init()
{
    level thread onPlayerConnect();
}

onPlayerConnect()
{
    for(;;)
    {
        level waittill("connected", player);
        player thread onPlayerSpawned();
    }
}

onPlayerSpawned()
{
    self endon("disconnect");
    for(;;)
    {
        self waittill("spawned_player");
        self thread monitor_button_press();
    }
}

monitor_button_press()
{
    self endon("disconnect");
    self endon("death");
    
    for(;;)
    {
        // Verifica se o jogador está segurando a Mira (ADS) e apertando o botão da Faca (Melee)
        if ( self adsbuttonpressed() && self meleebuttonpressed() )
        {
            mapname = getDvar("mapname");
            
            if ( mapname == "zm_tomb" ) // Se estiver no Origins
            {
                self iprintlnbold("^2[Cheat] Cajado de Raio Melhorado Ativado!");
                current_weapon = self getCurrentWeapon();
                if ( current_weapon != "none" )
                {
                    self takeWeapon( current_weapon );
                }
                self giveWeapon( "staff_lightning_upgraded_zm" );
                self switchToWeapon( "staff_lightning_upgraded_zm" );
                self giveMaxAmmo( "staff_lightning_upgraded_zm" );
            }
            else // Se estiver em qualquer outro mapa do jogo
            {
                self iprintlnbold("^2[Cheat] Ray Gun Mark II Melhorada Ativada!");
                current_weapon = self getCurrentWeapon();
                if ( current_weapon != "none" )
                {
                    self takeWeapon( current_weapon );
                }
                self giveWeapon( "raygun_mark2_upgraded_zm" );
                self switchToWeapon( "raygun_mark2_upgraded_zm" );
                self giveMaxAmmo( "raygun_mark2_upgraded_zm" );
            }
            
            wait 2.0; // Tempo de espera para evitar ativações repetidas por acidente
        }
        wait 0.1;
    }
}
