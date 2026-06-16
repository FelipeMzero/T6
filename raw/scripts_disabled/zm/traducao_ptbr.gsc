#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\zombies\_zm_utility;

main()
{
}

init()
{
level thread ptbr_iniciar();
level thread ptbr_observar_conexoes();
level thread ptbr_traduzir_powerups();
level thread ptbr_traduzir_rounds();
}

ptbr_iniciar()
{
tentativas = 0;

while ( tentativas < 60 && ( !isDefined( level.zombie_hints ) || !isDefined( level.zombie_weapons ) ) )
{
wait 0.5;
tentativas++;
}

ptbr_traduzir_dicas_padrao();
ptbr_traduzir_armas_parede();

level thread ptbr_loop_atualizacao();
}

ptbr_loop_atualizacao()
{
level endon( "end_game" );

for ( ;; )
{
ptbr_atualizar_portas();
ptbr_atualizar_escombros();
ptbr_atualizar_perks();
ptbr_atualizar_pap();
ptbr_atualizar_energia();
ptbr_atualizar_caixa();
ptbr_atualizar_unitriggers();
ptbr_atualizar_bau_construcao();
ptbr_atualizar_armadilhas();

wait 3;
}
}

ptbr_traduzir_dicas_padrao()
{
if ( !isDefined( level.zombie_hints ) )
{
return;
}

chaves = getarraykeys( level.zombie_hints );

for ( i = 0; i < chaves.size; i++ )
{
chave = chaves[ i ];
custo = ptbr_sufixo_custo( chave );

if ( issubstr( chave, "buy_door" ) )
{
level.zombie_hints[ chave ] = "Mantenha [{+activate}] para abrir a passagem" + custo;
}
else if ( issubstr( chave, "buy_debris" ) || issubstr( chave, "clear_debris" ) )
{
level.zombie_hints[ chave ] = "Mantenha [{+activate}] para remover os escombros" + custo;
}
else if ( issubstr( chave, "buy_weapon" ) )
{
level.zombie_hints[ chave ] = "Mantenha [{+activate}] para comprar a arma" + custo;
}
else if ( issubstr( chave, "treasure_chest" ) || issubstr( chave, "random_weapon" ) )
{
level.zombie_hints[ chave ] = "Mantenha [{+activate}] para comprar uma arma aleatoria" + custo;
}
else if ( issubstr( chave, "pack_a_punch" ) || issubstr( chave, "weapon_upgrade" ) )
{
level.zombie_hints[ chave ] = "Mantenha [{+activate}] para melhorar sua arma no Pack-a-Punch" + custo;
}
else if ( issubstr( chave, "power" ) || issubstr( chave, "elec_switch" ) )
{
level.zombie_hints[ chave ] = "Mantenha [{+activate}] para ligar a energia";
}
else if ( issubstr( chave, "build" ) || issubstr( chave, "craft" ) )
{
level.zombie_hints[ chave ] = "Mantenha [{+activate}] para construir" + custo;
}
else if ( issubstr( chave, "zombie_shield" ) )
{
level.zombie_hints[ chave ] = "Mantenha [{+activate}] para pegar o escudo";
}
else if ( issubstr( chave, "turbine" ) )
{
level.zombie_hints[ chave ] = "Mantenha [{+activate}] para pegar a turbina";
}
else if ( issubstr( chave, "zombie_weapon" ) || issubstr( chave, "special_grenade" ) )
{
level.zombie_hints[ chave ] = "Mantenha [{+activate}] para pegar o equipamento";
}
}
}

ptbr_sufixo_custo( chave )
{
partes = strtok( chave, "_" );

if ( partes.size == 0 )
{
return "";
}

valor = int( partes[ partes.size - 1 ] );

if ( valor > 0 )
{
return " [Custo: " + valor + "]";
}

return "";
}

ptbr_traduzir_armas_parede()
{
if ( !isDefined( level.zombie_weapons ) )
{
return;
}

chaves = getarraykeys( level.zombie_weapons );

for ( i = 0; i < chaves.size; i++ )
{
arma = level.zombie_weapons[ chaves[ i ] ];

if ( !isDefined( arma ) )
{
continue;
}

custo = "";

if ( isDefined( arma.cost ) )
{
custo = " [Custo: " + arma.cost + "]";
}

arma.hint = "Mantenha [{+activate}] para comprar " + ptbr_nome_arma( chaves[ i ] ) + custo;
}
}

