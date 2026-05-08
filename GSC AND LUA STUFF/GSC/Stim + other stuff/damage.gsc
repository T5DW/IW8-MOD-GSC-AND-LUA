// This script only works on 1.57 and higher -_- im working on cw versions soon
// Open source for any one to modify weapon damages 
modifyplayerdamage( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 ) // Fuck you peaceoffical for stealing my shit and didnt give me credit you ai paster fuck
{
    if ( !isdefined( var_5 ) || var_5 == "none" )
        return var_2;

    var_10 = var_5;

    if ( issubstr( var_10.basename, "iw8_sn_" ) || var_10.basename == "s4_mr_kalpha98" )
    {
        if ( isplayer( var_1 ) )
            var_1 iprintlnbold( "^1ONE SHOT" ); // doesnt work need to fix soon

        return 999;
    }

    if ( var_10 == "s4_sm_mpapa40" ) // MP40
        return 17;

    if ( var_10 == "s4_ar_hyankee44" ) // cooper carbine
        return 31;

    if ( var_10 == "iw8_ar_mike4" ) // M4
        return 16;

    if ( var_10 == "iw8_sn_t9precisionsemi" )
        return 40;

    if ( var_10 == "iw8_sm_mpapa5" ) // IW8 mp5
        return 16;

    if ( var_10 == "s4_sm_stango5" ) // sten
        return 22;

    if ( var_10 == "iw8_sm_t9fastfire" ) // Mac10
        return 15;

    if ( var_10 == "s4_sm_wecho43" ) // welgun
        return 14;

    if ( var_10 == "s4_ar_promeo45" ) // forgot will change
        return 12;

    if ( var_10 == "iw8_ar_t9standard" ) // why are there 2 of these lol
        return 23;

    if ( var_10 == "iw8_sm_mpapa7" ) // IW8 MP7
        return 51;

    if ( var_10 == "iw8_sm_t9standard" ) // XM4 i think?
        return 18;

    if ( var_10 == "iw8_ar_sierra552" ) // grau 5.56
        return 13;

    if ( var_10 == "s4_ar_stango44" ) // stg
        return 30;

    if ( var_10 == "s4_sm_aromeo43" ) // armugurra or wtv that gun is called
        return 16;

    if ( var_10 == "iw8_sm_t9cqb" ) // ots9
        return 11;

    return var_2;
}
