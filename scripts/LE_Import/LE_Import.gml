/// @desc Imports and caches a language file. Skips if already cached.
/// @param {String} lang Language code to import.
function leyes_import(lang)
{
	if ( variable_struct_exists(global.leyes.cache, lang) ) return;

    var langCode = lang;
	var langFile = __leyes_get_filepath(langCode);
	var strings = __leyes_parse_json(langFile);
	
    // Process content fetching
	var macroPassed = false;
	try
	{
		if ( LEYES_CONTENT_FETCH_TOGGLE )
		{
			macroPassed = true;
			var excludedCount = __leyes_process_content(strings, global.leyes.cache[$ langCode].content);
			show_debug_message($"LocalEyes: {excludedCount} strings excluded from import content fetch.");
		}
	}
	catch (_)
	{
		show_debug_message(_);
		if ( macroPassed )
		{
			// Caught content fetch error
			global.leyes.cache[$ langCode].content = {};
			__leyes_throw_error(LEYES_ERROR.CONFIG_CONTENT_FETCH);
		}
		else
		{
			// Caught invalid macro
			show_debug_message("LocalEyes: LEYES_CONTENT_FETCH_TOGGLE is bad macro");
			__leyes_throw_error(LEYES_ERROR.GENERAL_BAD_MACRO);
		}
	}

	try // Update database
	{
		global.leyes.cache[$ langCode].key = strings;
	}
	catch (_)
	{
		// Catch invalid database
		show_debug_message(_);
		struct_remove(global.leyes.cache, langCode);
		__leyes_throw_error(LEYES_ERROR.GENERAL_DB);
	}
}