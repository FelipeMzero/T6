#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\zombies\_zm_utility;
#include maps\mp\zombies\_zm_weapons;

main()
{
}

init()
{
    level thread mp_box_init();
}

mp_box_init()
{
    level endon("end_game");

    wait 2;

    level.mp_weapons_added = [];
    level.mp_weapons_not_in_box = [];

    mp_weapons =
    [
        "m8a1", "type25", "swat556", "mtar", "scorpion", "vector", "mp7",
        "chicom", "pdw57", "dsr50", "ballista", "svg", "xpr50",
        "lsat", "mk48", "hammr", "rpk", "s12", "m1216", "saiga12", "ksg",
        "executioner", "tac45", "kap40", "browninghp", "mr6", "usp45",
        "remington_new_model_army", "m1927", "b23r", "fn2000", "m27", "tar21",
        "mk14", "m40a3", "dragunov", "l96a1", "dsr50_mp",
        "mp5k", "ak74u_fold", "uzi", "mp40",
        "fiveseven", "python",
        "rottweil72", "870mcs",
        "m14", "m16", "galil", "fal",
        "an94", "svu", "ak47", "famas",
        "hk416", "scar", "tar21_acog", "m4a1",
        "pp90m1", "p90", "striker", "aa12", "m1014"
    ];

    for (i = 0; i < mp_weapons.size; i++)
    {
        precacheWeapon(mp_weapons[i]);
        precacheWeapon(mp_weapons[i] + "_zm");
    }

    replacefunc(maps\mp\zombies\_zm_weapons::get_pack_a_punch_weapon_options, ::mp_get_pap_options);

    level thread mp_hook_box_weapons();
}

mp_hook_box_weapons()
{
    level endon("end_game");

    for (;;)
    {
        if (isDefined(level.chests))
        {
            for (i = 0; i < level.chests.size; i++)
            {
                if (isDefined(level.chests[i]) && !isDefined(level.chests[i].mp_hooked))
                {
                    level.chests[i].mp_hooked = true;
                    level.chests[i] thread mp_box_weapon_override();
                }
            }
        }
        wait 1;
    }
}

mp_box_weapon_override()
{
    self endon("end_game");

    for (;;)
    {
        self waittill("weapon_given", player, weapon);

        if (isDefined(player) && isDefined(weapon))
        {
            if (randomint(3) == 0)
            {
                mp_weapon = mp_get_random_mp_weapon();
                if (mp_weapon != "")
                {
                    player giveweapon(mp_weapon);
                    player iprintlnbold("^3Arma MP: ^5" + mp_weapon);
                }
            }
        }
    }
}

mp_get_random_mp_weapon()
{
    mp_list =
    [
        "m8a1", "type25", "swat556", "mtar", "scorpion", "vector", "mp7",
        "chicom", "pdw57", "dsr50", "ballista", "svg", "xpr50",
        "lsat", "mk48", "hammr", "rpk", "s12", "m1216", "saiga12", "ksg",
        "executioner", "tac45", "kap40", "browninghp", "fn2000", "m27",
        "tar21", "mk14", "m40a3", "dragunov", "l96a1",
        "pp90m1", "p90", "striker", "aa12", "m1014",
        "hk416", "scar", "famas", "ak47", "m4a1"
    ];

    return mp_list[randomint(mp_list.size)];
}

mp_get_pap_options(weapon)
{
    pap_config = [];
    pap_config[0] = "pap_high_damage";
    pap_config[1] = "pap_large_mag";
    pap_config[2] = "pap_fast_reload";
    return pap_config;
}
