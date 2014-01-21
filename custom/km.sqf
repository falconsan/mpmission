if (isNil "kmOn") then {kmOn = true;} else {kmOn = !kmOn};
 if(kmOn) then {
  DistanceScreen = 
[
	["",true],
	["Distance", [-1], "", -5, [["expression", "Start = false;"]], "1", "1"], 	
	["Start", [2], "", -5, [["expression", "Start = true; kmOn = true;"]], "1", "1"],
	["Stop", [3], "", -5, [["expression", "Start = false; kmOn = false;"]], "1", "1"],
	["Exit", [13], "", -3, [["expression", "Start = false;"]], "1", "1"]	
];

showCommandingMenu "#USER:DistanceScreen";
WaitUntil{Start};
	_playerPos = getPosATL player;
	_pos = [round(direction player),_playerPos];
  	_Distanz=0;
	_distance=0;
	_lastpos=_pos;
	titleText ["Distanzmessung gestartet","PLAIN DOWN"]; titleFadeOut 1; 
	Start = False
 } else {
 kmOn=false;
};
 
 while {kmOn && !Start} do {
	_playerPos = getPosATL player;
	_pos = [round(direction player),_playerPos];
	_distanz = round(_pos distance _lastPos);
	if (count _lastPos > 2 and count _Pos > 2) then {
		_a = _distanz;
		_b = _distance;
		_distance = _a + _b;
		_lastPos = _pos;
		_distance2 = [round(direction player),_playerPos];
		//_distanceFoot = round(_charPos distance _lastPos);
	};


	hintSilent parseText format ["
    <t size='1.25'font='Bitstream'align='center'color='#39B0FF'>Distanz</t><br/>
	<t size='1.15' font='Bitstream'align='center' color='#39B0FF'>BP</t><br/><br/>
    <t size='1'font='Bitstream'align='left' color='#0000FF'>Meter</t><t size='1' font='Bitstream'align='right'>%1</t><br/>
	<t size='1'font='Bitstream'align='left' color='#DDDDDD'>Position</t><t size='1'font='Bitstream'align='right'>%2</t><br/>",
	str(_distance), str(_pos)
	
	];

 };
titleText [format["Distanzmessung gestoppt: %1 km",str(_distance)],"PLAIN DOWN"]; titleFadeOut 4;