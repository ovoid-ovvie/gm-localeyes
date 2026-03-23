function __leyes_lookup(loc, str)
{
    var lookup = loc.key;
    var key = string_split(str, ".");
    var i = 0;
    do
    {
        lookup = lookup[$ key[i]];
        if ( is_undefined(lookup) )
        {
            if ( variable_struct_names_count(loc.content) > 0 )
            {
                lookup = loc.content[$ str];
                if ( is_undefined(lookup) ) return undefined;
                break;
            }
            else { return undefined; }
        }
        i++;
    }
    until ( i == array_length(key) );
    return lookup;
}