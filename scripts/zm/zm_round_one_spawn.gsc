init()
{
	level thread onPlayerConnect();
}

onPlayerConnect()
{
	level endon( "end_game" );
    self endon( "disconnect" );
	for (;;)
	{
		level waittill( "connected", player );
		player thread spawnIfRoundOne();
	}
}

spawnIfRoundOne()
{
	wait 3;
	if ( self.sessionstate == "spectator" && level.round_number == 1 )
		self iprintln("Spawning...");
	wait 5;
	if ( self.sessionstate == "spectator" && level.round_number == 1 )
	{
		self [[ level.spawnplayer ]]();
		if ( level.script != "zm_tomb" || level.script != "zm_prison" || !maps/mp/zombies/_zm_utility::is_classic() )
			thread maps/mp/zombies/_zm::refresh_player_navcard_hud();
	}
}