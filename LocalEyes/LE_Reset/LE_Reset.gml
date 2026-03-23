/// @desc Resets the LocalEyes framework and reinitialises with the given languages.
/// @url https://github.com/ovoid-ovvie/LocalEyes/blob/Release/Docs/API-Reference.md
/// @param {String} lang Language code for the main language.
/// @param {String} fallback_lang Language code for the fallback language.
function leyes_reset(lang, fallback_lang)
{
    global.leyes = new __leyes_framework();
    leyes_init(lang, fallback_lang);
}