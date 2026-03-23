/// @desc Looks up a string from a strings struct by key name, dot-notation path, or content.
/// @param {Struct} loc Strings struct containing key and content substruct.
/// @param {String} str Key name, dot-notation path, or string content to look up.
/// @return {String} The found string, or undefined if not found.
/// @ignore
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
                lookup = loc.key[$ loc.content[$ str]];
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