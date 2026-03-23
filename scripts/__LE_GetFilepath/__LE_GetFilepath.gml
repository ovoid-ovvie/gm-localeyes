/// @desc Helper function to fetch language files according to user-defined structure.
/// @param {String} lang_code Language code.
/// @ignore
function __leyes_get_filepath(lang_code)
{
	return LEYES_FILEPATH_BEGIN + lang_code + LEYES_FILEPATH_END + ".json";
}