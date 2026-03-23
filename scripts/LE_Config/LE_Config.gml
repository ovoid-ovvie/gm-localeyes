// Filepath structure for your language files, edit as desired (empty
// strings won't alter structure)
#macro LEYES_FILEPATH_BEGIN "lang/" // start of the filepath
#macro LEYES_FILEPATH_END   ""      // end of the filepath

// Settings for content fetching, which is when strings can be fetched
// by entering the content of the string as the fetch parameters.
#macro LEYES_CONTENT_FETCH_TOGGLE       true // enable/disable content fetching
#macro LEYES_CONTENT_FETCH_LENGTH_LIMIT 64   // exclude strings with more characters than this value (default 64)

// Default draw parameters, edit them to be values you want
#macro LEYES_FONT -1
#macro LEYES_HALIGN fa_left
#macro LEYES_VALIGN fa_top

// Set the first argument to the main language you want to load, and
// the second to the fallback language you want to load. This is
// required before running.
leyes_init("", "");

// Main language draw parameters. Change them to what you want.
leyes_set_draw
(
    global.leyes.lang, // do not change
    -1, // font
    fa_left, // halign
    fa_top, // valign
    -1, // sep (used in draw_text_ext)
    -1 // width (used in draw_text_ext)
)

// Fallback language draw parameters. Change them to what you want.
leyes_set_draw
(
    global.leyes.fbkLang, // do not change
    -1, // font
    fa_left, // halign
    fa_top, // valign
    -1, // sep (used in draw_text_ext)
    -1 // width (used in draw_text_ext)
)