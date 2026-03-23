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