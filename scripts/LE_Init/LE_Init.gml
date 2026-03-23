function leyes_init(lang, fallback_lang)
{
	// Validate arguments
	if ( lang == "" && fallback_lang == "" )
	{
		__leyes_throw_error(LEYES_ERROR.CONFIG_NEITHER);
	}
	else if ( lang == "" )
	{
		__leyes_throw_error(LEYES_ERROR.CONFIG_NO_LANG);
	}
	else if ( fallback_lang == "" )
	{
		__leyes_throw_error(LEYES_ERROR.CONFIG_NO_FBK);
	}
	
	try
	{
		// Initialise database
		global.__leyes.isInit = true;
		global.__leyes.lang = lang;
		global.__leyes.strings.key = __leyes_parse_json(__leyes_get_filepath(lang));
		global.__leyes.fbkLang = fallback_lang;
		global.__leyes.fbkstrings = __leyes_parse_json(__leyes_get_filepath(fallback_lang));
		array_push(global.__leyes.loaded, lang);
		if ( !array_contains(global.__leyes.loaded, fallback_lang) )
		{
			array_push(global.__leyes.loaded, fallback_lang);
		}
	}
	catch (_)
	{
		// Catch invalid database
		show_debug_message(_);
		__leyes_throw_error(LEYES_ERROR.CONFIG_DB);
	}
}