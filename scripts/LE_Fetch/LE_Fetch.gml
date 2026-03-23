/// @desc Fetches a localised string by key name or string content. Supports dot-notation for nested keys.
/// @param {String} lookup Key name, dot-notation path, or string content to look up.
/// @return {String} The localised string.
function leyes_fetch(lookup)
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

    return str;
}