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
	
	try // Initialise database
	{
		global.leyes.isInit = true;
		global.leyes.lang = langCode;
		global.leyes.strings.key = strings;
		global.leyes.fbkLang = fbkLangCode;
		global.leyes.fbkStrings.key = fbkStrings;
		array_push(global.leyes.loaded, lang);
		if ( !array_contains(global.leyes.loaded, fallback_lang) )
		{
			array_push(global.leyes.loaded, fallback_lang);
		}
	}
	catch (_)
	{
		// Catch invalid database
		show_debug_message(_);
		__leyes_throw_error(LEYES_ERROR.CONFIG_DB);
	}

	// Process content fetching
	var macroPassed = false;
	try
	{
		if ( LEYES_CONTENT_FETCH_TOGGLE )
		{
			macroPassed = true;

			// Main language
			var names = variable_struct_get_names(strings);
			var excludedCount = 0;
			for (var i = 0; i < array_length(names); i++)
			{
				var key = names[i];
				var content = strings[$ names[i]];
				if ( string_length(content) > LEYES_CONTENT_FETCH_LENGTH_LIMIT )
				{
					excludedCount++;
					continue;
				}
				global.leyes.strings.content[$ content] = key;
			}
			show_debug_message($"LocalEyes: {excludedCount} strings excluded from main content fetch.");

			// Fallback language
			var fbkNames = variable_struct_get_names(fbkStrings);
			var fbkExcludedCount = 0;
			for (var i = 0; i < array_length(fbkNames); i++)
			{
				var fbkKey = fbkNames[i];
				var fbkContent = fbkStrings[$ fbkNames[i]];
				if ( string_length(fbkContent) > LEYES_CONTENT_FETCH_LENGTH_LIMIT )
				{
					fbkExcludedCount++;
					continue;
				}
				global.leyes.fbkStrings.content[$ fbkContent] = fbkKey;
			}
			show_debug_message($"LocalEyes: {fbkExcludedCount} strings excluded from fallback content fetch.");
		}
	}
	catch (_)
	{
		if ( macroPassed )
		{
			// Caught content fetch error
			__leyes_throw_error(LEYES_ERROR.CONFIG_CONTENT_FETCH);
		}
		else
		{
			// Caught invalid macro
			show_debug_message("LocalEyes: LEYES_CONTENT_FETCH_TOGGLE is bad macro");
			__leyes_throw_error(LEYES_ERROR.GENERAL_BAD_MACRO);
		}
	}
}