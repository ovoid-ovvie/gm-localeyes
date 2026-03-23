function __leyes_process_content(strings, contentStruct)
{
    var names = variable_struct_get_names(strings);
    var excluded = 0;
    for (var i = 0; i < array_length(names); i++)
    {
        var key = names[i];
        var value = strings[$ key];
        if ( is_struct(value) )
        {
            excluded += __leyes_process_content(value, contentStruct);
        }
        else if ( string_length(value) <= LEYES_CONTENT_FETCH_LENGTH_LIMIT )
        {
            contentStruct[$ value] = key;
        }
        else
        {
            excluded++;
        }
    }
    return excluded;
}