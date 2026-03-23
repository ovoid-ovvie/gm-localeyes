/// @desc Switches the active language. Imports the language if not already cached. If the language being switched to is the current fallback language, the main and fallback languages swap places.
/// @param {String} lang Language code to switch to.
function leyes_switch(lang)
{
    if ( global.leyes.lang == lang ) return;
    try
    {
        leyes_import(global.leyes.lang);
        if ( !variable_struct_exists(global.leyes.cache, lang) )
        {
            leyes_import(lang);
        }

        if ( lang == global.leyes.fbkLang )
        {
            global.leyes.fbkLang    = global.leyes.lang;
            global.leyes.fbkStrings = variable_clone(global.leyes.cache[$ global.leyes.fbkLang]);
        }

        global.leyes.lang    = lang;
        global.leyes.strings = variable_clone(global.leyes.cache[$ lang]);
        struct_remove(global.leyes.cache, lang);
    }
    catch (_)
    {
        show_debug_message(_);
        __leyes_throw_error(LEYES_ERROR.GENERAL_DB);
    }
}