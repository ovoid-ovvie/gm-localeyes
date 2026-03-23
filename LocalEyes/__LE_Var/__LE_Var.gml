/// @desc Constructor for the LocalEyes global database struct.
/// @ignore
function __leyes_framework() constructor
{
	isInit     = false;

	lang       = "";
	strings    = { key:{}, content:{} };
	
	fbkLang    = "";
	fbkStrings = { key:{}, content:{} };

	draw       = {};
	cache      = {};
}

global.leyes = new __leyes_framework();