#include maps\mp\_utility;
#include common_scripts\utility;
#include maps\mp\gametypes_zm\_hud_util;
#include maps\mp\zombies\_zm_utility;

init()
{
    mapname = getDvar("mapname");
    
    // Precache the staffs globally so they are registered in the game engine
    precacheweapon("staff_fire_zm");
    precacheweapon("staff_water_zm");
    precacheweapon("staff_lightning_zm");
    precacheweapon("staff_air_zm");
    
    precacheweapon("staff_fire_upgraded_zm");
    precacheweapon("staff_water_upgraded_zm");
    precacheweapon("staff_lightning_upgraded_zm");
    precacheweapon("staff_air_upgraded_zm");

    level thread onPlayerConnect();
    
    if ( mapname == "zm_buried" )
    {
        level thread init_buried_staffs();
    }
}

init_buried_staffs()
{
    // Wait until zombie_weapons array is initialized by the game
    while ( !isDefined( level.zombie_weapons ) )
    {
        wait 0.5;
    }
    
    // Register the staffs in the map's weapon table to allow Pack-a-Punch and prevent crashes
    register_custom_weapon_upgrade( "staff_fire_zm", "staff_fire_upgraded_zm", 2000 );
    register_custom_weapon_upgrade( "staff_water_zm", "staff_water_upgraded_zm", 2000 );
    register_custom_weapon_upgrade( "staff_lightning_zm", "staff_lightning_upgraded_zm", 2000 );
    register_custom_weapon_upgrade( "staff_air_zm", "staff_air_upgraded_zm", 2000 );
    
    level thread replace_buried_wallbuys();
}

register_custom_weapon_upgrade( weapon_name, upgrade_weapon_name, cost )
{
    if ( !isDefined( level.zombie_weapons ) )
        return;
        
    if ( isDefined( level.zombie_weapons[ weapon_name ] ) )
        return;
        
    // Use mp5_zm as a template struct to copy game fields
    template = level.zombie_weapons[ "mp5_zm" ];
    if ( !isDefined( template ) )
    {
        keys = getArrayKeys( level.zombie_weapons );
        if ( keys.size > 0 )
        {
            template = level.zombie_weapons[ keys[0] ];
        }
    }
    
    if ( isDefined( template ) )
    {
        struct = spawnStruct();
        struct.weapon_name = weapon_name;
        struct.upgrade_name = upgrade_weapon_name;
        struct.hint_string = "";
        struct.cost = cost;
        struct.upgrade_cost = 5000;
        struct.is_fork_weapon = template.is_fork_weapon;
        struct.weapon_vo = template.weapon_vo;
        struct.is_melee = 0;
        
        level.zombie_weapons[ weapon_name ] = struct;
    }
}

replace_buried_wallbuys()
{
    level endon("end_game");
    
    for(;;)
    {
        // Intercept entity triggers
        triggers = getEntArray("weapon_upgrade", "targetname");
        foreach(trigger in triggers)
        {
            if (isDefined(trigger.zombie_weapon_upgrade))
            {
                weapon = trigger.zombie_weapon_upgrade;
                
                if (weapon == "olympia_zm" || weapon == "m14_zm")
                {
                    trigger.zombie_weapon_upgrade = "staff_fire_zm";
                }
                else if (weapon == "mp5_zm" || weapon == "mp5k_zm" || weapon == "ak74u_zm")
                {
                    trigger.zombie_weapon_upgrade = "staff_lightning_zm";
                }
                else if (weapon == "remington870_zm" || weapon == "870mcs_zm" || weapon == "beretta93r_zm")
                {
                    trigger.zombie_weapon_upgrade = "staff_water_zm";
                }
                else if (weapon == "lsat_zm" || weapon == "an94_zm" || weapon == "pdw57_zm" || weapon == "svu_zm")
                {
                    trigger.zombie_weapon_upgrade = "staff_air_zm";
                }
            }
        }
        
        // Intercept unitrigger stubs
        if (isDefined(level._unitriggers) && isDefined(level._unitriggers.trigger_stubs))
        {
            for (i = 0; i < level._unitriggers.trigger_stubs.size; i++)
            {
                stub = level._unitriggers.trigger_stubs[i];
                if (isDefined(stub) && isDefined(stub.zombie_weapon_upgrade))
                {
                    weapon = stub.zombie_weapon_upgrade;
                    
                    if (weapon == "olympia_zm" || weapon == "m14_zm")
                    {
                        stub.zombie_weapon_upgrade = "staff_fire_zm";
                    }
                    else if (weapon == "mp5_zm" || weapon == "mp5k_zm" || weapon == "ak74u_zm")
                    {
                        stub.zombie_weapon_upgrade = "staff_lightning_zm";
                    }
                    else if (weapon == "remington870_zm" || weapon == "870mcs_zm" || weapon == "beretta93r_zm")
                    {
                        stub.zombie_weapon_upgrade = "staff_water_zm";
                    }
                    else if (weapon == "lsat_zm" || weapon == "an94_zm" || weapon == "pdw57_zm" || weapon == "svu_zm")
                    {
                        stub.zombie_weapon_upgrade = "staff_air_zm";
                    }
                }
            }
        }
        
        wait 1.0;
    }
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
        if ( self adsbuttonpressed() && self meleebuttonpressed() )
        {
            mapname = getDvar("mapname");
            
            if ( mapname == "zm_tomb" || mapname == "zm_buried" )
            {
                self iprintlnbold("^2[Cheat] Cajado de Raio Melhorado Ativado!");
                current_weapon = self getCurrentWeapon();
                if ( current_weapon != "none" )
                {
                    self takeWeapon( current_weapon );
                }
                // Use weapon_give instead of giveWeapon to properly register the weapon in the player inventory
                self maps\mp\zombies\_zm_weapons::weapon_give( "staff_lightning_upgraded_zm" );
                self switchToWeapon( "staff_lightning_upgraded_zm" );
            }
            else
            {
                self iprintlnbold("^2[Cheat] Ray Gun Mark II Melhorada Ativada!");
                current_weapon = self getCurrentWeapon();
                if ( current_weapon != "none" )
                {
                    self takeWeapon( current_weapon );
                }
                self maps\mp\zombies\_zm_weapons::weapon_give( "raygun_mark2_upgraded_zm" );
                self switchToWeapon( "raygun_mark2_upgraded_zm" );
            }
            
            wait 2.0;
        }
        wait 0.1;
    }
}
