// Filepath structure for your language files, edit as desired (empty
// strings won't alter structure)
#macro LEYES_FILEPATH_BEGIN "lang/" // start of the filepath
#macro LEYES_FILEPATH_END   ""      // end of the filepath

// Settings for content fetching, which is when strings can be fetched
// by entering the content of the string as the fetch parameters.
#macro LEYES_CONTENT_FETCH_TOGGLE       true // enable/disable content fetching
#macro LEYES_CONTENT_FETCH_LENGTH_LIMIT 64   // exclude strings with more characters than this value (default 64)

// Set the first argument to the main language you want to load, and
// the second to the fallback language you want to load.
leyes_init("", "");