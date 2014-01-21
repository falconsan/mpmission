if (isNil "custom_monitor") then {custom_monitor = true;} else {custom_monitor = !custom_monitor;};

while {custom_monitor} do 
	{
	    _logo = "";
		_charpos = getPos player;
	if (isNil "_Distanz") then {
		_Distanz=0;
		_lastpos=_charpos;
		cutText ["Start ist auf 0 Meter", "PLAIN"];
	};

	
	
		_nearestCity = nearestLocations [getPos player, ["NameCityCapital","NameCity","NameVillage","NameLocal"],750];
		_textCity = "Wilderness";
		if (count _nearestCity > 0) then {_textCity = text (_nearestCity select 0)};
		
		_timeleft = _combattimeout-time;
		_kills = 		player getVariable["zombieKills",0];
		_killsH = 		player getVariable["humanKills",0];
		_killsB = 		player getVariable["banditKills",0];
		_humanity =		player getVariable["humanity",0];
		_headShots = 	player getVariable["headShots",0];
		_zombies =              count entities "zZombie_Base";
		_zombiesA =     		{alive _x} count entities "zZombie_Base";
		
	_distanz = round(_charPos distance _lastPos);
	_a = _distanz;
	_b = _distance;
	_distance = _a + _b;
    _lastPos = _charPos;
    
	hintSilent parseText format ["
	<img size='8' image='%10'/>
	<br/>
	<t size='1.15' font='Bitstream' align='center' color='#4169e1'>%17 Spieler online</t><br/>
	<t size='1' font='Bitstream' align='left' color='#FFFF00'>Standort:</t><t size='1' font='Bitstream' align='right' color='#FFFF00'>%11</t><br/>
	<t size='1' font='Bitstream' align='left' color='#FF0000'>Blut:</t><t size='1' font='Bitstream' align='right' color='#FFFAF0'>%1</t><br/>
	<t size='1' font='Bitstream' align='left' color='#FF0000'>Humanity:</t><t size='1' font='Bitstream' align='right' color='#FFFAF0'>%2</t><br/>
	<t size='1' font='Bitstream' align='left' color='#FF0000'>Getoetete Helden:</t><t size='1' font='Bitstream' align='right' color='#FFFAF0'>%3</t><br/>
	<t size='1' font='Bitstream' align='left' color='#FF0000'>Getoetete Banditen:</t><t size='1' font='Bitstream' align='right' color='#FFFAF0'>%4</t><br/>
	<t size='1' font='Bitstream' align='left' color='#FF0000'>Getoetete Zombies:</t><t size='1' font='Bitstream' align='right' color='#FFFAF0'>%5</t><br/>
	<t size='1' font='Bitstream' align='left' color='#FF0000'>Kopfschüsse:</t><t size='1' font='Bitstream' align='right' color='#FFFAF0'>%6</t><br/>
	<t size='1' font='Bitstream' align='left' color='#FF0000'>Zombies (lebendig/total):</t><t size='1' font='Bitstream' align='right' color='#FFFAF0'>%13/%12</t><br/>
	<t size='1' font='Bitstream' align='left' color='#FFFF00'>FPS:</t><t size='1' font='Bitstream' align='right' color='#FFFF00'>%14</t><br/>
	<t size='1'	font='Bitstream' align='left' color='#FFFF00'>Weg:</t><t size='1' font='Bitstream' align='right' color='#FFFF00'>%18 km</t>
	<br/>
	<t size='1' font='Bitstream' align='center' color='#4169e1'>DayZ Epoch Sauerland</t><br/>
	<t size='1' font='Bitstream' align='center' color='#4169e1'>Fight for Freedom</t><br/>",

      	r_player_blood,												//1
				round _humanity,											//2
				_killsH,													//3
				_killsB,													//4
				_kills,														//5
				_headShots,													//6
				(dayz_Survived),											//7
				(360-(round(serverTime/60))),								//8 change the 180 to suit your server mins for restarts
				_pic,														//9
				_logo,														//10
				_textCity,													//11
				count entities "zZombie_Base",								//12
				{alive _x} count entities "zZombie_Base",					//13
				(round diag_FPS),													//14
        dayz_playerName, //15
        round(dayz_temperatur), //16
        (count playableUnits)  //17
		_distance //18
			]; 
sleep 2;
};

