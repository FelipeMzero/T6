#include common_scripts\utility;
#include maps\mp\_utility;

main()
{
}

init()
{
level thread ptbr_aplicar_strings();
level thread ptbr_observar_conexoes();
level thread ptbr_traduzir_killstreaks();
}

ptbr_aplicar_strings()
{
wait 0.1;

ptbr_substituir( "waiting_for_teams", "Aguardando os times..." );
ptbr_substituir( "waiting_for_players", "Aguardando jogadores..." );
ptbr_substituir( "opponent_forfeiting_in", "O adversario vai desistir em:" );
ptbr_substituir( "match_starting_in", "A partida comeca em:" );
ptbr_substituir( "match_starting", "A partida esta comecando" );
ptbr_substituir( "match_started", "Partida iniciada!" );
ptbr_substituir( "spawn_until_match_start", "Renascendo ate o inicio" );
ptbr_substituir( "change_class", "Classe trocada no proximo renascimento..." );
ptbr_substituir( "last_stand", "Ultimo Suspiro!" );
ptbr_substituir( "tie", "Empate" );
ptbr_substituir( "draw", "Empate" );
ptbr_substituir( "round_draw", "Rodada empatada" );
ptbr_substituir( "round_win", "Rodada vencida!" );
ptbr_substituir( "round_loss", "Rodada perdida" );
ptbr_substituir( "victory", "VITORIA!" );
ptbr_substituir( "defeat", "DERROTA" );
ptbr_substituir( "halftime", "Intervalo" );
ptbr_substituir( "overtime", "Prorrogacao" );
ptbr_substituir( "roundend", "Fim da rodada" );
ptbr_substituir( "intermission", "Intervalo" );
ptbr_substituir( "side_switch", "Trocando de lado" );
ptbr_substituir( "match_bonus", "Bonus da partida:" );
ptbr_substituir( "autobalance", "Equilibrando os times" );
ptbr_substituir( "spectator", "Espectador" );
ptbr_substituir( "score_limit_reached", "Limite de pontos atingido" );
ptbr_substituir( "time_limit_reached", "Limite de tempo atingido" );
ptbr_substituir( "round_limit_reached", "Limite de rodadas atingido" );
ptbr_substituir( "enemies_eliminated", "Inimigos eliminados" );
ptbr_substituir( "objective_destroyed", "Objetivo destruido" );
ptbr_substituir( "bomb_planted", "Bomba armada!" );
ptbr_substituir( "bomb_defused", "Bomba desarmada!" );
ptbr_substituir( "bomb_exploded", "Bomba explodiu!" );
ptbr_substituir( "your_team", "SEU TIME" );
ptbr_substituir( "enemy_team", "TIME INIMIGO" );
ptbr_substituir( "domination_a_captured", "Base A capturada!" );
ptbr_substituir( "domination_b_captured", "Base B capturada!" );
ptbr_substituir( "domination_c_captured", "Base C capturada!" );
ptbr_substituir( "domination_a_lost", "Base A perdida!" );
ptbr_substituir( "domination_b_lost", "Base B perdida!" );
ptbr_substituir( "domination_c_lost", "Base C perdida!" );
ptbr_substituir( "flag_taken", "Bandeira pega!" );
ptbr_substituir( "flag_dropped", "Bandeira derrubada!" );
ptbr_substituir( "flag_captured", "Bandeira capturada!" );
ptbr_substituir( "flag_returned", "Bandeira retornada!" );
ptbr_substituir( "dog_round", "CACHORROS!" );
ptbr_substituir( "first_blood", "Primeiro Sangue!" );
ptbr_substituir( "headshot", "TIRO NA CABECA" );
ptbr_substituir( "assist", "Assistencia" );
ptbr_substituir( "killstreak", "Sequencia de abates" );
ptbr_substituir( "multikill", "Abate multiplo" );
ptbr_substituir( "double_kill", "Abate duplo!" );
ptbr_substituir( "triple_kill", "Abate triplo!" );
ptbr_substituir( "quad_kill", "Quadruplo abate!" );
ptbr_substituir( "killing_spree", "Abate em serie (5)" );
ptbr_substituir( "killing_frenzy", "Frenesi de abates (10)" );
ptbr_substituir( "killing_rampage", "Massacre (15)" );
ptbr_substituir( "killing_brutal", "Abate brutal (20)" );
ptbr_substituir( "killing_chains", "Abate em cadeia (25)" );
ptbr_substituir( "killing_unstoppable", "Imparavel (30)" );
ptbr_substituir( "killing_mega", "Abate mega (35)" );
ptbr_substituir( "killing_ultra", "Abate ultra (40)" );
ptbr_substituir( "killing_rampage", "Massacre (15)" );
ptbr_substituir( "killing_relentless", "Implacavel (20)" );
}

ptbr_substituir( chave, texto )
{
if ( !isDefined( game[ "strings" ] ) )
{
return;
}

if ( !isDefined( game[ "strings" ][ chave ] ) )
{
return;
}

game[ "strings" ][ chave ] = texto;
}

ptbr_traduzir_killstreaks()
{
for ( ;; )
{
wait 5;

if ( isDefined( game[ "strings" ] ) )
{
ptbr_substituir( "uav", "UAV - Reconhecimento" );
ptbr_substituir( "counter_uav", "Contra-UAV" );
ptbr_substituir( "care_package", "Pacote de Suprimentos" );
ptbr_substituir( "predator_missile", "Missil Predador" );
ptbr_substituir( "lightning_strike", "Ataque Relampago" );
ptbr_substituir( "death_machine", "Maquina da Morte" );
ptbr_substituir( "sentinel_turret", "Torreta Sentinel" );
ptbr_substituir( "hellstorm_missile", "Missil Hellstorm" );
ptbr_substituir( "a10_strafe", "Ataque A10" );
ptbr_substituir( "vsat", "VSAT - Visao Avancada" );
ptbr_substituir( "escort_drone", "Drone de Escolta" );
ptbr_substituir( "warthog", "Ataque Warthog" );
ptbr_substituir( "emp_system", "Sistema EMP" );
ptbr_substituir( "lodestar", "Lodestar" );
ptbr_substituir( "vtol_warhog", "VTOL Warthog" );
ptbr_substituir( "k9_unit", "Unidade K9" );
ptbr_substituir( "swarm", "Enxame de Dragoes" );
}
}
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
wait 1;

self iprintln( "^2Traducao PT-BR ^7ATIVA - ^5Bem-vindo, ^3" + self.name );
self iprintln( "^7Menu, HUD, Killstreaks e mensagens traduzidos!" );
}
