/// @desc Loads and parses a JSON language file into a struct.
/// @param {String} filename Full filepath to the JSON file.
/// @return {Struct} Parsed JSON struct.
/// @ignore
function __leyes_parse_json(filename)
{
	// Create buffer for file
	var buffer = buffer_load(filename);
	
	if ( !buffer_exists(buffer) ) // If file does not exist
	{
		__leyes_throw_error(LEYES_ERROR.FILE_NOT_FOUND);
	}
	
	if ( buffer_get_size(buffer) == 0 ) // If file is empty
	{
		buffer_delete(buffer);
		__leyes_throw_error(LEYES_ERROR.FILE_EMPTY);
	}
	
	var result = buffer_read(buffer, buffer_text);
	buffer_delete(buffer);
	
	try
	{
		return json_parse(result);
	}
	catch (_)
	{
		// Catch bad parse
		__leyes_throw_error(LEYES_ERROR.FILE_BAD_PARSE);
	}
}