ptbr_atualizar_unitriggers()
{
if ( !isDefined( level._unitriggers ) || !isDefined( level._unitriggers.trigger_stubs ) )
{
return;
}

for ( i = 0; i < level._unitriggers.trigger_stubs.size; i++ )
{
stub = level._unitriggers.trigger_stubs[ i ];

if ( !isDefined( stub ) || !isDefined( stub.zombie_weapon_upgrade ) )
{
continue;
}

custo = "";

if ( isDefined( level.zombie_weapons[ stub.zombie_weapon_upgrade ] ) && isDefined( level.zombie_weapons[ stub.zombie_weapon_upgrade ].cost ) )
{
custo = " [Custo: " + level.zombie_weapons[ stub.zombie_weapon_upgrade ].cost + "]";
}

stub.hint_string = "Mantenha [{+activate}] para comprar " + ptbr_nome_arma( stub.zombie_weapon_upgrade ) + custo;
}
}

ptbr_atualizar_portas()
{
portas = getentarray( "zombie_door", "targetname" );

for ( i = 0; i < portas.size; i++ )
{
if ( !isDefined( portas[ i ].zombie_cost ) )
{
continue;
}

portas[ i ] sethintstring( "Mantenha [{+activate}] para abrir a passagem [Custo: " + portas[ i ].zombie_cost + "]" );
}
}

ptbr_atualizar_escombros()
{
escombros = getentarray( "zombie_debris", "targetname" );

for ( i = 0; i < escombros.size; i++ )
{
if ( !isDefined( escombros[ i ].zombie_cost ) )
{
continue;
}

escombros[ i ] sethintstring( "Mantenha [{+activate}] para remover os escombros [Custo: " + escombros[ i ].zombie_cost + "]" );
}
}

ptbr_atualizar_perks()
{
maquinas = getentarray( "zombie_vending", "targetname" );

for ( i = 0; i < maquinas.size; i++ )
{
maquina = maquinas[ i ];

if ( !isDefined( maquina.script_noteworthy ) )
{
continue;
}

nome = ptbr_nome_perk( maquina.script_noteworthy );

if ( !isDefined( nome ) )
{
continue;
}

if ( !ptbr_energia_ligada() && !ptbr_perk_funciona_sem_energia( maquina.script_noteworthy ) )
{
maquina sethintstring( "LIGUE A ENERGIA PRIMEIRO" );
continue;
}

maquina sethintstring( "Mantenha [{+activate}] para comprar " + nome + " [Custo: " + ptbr_custo_perk( maquina.script_noteworthy ) + "]" );
}
}

ptbr_nome_perk( perk )
{
switch ( perk )
{
case "specialty_armorvest":
return "Juggernog";
case "specialty_quickrevive":
return "Quick Revive";
case "specialty_fastreload":
return "Speed Cola";
case "specialty_rof":
return "Double Tap II";
case "specialty_longersprint":
return "Stamin-Up";
case "specialty_deadshot":
return "Deadshot Daiquiri";
case "specialty_additionalprimaryweapon":
return "Mule Kick";
case "specialty_finalstand":
return "Who's Who";
case "specialty_scavenger":
return "Tombstone Soda";
case "specialty_nomotionsensor":
return "Vulture-Aid";
case "specialty_grenadepulldeath":
return "Electric Cherry";
case "specialty_flakjacket":
return "PhD Flopper";
}
return undefined;
}

ptbr_descricao_perk( perk )
{
switch ( perk )
{
case "specialty_armorvest":
return "Aumenta a saude para 250. Essencial para sobreviver!";
case "specialty_quickrevive":
return "Revive aliados mais rapido. Em solo: revive automaticamente.";
case "specialty_fastreload":
return "Recarrega suas armas muito mais rapido.";
case "specialty_rof":
return "Aumenta o dano das armas em 100% (dobro)";
case "specialty_longersprint":
return "Corra por muito mais tempo sem se cansar.";
case "specialty_deadshot":
return "Mira automaticamente na cabeca dos zumbis. Reduz o balanco da mira.";
case "specialty_additionalprimaryweapon":
return "Carregue 3 armas: duas primarias e uma secundaria.";
case "specialty_finalstand":
return "Ao cair, vira um clone seu que pode se reviver.";
case "specialty_scavenger":
return "Mantem suas armas apos ser revivido. Recebe bonus de pontos.";
case "specialty_nomotionsensor":
return "Veja os zumbis através das paredes. Itens brilham no chao.";
case "specialty_grenadepulldeath":
return "Ao recarregar, cria um pulso eletrico que atordoa zumbis.";
case "specialty_flakjacket":
return "Elimina dano de queda e explosoes. Mergulho explode!";
}
return "";
}

