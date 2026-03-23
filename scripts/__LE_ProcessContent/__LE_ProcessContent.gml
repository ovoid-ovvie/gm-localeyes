function __leyes_process_content(strings, contentStruct)
{
    var names = variable_struct_get_names(strings);
    for (var i = 0; i < array_length(names); i++)
    {
        var key = names[i];
        var value = strings[$ key];
        if ( is_struct(value) )
        {
            __leyes_process_content(value, contentStruct);
        }
        else if ( string_length(value) <= LEYES_CONTENT_FETCH_LENGTH_LIMIT )
        {
            contentStruct[$ value] = key;
        }
    }
}