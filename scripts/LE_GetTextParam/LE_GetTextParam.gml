function leyes_get_draw_text_sep(lang)
{
    try
    {
        return ( global.leyes.draw[$ lang].sep );
    }
    catch (_)
    {
        show_debug_message(_);
        __leyes_throw_error(LEYES_ERROR.GENERAL_DB);
    }
}

function leyes_get_draw_text_width(lang)
{
    try
    {
        return ( global.leyes.draw[$ lang].width );
    }
    catch (_)
    {
        show_debug_message(_);
        __leyes_throw_error(LEYES_ERROR.GENERAL_DB);
    }
}

