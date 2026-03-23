# API Reference

[Home](Home.md)

---

All public functions are prefixed with `leyes_`. Internal functions are prefixed with `__leyes_` and are not intended to be called directly.

---

## [leyes_init(lang, fallback_lang)](../LocalEyes/LE_Init/LE_Init.gml)

Initialises the LocalEyes framework. This is called automatically by `LE_Config` and should not need to be called manually except via `leyes_reset()`.

| Parameter | Type | Description |
|---|---|---|
| lang | String | Language code for the main language |
| fallback_lang | String | Language code for the fallback language |

Both arguments are required and must not be empty strings.

---

## [leyes_fetch(lookup, [replacements])](../LocalEyes/LE_Fetch/LE_Fetch.gml)

Fetches a localised string. Supports key names, dot-notation paths, and content-based lookup. Falls back to the fallback language if the key is not found in the active language.

| Parameter | Type | Description |
|---|---|---|
| lookup | String | Key name, dot-notation path, or string content |
| replacements | Struct | Optional. Token replacement values e.g. `{ name: "John" }` |

**Returns:** String

```gml
leyes_fetch("greeting")
leyes_fetch("ui.play")
leyes_fetch("Hello")
leyes_fetch("greeting_name", { name: "John" })
```

See [Fetching Strings](Fetching-Strings.md) for full details.

---

## [leyes_import(lang)](../LocalEyes/LE_Import/LE_Import.gml)

Loads a language file and adds it to the cache. Does nothing if the language is already cached.

| Parameter | Type | Description |
|---|---|---|
| lang | String | Language code to import |

---

## [leyes_switch(lang)](../LocalEyes/LE_Switch/LE_Switch.gml)

Switches the active language. Imports the language if it is not already cached. If the language being switched to is the current fallback language, the main and fallback languages swap places.

Does nothing if the language being switched to is already the active language.

| Parameter | Type | Description |
|---|---|---|
| lang | String | Language code to switch to |

---

## [leyes_reset(lang, fallback_lang)](../LocalEyes/LE_Reset/LE_Reset.gml)

Resets the LocalEyes framework completely and reinitialises it with new languages. Clears the cache, draw parameters, and all stored strings.

| Parameter | Type | Description |
|---|---|---|
| lang | String | Language code for the main language |
| fallback_lang | String | Language code for the fallback language |

---

## [leyes_set_draw(lang, font, halign, valign, sep, width)](../LocalEyes/LE_SetDraw/LE_SetDraw.gml)

Sets draw parameters for a language.

| Parameter | Type | Description |
|---|---|---|
| lang | String | Language code |
| font | Asset.GMFont | Font asset. Use `-1` for GameMaker's default font |
| halign | Constant.HAlign | Horizontal alignment |
| valign | Constant.VAlign | Vertical alignment |
| sep | Real | Line separation for `draw_text_ext`. Use `-1` for default |
| width | Real | Maximum line width for `draw_text_ext`. Use `-1` for no limit |

---

## [leyes_apply_draw([lang])](../LocalEyes/LE_ApplyDraw/LE_ApplyDraw.gml)

Applies the draw parameters for the current or specified language. Sets font, halign, and valign. Falls back to the fallback language's draw parameters if none are found for the specified language.

| Parameter | Type | Description |
|---|---|---|
| lang | String | Optional. Language code to apply draw parameters for. Defaults to the current language |

---

## [leyes_reset_draw()](../LocalEyes/LE_ResetDraw/LE_ResetDraw.gml)

Resets draw parameters to the defaults defined in `LE_Config` via `LEYES_FONT`, `LEYES_HALIGN`, and `LEYES_VALIGN`.

---

## [leyes_get_draw()](../LocalEyes/LE_GetDraw/LE_GetDraw.gml)

Returns the draw parameters struct for the current language.

**Returns:** Struct with fields `font`, `halign`, `valign`, `sep`, `width`

```gml
var draw = leyes_get_draw();
draw_text_ext(x, y, leyes_fetch("text"), draw.sep, draw.width);
```

---

## Global Struct

LocalEyes stores all runtime state in `global.leyes`. This struct is managed entirely by LocalEyes functions and should not be modified directly.

```gml
global.leyes = {
    isInit     : false,
    lang       : "",
    strings    : { key: {}, content: {} },
    fbkLang    : "",
    fbkStrings : { key: {}, content: {} },
    draw       : {},
    cache      : {}
}
```

---

## Error Enum

All error codes are defined in the `LEYES_ERROR` enum.

| Value | Code | Description |
|---|---|---|
| GENERAL_NOT_INIT | 0.1 | Not initialised |
| GENERAL_BAD_MACRO | 0.2 | Invalid macro |
| GENERAL_DB | 0.3 | Invalid database |
| CONFIG_NO_LANG | 1.1 | Language not set |
| CONFIG_NO_FBK | 1.2 | Fallback language not set |
| CONFIG_NEITHER | 1.3 | Neither language set |
| CONFIG_CONTENT_FETCH | 1.4 | Content fetch error |
| FILE_NOT_FOUND | 2.1 | File not found |
| FILE_BAD_PARSE | 2.2 | File cannot be parsed |
| FILE_EMPTY | 2.3 | File is empty |
| FETCH_FAIL_FALLBACK | 3.1 | Key not found, fallback successful |
| FETCH_FAIL_NO_FALLBACK | 3.2 | Key not found, fallback unsuccessful |
| FETCH_FAIL_BAD_FALLBACK | 3.3 | Key not found, fallback failed unexpectedly |
| FETCH_UNMATCHED_TOKEN | 3.4 | Unmatched token in replacement struct |
| DRAW_NO_DRAW | 4.1 | Draw info not found |

See [Error Reference](Error-Reference.md) for full descriptions.
