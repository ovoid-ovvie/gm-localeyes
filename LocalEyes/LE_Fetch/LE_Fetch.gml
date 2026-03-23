/// @desc Fetches a localised string by key name or string content. Supports dot-notation for nested keys. Optionally replaces {token} placeholders with values from a struct.
/// @param {String} lookup Key name, dot-notation path, or string content to look up.
/// @param {Struct} [replacements] Optional struct of token replacements e.g. { name: "John" } replaces {name} in the string.
/// @return {String} The localised string.
function leyes_fetch(lookup, replacements = undefined)
{
    var undefinedStrPassed = false;
    var str;

    try
    {
        str = __leyes_lookup(global.leyes.strings, lookup);
        if ( is_undefined(str) )
        {
            undefinedStrPassed = true;
            var fbkStr = __leyes_lookup(global.leyes.fbkStrings, lookup);
            if ( is_undefined(fbkStr) )
            {
                __leyes_throw_error(LEYES_ERROR.FETCH_FAIL_NO_FALLBACK);
            }
            else
            {
                __leyes_throw_error(LEYES_ERROR.FETCH_FAIL_FALLBACK);
                str = fbkStr;
            }
        }
    }
    catch (_)
    {
        show_debug_message(_);
        if ( undefinedStrPassed )
        {
            __leyes_throw_error(LEYES_ERROR.FETCH_FAIL_BAD_FALLBACK);
        }
        else
        {
            __leyes_throw_error(LEYES_ERROR.GENERAL_DB);
        }
    }

    if ( !is_undefined(replacements) )
    {
        var rNames = variable_struct_get_names(replacements);
        for ( var i = 0; i < array_length(rNames); i++ )
        {
            var rKey = rNames[i];
            var token = "{" + rKey + "}";
            if ( string_count(token, str) == 0 )
            {
                __leyes_throw_error(LEYES_ERROR.FETCH_UNMATCHED_TOKEN);
            }
            str = string_replace_all(str, token, string(replacements[$ rKey]));
        }
    }

    return str;
}