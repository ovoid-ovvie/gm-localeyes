/// @desc Constructs a language file path from the configured prefix, language code, suffix, and .json extension.
/// @param {String} lang_code Language code.
/// @return {String} Full filepath.
/// @ignore
function __leyes_get_filepath(lang_code)
{
	return LEYES_FILEPATH_BEGIN + lang_code + LEYES_FILEPATH_END + ".json";
}