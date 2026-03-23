/// @desc Recursively processes a strings struct and populates a flat content lookup struct. Returns the number of excluded strings.
/// @param {Struct} strings Strings struct to process.
/// @param {Struct} contentStruct Target struct to populate with content lookups.
/// @return {Real} Number of strings excluded due to exceeding the length limit.
/// @ignore
function __leyes_process_content(strings, contentStruct, prefix = "")
{
    var names = variable_struct_get_names(strings);
    var excluded = 0;
    for (var i = 0; i < array_length(names); i++)
    {
        var key = names[i];
        var value = strings[$ key];
        var fullKey = (prefix == "") ? key : prefix + "." + key;
        if ( is_struct(value) )
        {
            excluded += __leyes_process_content(value, contentStruct, fullKey);
        }
        else if ( string_length(value) <= LEYES_CONTENT_FETCH_LENGTH_LIMIT )
        {
            contentStruct[$ value] = fullKey;
        }
        else
        {
            excluded++;
        }
    }
    return excluded;
}