ptbr_custo_perk( perk )
{
switch ( perk )
{
case "specialty_armorvest":
return 2500;
case "specialty_quickrevive":
if ( level.players.size < 2 )
{
return 500;
}
return 1500;
case "specialty_fastreload":
return 3000;
case "specialty_rof":
return 2000;
case "specialty_longersprint":
return 2000;
case "specialty_deadshot":
return 1500;
case "specialty_additionalprimaryweapon":
return 4000;
case "specialty_finalstand":
return 2000;
case "specialty_scavenger":
return 2000;
case "specialty_nomotionsensor":
return 3000;
case "specialty_grenadepulldeath":
return 2000;
case "specialty_flakjacket":
return 2000;
}
return 0;
}

ptbr_perk_funciona_sem_energia( perk )
{
return ( perk == "specialty_quickrevive" && level.players.size < 2 );
}

ptbr_energia_ligada()
{
if ( !isDefined( level.flag ) || !isDefined( level.flag[ "power_on" ] ) )
{
return true;
}
return level.flag[ "power_on" ];
}

ptbr_atualizar_pap()
{
gatilhos = getentarray( "specialty_weapupgrade", "targetname" );

for ( i = 0; i < gatilhos.size; i++ )
{
if ( !ptbr_energia_ligada() )
{
gatilhos[ i ] sethintstring( "LIGUE A ENERGIA PRIMEIRO" );
continue;
}

gatilhos[ i ] sethintstring( "Mantenha [{+activate}] para melhorar sua arma no Pack-a-Punch [Custo: 5000]" );
}
}

ptbr_atualizar_energia()
{
interruptores = getentarray( "use_elec_switch", "targetname" );

for ( i = 0; i < interruptores.size; i++ )
{
interruptores[ i ] sethintstring( "Mantenha [{+activate}] para ligar a energia" );
}
}

ptbr_atualizar_caixa()
{
if ( !isDefined( level.chests ) )
{
return;
}

for ( i = 0; i < level.chests.size; i++ )
{
if ( !isDefined( level.chests[ i ] ) || !isDefined( level.chests[ i ].unitrigger_stub ) )
{
continue;
}

level.chests[ i ].unitrigger_stub.hint_string = "Mantenha [{+activate}] para comprar uma arma aleatoria [Custo: 950]";
}
}

ptbr_atualizar_bau_construcao()
{
bau = getentarray( "zombie_buildable", "targetname" );

for ( i = 0; i < bau.size; i++ )
{
if ( isDefined( bau[ i ].build_name ) )
{
bau[ i ] sethintstring( "Mantenha [{+activate}] para construir: " + bau[ i ].build_name );
}
}
}

ptbr_atualizar_armadilhas()
{
armadilhas = getentarray( "zombie_trap", "targetname" );

for ( i = 0; i < armadilhas.size; i++ )
{
if ( !isDefined( armadilhas[ i ].zombie_cost ) )
{
continue;
}

armadilhas[ i ] sethintstring( "Mantenha [{+activate}] para ativar a armadilha [Custo: " + armadilhas[ i ].zombie_cost + "]" );
}
}

ptbr_traduzir_powerups()
{
level waittill( "spawned" );

for ( ;; )
{
level waittill( "powerup_spawned", powerup );

if ( isDefined( powerup ) )
{
powerup thread ptbr_monitorar_powerup();
}
}
}

ptbr_monitorar_powerup()
{
self endon( "end_game" );

while ( isDefined( self ) )
{
if ( isDefined( self.powerup_name ) )
{
self.powerup_name = ptbr_traduzir_powerup( self.powerup_name );
}
wait 1;
}
}

ptbr_traduzir_powerup( nome )
{
switch ( nome )
{
case "instant_kill":
return "Morte Instantanea";
case "double_points":
return "Pontos Duplos";
case "nuke":
return "Bomba Nuclear";
case "carpenter":
return "Carpinteiro";
case "max_ammo":
return "Municao Maxima";
case "full_health":
return "Vida Cheia";
case "bonus_points":
return "Pontos Bonus";
case "fire_sale":
return "Queima de Estoque";
}
return nome;
}

ptbr_traduzir_rounds()
{
for ( ;; )
{
level waittill( "round_change", round );

if ( isDefined( round ) )
{
level thread ptbr_anunciar_round( round );
}
}
}

