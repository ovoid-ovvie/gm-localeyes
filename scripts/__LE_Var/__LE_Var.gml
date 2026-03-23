function __leyes_framework() constructor
{
	isInit     = false;
	lang       = "";
	
	strings    = { key:{}, content:{} };
	draw       = {};
	
	fbkLang    = "";
	fbkStrings = { key:{}, content:{} };
	
	cache      = {};
}

global.leyes = new __leyes_framework();