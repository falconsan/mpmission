[player,4,true,(getPosATL player)] spawn player_alertZombies;

	_charpos = getPos player;
	if (isNil "_Distanz") then {
		_Distanz=0;
		_lastpos=_charpos;
		cutText ["Start ist auf 0 Meter", "PLAIN"];
	};
    _kills =        player getVariable['zombieKills',0];
    _killsH =        player getVariable['humanKills',0];
    _killsB =        player getVariable['banditKills',0];
    _humanity =        player getVariable['humanity',0];
    _headShots =    player getVariable['headShots',0];
	_distanz = round(_charPos distance _lastPos);
	_a = _distanz;
	_b = _distance;
	_distance = _a + _b;
    _lastPos = _charPos;
	hintSilent parseText format ["
    <t size='1.25'font='Bitstream'align='center'color='#39B0FF'>DayZ EpochBP</t><br/>
	<t size='1.15' font='Bitstream'align='center' color='#39B0FF'>BP</t><br/><br/>
    <t size='1'font='Bitstream'align='left' color='#FF0000'>Distanz</t><t size='1' font='Bitstream'align='right'>%8</t><br/>
    <t size='1'font='Bitstream'align='left' color='#DDDDDD'>Humanity</t><t size='1'font='Bitstream'align='right'>%2</t><br/>
    <t size='1'font='Bitstream'align='left'color='#DDDDDD'>Murders</t><t size='1'font='Bitstream'align='right'>%3</t><br/>
    <t size='1'font='Bitstream'align='left'color='#DDDDDD'>Bandit Kills</t><t size='1'font='Bitstream'align='right'>%4</t><br/>
    <t size='1'font='Bitstream'align='left'color='#DDDDDD'>Zombie Kills</t><t size='1'font='Bitstream'align='right'>%5</t><br/>
	<t size='0.95' font='Bitstream' align='left' color='#DDDDDD'>Players Online: </t><t size='0.95 'font='Bitstream' align='right'>%6</t><br/><br/>
    <t size='1'font='Bitstream'align='center'color='#39B0FF'>Restart in %7 minutes</t><br/>",
    
	r_player_blood,round _humanity,_killsH,_killsB,_kills,(count playableUnits),(240-(round(serverTime) / 60)),str(_distance)
    ];