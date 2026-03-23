/// @desc Switches the active language. Imports the language if not already cached.
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
        global.leyes.lang = lang;
        global.leyes.strings = global.leyes.cache[$ lang];
        struct_remove(global.leyes.cache, lang);
    }
    catch (_)
    {
        show_debug_message(_);
        __leyes_throw_error(LEYES_ERROR.GENERAL_DB);
    }
}