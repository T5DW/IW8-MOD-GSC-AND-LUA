/ Stim Boost GSC Script
// Command: stim_boost 1 = Enabled, stim_boost 0 = Disabled
// the stim code is from pipes!
// but i wrote the cmd

init()
{
    // Initialize stim boost dvar
    setdvar( "stim_boost", 0 );
    
    // Thread for monitoring stim boost state
    level thread stim_boost_monitor();
}

stim_boost_monitor()
{
    level endon( "game_ended" );
    
    for (;;)
    {
        wait 1;
        
        foreach ( player in level.players )
        {
            if ( isdefined( player ) && isplayer( player ) && isalive( player ) )
            {
                if ( getdvarint( "stim_boost" ) == 1 )
                {
                    if ( !isdefined( player.stim_boost_thread ) )
                    {
                        player.stim_boost_thread = player thread stimspeedboost();
                    }
                }
                else
                {
                    if ( isdefined( player.stim_boost_thread ) )
                    {
                        player notify( "stim_boost_stop" );
                        player.stim_boost_thread = undefined;
                        player setmovespeedscale( 1.0 );
                    }
                }
            }
        }
    }
}

stimspeedboost()
{
    self endon( "disconnect" );
    self endon( "stim_boost_stop" );
    
    speed_default = 1.0;
    speed_stimmed = 1.44;
    
    for (;;)
    {
        self waittill( "force_regeneration" );
        self iprintlnbold( "^2Speed boost started!" );
        self setmovespeedscale( speed_stimmed );
        wait 5;
        self setmovespeedscale( speed_default );
        self iprintlnbold( "^1Speed boost done!" );
    }
}

onplayerspawned()
{
    self endon( "disconnect" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "spawned_player" );
        
        if ( getdvarint( "stim_boost" ) == 1 )
        {
            if ( !isdefined( self.stim_boost_thread ) )
            {
                self.stim_boost_thread = self thread stimspeedboost();
            }
        }
    }
}
