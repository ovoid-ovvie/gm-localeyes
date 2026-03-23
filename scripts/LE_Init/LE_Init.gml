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

	// Get files and strings
	var langCode = lang;
	var langFile = __leyes_get_filepath(langCode);
	var strings = __leyes_parse_json(langFile);
	var fbkLangCode = fallback_lang;
	var fbkLangFile = __leyes_get_filepath(fbkLangCode);
	var fbkStrings = __leyes_parse_json(fbkLangFile);
	
	// Process content fetching
	var macroPassed = false;
	try
	{
		if ( LEYES_CONTENT_FETCH_TOGGLE )
		{
			macroPassed = true;
			var excludedCount = __leyes_process_content(strings, global.leyes.strings.content);
			var fbkExcludedCount = __leyes_process_content(fbkStrings, global.leyes.fbkStrings.content);
			show_debug_message($"LocalEyes: {excludedCount} strings excluded from main content fetch.");
			show_debug_message($"LocalEyes: {fbkExcludedCount} strings excluded from fallback content fetch.");
		}
	}
	catch (_)
	{
		show_debug_message(_);
		if ( macroPassed )
		{
			// Caught content fetch error
			global.leyes.strings.content = {};
    		global.leyes.fbkStrings.content = {};
			__leyes_throw_error(LEYES_ERROR.CONFIG_CONTENT_FETCH);
		}
		else
		{
			// Caught invalid macro
			show_debug_message("LocalEyes: LEYES_CONTENT_FETCH_TOGGLE is bad macro");
			__leyes_throw_error(LEYES_ERROR.GENERAL_BAD_MACRO);
		}
	}

	try // Initialise database
	{
		global.leyes.isInit = true;
		global.leyes.lang = langCode;
		global.leyes.strings.key = strings;
		global.leyes.fbkLang = fbkLangCode;
		global.leyes.fbkStrings.key = fbkStrings;
	}
	catch (_)
	{
		// Catch invalid database
		show_debug_message(_);
		__leyes_throw_error(LEYES_ERROR.GENERAL_DB);
	}
}