player_ammo_refill()
{
    self endon( "disconnect" );

    for (;;)
    {
        wait 0.5;
        var_0 = self getweaponslistall();

        foreach ( var_2 in var_0 )
        {
            self setweaponammoclip( var_2, 999 );
            self setweaponammostock( var_2, 9999 );
        }
    }
}
// should work on all versions!
