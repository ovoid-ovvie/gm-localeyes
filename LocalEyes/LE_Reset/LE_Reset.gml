/// @desc Resets the LocalEyes framework and reinitialises with the given languages.
/// @param {String} lang Language code for the main language.
/// @param {String} fallback_lang Language code for the fallback language.
function leyes_reset(lang, fallback_lang)
{
    global.leyes = new __leyes_framework();
    leyes_init(lang, fallback_lang);
}