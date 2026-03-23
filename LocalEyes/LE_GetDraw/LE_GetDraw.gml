/// @desc Returns the draw parameters struct for the current language.
/// @return {Struct} Draw parameters struct.
function leyes_get_draw()
{
    try
    {
        return ( global.leyes.draw[$ global.leyes.lang] );
    }
    catch (_)
    {
        show_debug_message(_);
        __leyes_throw_error(LEYES_ERROR.GENERAL_DB);
    }
}