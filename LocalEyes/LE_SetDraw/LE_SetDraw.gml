/// @desc Sets draw parameters for a language.
/// @url https://github.com/ovoid-ovvie/LocalEyes/blob/Release/Docs/API-Reference.md
/// @param {String} lang Language code to set draw parameters for.
/// @param {Asset.GMFont} font Font asset to use.
/// @param {Constant.HAlign} halign Horizontal alignment.
/// @param {Constant.VAlign} valign Vertical alignment.
/// @param {Real} sep Line separation for draw_text_ext. Use -1 for default.
/// @param {Real} width Maximum line width for draw_text_ext. Use -1 for no limit.
function leyes_set_draw(lang, font, halign, valign, sep, width)
{
    try
    {
        global.leyes.draw[$ lang] =
        {
            font   : font,
            halign : halign,
            valign : valign,
            sep    : sep,
            width  : width
        }
    }
    catch (_)
    {
        show_debug_message(_);
        __leyes_throw_error(LEYES_ERROR.GENERAL_DB);
    }
}