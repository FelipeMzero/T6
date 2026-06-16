#include common_scripts\utility;
#include maps\mp\_utility;

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

estoque = self GetWeaponAmmoStock( arma );
self SetWeaponAmmoStock( arma, estoque + 1 );
}

wait 1;
}
}
