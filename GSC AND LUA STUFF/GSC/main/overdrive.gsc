// my overdrive gsc MP gamemode not warzone tho this could work on warzone but its mainly for MP
// overdrive 1 = Enabled, overdrive 0 = Disabled

init()
{
    // Initialize OverDrive dvar if not already set
    setdvarifuninitialized( "overdrive", 0 );
    
    // Thread for monitoring OverDrive state
    level thread overdrive_monitor();
}

overdrive_monitor()
{
    level endon( "game_ended" );
    
    for (;;)
    {
        wait 1;
        
        foreach ( player in level.players )
        {
            if ( isdefined( player ) && isplayer( player ) && isalive( player ) )
            {
                if ( getdvarint( "overdrive" ) == 1 )
                {
                    if ( !isdefined( player.overdrive_active ) )
                    {
                        player.overdrive_active = true;
                        player thread overdrive_welcome_message();
                        player thread track_kill_streak();
                    }
                }
                else
                {
                    if ( isdefined( player.overdrive_active ) )
                    {
                        player.overdrive_active = undefined;
                        player.streak_count = 0;
                        player.health = 100;
                        player setmovespeedscale( 1.0 );
                    }
                }
            }
        }
    }
}

overdrive_welcome_message()
{
    self endon( "disconnect" );
    
    self waittill( "spawned_player" );
    wait 1;
    self iprintlnbold( "^2Welcome " + self.name + " TO GAME MODE: ^1OVERDRIVE" );
}

track_kill_streak()
{
    self endon( "disconnect" );
    self endon( "death" );
    
    self.streak_count = 0;
    self.max_health = 100;
    self.health = 100;
    
    for (;;)
    {
        self waittill( "kill" );
        
        // Increase streak
        self.streak_count++;
        
        // Speed boost on kill
        self thread speed_boost();
        
        // Check for health increases based on streak
        if ( self.streak_count >= 35 )
        {
            if ( self.max_health != 250 )
            {
                self.max_health = 250;
                self.health = 250;
                self iprintlnbold( "^3MAX HEALTH^7 - Health set to ^1250" );
            }
        }
        else if ( self.streak_count >= 25 )
        {
            if ( self.max_health != 150 )
            {
                self.max_health = 150;
                self.health = 150;
                self iprintlnbold( "^3Health increased^7 - Health set to ^1150" );
            }
        }
        else if ( self.streak_count >= 10 )
        {
            if ( self.max_health != 120 )
            {
                self.max_health = 120;
                self.health = 120;
                self iprintlnbold( "^3Health increased^7 - Health set to ^1120" );
            }
        }
        
        // Print streak count
        self iprintln( "^2Kill Streak: ^1" + self.streak_count );
    }
}

speed_boost()
{
    self endon( "disconnect" );
    self endon( "death" );
    
    speed_default = 1.0;
    speed_boosted = 1.5;
    
    self setmovespeedscale( speed_boosted );
    self iprintlnbold( "^2SPEED BOOST! ^7(2 seconds)" );
    
    wait 2;
    
    if ( isdefined( self ) && isplayer( self ) && isalive( self ) )
    {
        self setmovespeedscale( speed_default );
    }
}

onplayerspawned()
{
    self endon( "disconnect" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "spawned_player" );
        
        // Reset streak and health on spawn
        self.streak_count = 0;
        self.max_health = 100;
        self.health = 100;
        self setmovespeedscale( 1.0 );
        
        if ( getdvarint( "overdrive" ) == 1 )
        {
            if ( !isdefined( self.overdrive_active ) )
            {
                self.overdrive_active = true;
                self thread overdrive_welcome_message();
                self thread track_kill_streak();
            }
        }
    }
}
