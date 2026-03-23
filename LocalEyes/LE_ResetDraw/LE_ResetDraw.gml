/// @desc Resets draw parameters to the defaults defined in LE_Config.
/// @url https://github.com/ovoid-ovvie/LocalEyes/blob/Release/Docs/API-Reference.md
function leyes_reset_draw()
{
    draw_set_font(LEYES_FONT);
    draw_set_halign(LEYES_HALIGN);
    draw_set_valign(LEYES_VALIGN);
}