# Error Reference

[Home](Home.md)

---

LocalEyes uses a documented error system with numeric codes. Fatal errors halt execution via `show_error`. Non-fatal errors log a message via `show_debug_message` and allow execution to continue.

Error codes appear in the output in the format `LocalEyes fatal [X.Y]` or `LocalEyes nonfatal [X.Y]`.

---

## General (0.x)

### 0.1 -- Not Initialised
**Fatal**

A LocalEyes function was called before `leyes_init()` ran. Make sure `LE_Config` is executed before any LocalEyes calls.

### 0.2 -- Invalid Macro
**Fatal**

A config macro could not be evaluated. Check `LE_Config` for typos or invalid values.

### 0.3 -- Invalid Database
**Fatal**

An unexpected error occurred while reading or writing to the internal database struct. This usually indicates something has gone wrong internally. Check the debug output for the underlying exception message, which is logged before this error fires.

---

## Config (1.x)

### 1.1 -- Language Not Set
**Fatal**

`leyes_init()` was called with an empty string for the main language. Fill in both arguments in `LE_Config`.

### 1.2 -- Fallback Language Not Set
**Fatal**

`leyes_init()` was called with an empty string for the fallback language. Fill in both arguments in `LE_Config`.

### 1.3 -- Neither Language Set
**Fatal**

`leyes_init()` was called with empty strings for both arguments. Fill in both arguments in `LE_Config`.

### 1.4 -- Content Fetch Error
**Non-fatal**

An error occurred while building the content fetch lookup table. Initialisation will continue but content fetching will not be available. Check the debug output for the underlying exception.

---

## File (2.x)

### 2.1 -- File Not Found
**Fatal**

The language file could not be found at the expected path. Check that the file exists and that `LEYES_FILEPATH_BEGIN` and `LEYES_FILEPATH_END` are configured correctly in `LE_Config`.

### 2.2 -- File Cannot Be Parsed
**Fatal**

The language file was found but could not be parsed as JSON. Check the file for syntax errors.

### 2.3 -- File Is Empty
**Fatal**

The language file exists but contains no data.

---

## Fetch (3.x)

### 3.1 -- Key Not Found, Fallback Successful
**Non-fatal**

The requested key was not found in the active language but was found in the fallback language. The fallback string was returned. This is expected behaviour for incomplete translations and does not indicate a problem, but it is logged so you know which keys are missing.

### 3.2 -- Key Not Found, Fallback Unsuccessful
**Fatal**

The requested key was not found in either the active language or the fallback language. Check that the key exists in at least the fallback language file.

### 3.3 -- Key Not Found, Fallback Failed Unexpectedly
**Fatal**

The fallback lookup itself threw an unexpected error, likely due to the fallback database being in an invalid state. Check the debug output for the underlying exception.

### 3.4 -- Unmatched Token
**Non-fatal**

A token in the replacement struct passed to `leyes_fetch()` did not match any `{token}` placeholder in the string. The unmatched token is ignored and the string is returned with all matched tokens replaced. Check that the token names in your struct match the placeholders in your language file.

---

## Draw (4.x)

### 4.1 -- Draw Info Not Found
**Non-fatal**

No draw parameters were found for the current language or the fallback language. `leyes_apply_draw()` will return without changing any draw state. Make sure `leyes_set_draw()` has been called for the relevant language.

---

[Next: API Reference](API-Reference.md)
