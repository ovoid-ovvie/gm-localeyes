enum LEYES_ERROR
{
	OK,
	GENERAL_NOT_INIT,
	GENERAL_BAD_MACRO,
	CONFIG_DB,
	CONFIG_NO_LANG,
	CONFIG_NO_FBK,
	CONFIG_NEITHER,
	CONFIG_CONTENT_FETCH,
	FILE_NOT_FOUND,
	FILE_BAD_PARSE,
	FILE_EMPTY,
	FETCH_FAIL_FALLBACK,
	FETCH_FAIL_NO_FALLBACK,
	FETCH_FAIL_BAD_FALLBACK,
}

function __leyes_throw_error(err)
{
	switch err
	{
		#region General
		case LEYES_ERROR.GENERAL_NOT_INIT:
			show_error("LocalEyes fatal [0.1]: Not initialised", true);
			break;
		
		case LEYES_ERROR.GENERAL_BAD_MACRO:
			show_error("LocalEyes fatal [0.2]: Invalid macro", true);
			break;
		#endregion
		
		#region Config
		case LEYES_ERROR.CONFIG_DB:
			show_error("LocalEyes fatal [1.1]: Global database is incorrectly configured", true);
			break;
		
		case LEYES_ERROR.CONFIG_NO_LANG:
			show_error("LocalEyes fatal [1.2]: Initialisation contains empty argument (language not set)", true);
			break;
		
		case LEYES_ERROR.CONFIG_NO_FBK:
			show_error("LocalEyes fatal [1.3]: Initialisation contains empty argument (fallback language not set)", true);
			break;
		
		case LEYES_ERROR.CONFIG_NEITHER:
			show_error("LocalEyes fatal [1.4]: Initialisation contains empty arguments (neither language nor fallback language set)", true);
			break;
		
		case LEYES_ERROR.CONFIG_CONTENT_FETCH:
			show_debug_message("LocalEyes nonfatal [1.5]: Error occured while creating data for content fetching, initialisation will proceed without this feature");
			break;
		#endregion
		
		#region File
		case LEYES_ERROR.FILE_NOT_FOUND:
			show_error("LocalEyes fatal [2.1]: File not found", true);
			break;
		
		case LEYES_ERROR.FILE_BAD_PARSE:
			show_error("LocalEyes fatal [2.2]: File cannot be parsed", true);
			break;
		
		case LEYES_ERROR.FILE_EMPTY:
			show_error("LocalEyes fatal [2.3]: File is empty", true);
			break;
		#endregion
		
		#region Fetch
		case LEYES_ERROR.FETCH_FAIL_FALLBACK:
			show_debug_message("LocalEyes nonfatal [3.1]: Key not found, fallback successful");
			break;
		
		case LEYES_ERROR.FETCH_FAIL_NO_FALLBACK:
			show_error("LocalEyes fatal [3.2]: Key not found, fallback unsuccessful (not found)", true);
			break;
		
		case LEYES_ERROR.FETCH_FAIL_BAD_FALLBACK:
			show_error("LocalEyes fatal [3.3]: Key not found, fallback unsuccessful (invalid database)", true);
			break;
		#endregion
	}
}