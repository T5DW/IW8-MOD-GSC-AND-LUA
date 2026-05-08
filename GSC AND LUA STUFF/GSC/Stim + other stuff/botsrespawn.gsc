// bc i broke loadouts royale and didnt feel like pasting ryguys code so i added some modifactions to the respawning bc i broke it lol

fix_bot_respawn()
{
    wait 15;
    level.br_rebirth_enabled = 1;
    level.br_rebirth_max_players = 150;
    level.br_rebirth_phase_duration = 999999;

    for (;;)
    {
        wait 1;

        foreach ( var_1 in level.players )
        {
            if ( isbot( var_1 ) && isalive( var_1 ) )
            {
                var_1.hasrespawntoken = 1;
                var_1 thread _id_12382( 1 );
            }
        }
    }
}