ptbr_anunciar_round( round )
{
wait 1;

for ( i = 0; i < level.players.size; i++ )
{
player = level.players[ i ];

if ( isDefined( player ) && isalive( player ) )
{
if ( round == 1 )
{
player iprintlnbold( "^5RODADA 1 ^7- Prepare-se para o apocalipse!" );
}
else if ( round == 10 )
{
player iprintlnbold( "^5RODADA 10 ^7- Agora a coisa ficou seria!" );
}
else if ( round == 20 )
{
player iprintlnbold( "^5RODADA 20 ^7- Voce ainda esta vivo? Impressionante!" );
}
else if ( round == 30 )
{
player iprintlnbold( "^5RODADA 30 ^7- Parabens, voce eh uma maquina!" );
}
else if ( round == 40 )
{
player iprintlnbold( "^5RODADA 40 ^7- Lendario! Continue assim!" );
}
else if ( round == 50 )
{
player iprintlnbold( "^5RODADA 50 ^7- VOCE EH UMA LENDA VIVA!" );
}
else if ( round % 5 == 0 )
{
player iprintlnbold( "^5RODADA " + round + " ^7- Mantenha o foco, sobrevivente!" );
}
}
}
}

ptbr_nome_arma( arma )
{
base = arma;
sufixo = "_zm";

if ( base.size > sufixo.size && getsubstr( base, base.size - sufixo.size ) == sufixo )
{
base = getsubstr( base, 0, base.size - sufixo.size );
}

switch ( base )
{
case "m14":
return "M14";
case "rottweil72":
return "Olympia";
case "870mcs":
return "Remington 870 MCS";
case "ak74u":
return "AK-74u";
case "mp5k":
return "MP5";
case "m16":
return "M16A1";
case "b23r":
return "B23R";
case "m1911":
return "M1911";
case "python":
return "Python";
case "m1927":
return "M1927";
case "uzi":
return "Uzi";
case "mp40":
return "MP40";
case "fiveseven":
return "Five-Seven";
case "svu":
return "SVU-AS";
case "galil":
return "Galil";
case "fal":
return "FAL";
case "remington_new_model_army":
return "Remington New Model Army";
case "frag_grenade":
return "Granada de Fragmentacao";
case "semtex":
return "Semtex";
case "claymore":
return "Claymore";
case "bouncing_betty":
case "betty":
return "Bouncing Betty";
case "knife_ballistic":
return "Faca Balistica";
case "riotshield":
return "Escudo Antimotim";
case "tazer_knuckles":
return "Galvaknuckles";
case "bowie_knife":
return "Faca Bowie";
case "m8a1":
return "M8A1";
case "an94":
return "AN-94";
case "type25":
return "Type 25";
case "swat556":
return "SWAT-556";
case "mtar":
return "MTAR";
case "scorpion":
return "Skorpion EVO";
case "vector":
return "Vector K10";
case "mp7":
return "MP7";
case "chicom":
return "Chicom CQB";
case "pdw57":
return "PDW-57";
case "dsr50":
return "DSR 50";
case "ballista":
return "Ballista";
case "svg":
return "SVG-100";
case "xpr50":
return "XPR-50";
case "rmb":
return "RMB-ADS";
case "lsat":
return "LSAT";
case "mk48":
return "MK 48";
case "hammr":
return "HAMR";
case "rpk":
return "RPK";
case "s12":
return "S12";
case "m1216":
return "M1216";
case "saiga12":
return "Saiga-12";
case "ksg":
return "KSG";
case "executioner":
return "Executioner";
case "tac45":
return "Tac-45";
case "kap40":
return "KAP-40";
case "browninghp":
return "Browning HP";
case "mr6":
return "MR6";
case "usp45":
return "USP .45";
case "raygun":
return "Ray Gun";
case "raygun_mark2":
return "Ray Gun Mark II";
case "wunderwaffe":
return "Wunderwaffe DG-2";
case "thundergun":
return "Thunder Gun";
case "babymaker":
return "Babymaker";
case "scavenger":
return "Scavenger";
case "wintershowl":
return "Winter's Howl";
case "zombie_shield":
return "Escudo de Zumbi";
case "jetgun":
return "Jet Gun";
case "one_inch_punch":
return "One Inch Punch";
case "time_bomb":
return "Bomba Temporal";
case "cymbal_monkey":
return "Macaco de Prato";
case "emp_grenade":
return "Granada EMP";
}
return toupper( base );
}

ptbr_observar_conexoes()
{
for ( ;; )
{
level waittill( "connected", jogador );
jogador thread ptbr_boas_vindas();
}
}

ptbr_boas_vindas()
{
self endon( "disconnect" );

self waittill( "spawned_player" );
wait 2;

self iprintln( "^2Traducao PT-BR ^7ATIVA - ^5Bem-vindo, ^3" + self.name );
self iprintln( "^7Menu, HUD, Portas, Perks, Armas e muito mais traduzidos!" );
self iprintln( "^2Mod: ^7Tranzit Reimagined + Custom Perks + PT-BR Completo" );
}
