#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\zombies\_zm_utility;

main()
{
}

init()
{
level thread ammo_regen_iniciar();
}

ammo_regen_iniciar()
{
level endon( "end_game" );

for ( ;; )
{
level waittill( "connected", jogador );
jogador thread ammo_regen_jogador();
}
}

ammo_regen_jogador()
{
self endon( "disconnect" );
level endon( "end_game" );

self waittill( "spawned_player" );
wait 1;

for ( ;; )
{
self waittill( "spawned_player" );

self thread ammo_regen_loop();
}
}

ammo_regen_loop()
{
self endon( "disconnect" );
level endon( "end_game" );
self endon( "death" );
self endon( "player_downed" );

for ( ;; )
{
armas = self GetWeaponsList();

for ( i = 0; i < armas.size; i++ )
{
arma = armas[ i ];

if ( self GetFractionMaxAmmo( arma ) >= 1 )
{
continue;
}

if ( arma == "time_bomb_zm" || arma == "frag_grenade_zm" || arma == "cymbal_monkey_zm" || arma == "time_bomb_detonator_zm" || arma == "emp_grenade_zm" )
{
continue;
}

estoque = self GetWeaponAmmoStock( arma );
self SetWeaponAmmoStock( arma, estoque + 1 );
}

wait 1;
}
}
