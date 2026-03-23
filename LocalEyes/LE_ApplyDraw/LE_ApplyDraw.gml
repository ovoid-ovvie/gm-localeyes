/// @desc Applies the draw parameters for the current or specified language. Falls back to fallback language draw parameters if not found.
/// @url https://github.com/ovoid-ovvie/LocalEyes/blob/Release/Docs/API-Reference.md
/// @param {String} [lang] Language code to apply draw parameters for. Defaults to current language.
function leyes_apply_draw(lang = undefined)
{
    try
    {
        lang ??= global.leyes.lang;

        var draw = global.leyes.draw[$ lang];

        if ( is_undefined(draw) )
        {
            draw = global.leyes.draw[$ global.leyes.fbkLang];
            if ( is_undefined(draw) )
            {
                __leyes_throw_error(LEYES_ERROR.DRAW_NO_DRAW);
                return;
            }
        }

        draw_set_font(draw.font);
        draw_set_halign(draw.halign);
        draw_set_valign(draw.valign);
    }
    catch (_)
    {
        show_debug_message(_);
        __leyes_throw_error(LEYES_ERROR.GENERAL_DB);
    }
}