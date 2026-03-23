# Setup

[Home](Home.md)

---

Getting LocalEyes running in a project takes about two minutes.

## 1. Import the Scripts

Copy the LocalEyes scripts folder into your GameMaker project. All scripts are self-contained and have no external dependencies.

## 2. Create Your Language Files

LocalEyes expects JSON files in a specific location. By default it looks for them at `lang/<code>.json`, so for English that would be `lang/en.json`.

See [Language Files](Language-Files.md) for how to structure them.

## 3. Configure LE_Config

Open `LE_Config` and fill in the two required fields:

```gml
leyes_init("en", "fr"); // main language, fallback language
```

Everything else in the config has sensible defaults and does not need to be changed unless you want to.

Here is the full config with all options explained:

```gml
// Filepath structure for your language files. Empty strings won't alter the structure.
#macro LEYES_FILEPATH_BEGIN "lang/" // start of the filepath
#macro LEYES_FILEPATH_END   ""      // end of the filepath

// Content fetching lets you look up strings by their content rather than their key name.
#macro LEYES_CONTENT_FETCH_TOGGLE       true // enable/disable content fetching
#macro LEYES_CONTENT_FETCH_LENGTH_LIMIT 64   // strings longer than this won't be added to the content lookup

// Default draw parameters used by leyes_reset_draw().
#macro LEYES_FONT   -1      // -1 uses GameMaker's default font
#macro LEYES_HALIGN fa_left
#macro LEYES_VALIGN fa_top

// Set your main language and fallback language here. Both are required.
leyes_init("en", "fr");

// Draw parameters for the main language.
leyes_set_draw
(
    global.leyes.lang, // do not change
    -1,      // font
    fa_left, // halign
    fa_top,  // valign
    -1,      // sep (used in draw_text_ext, -1 for default)
    -1       // width (used in draw_text_ext, -1 for no limit)
)

// Draw parameters for the fallback language.
leyes_set_draw
(
    global.leyes.fbkLang, // do not change
    -1,
    fa_left,
    fa_top,
    -1,
    -1
)
```

## 4. Done

LocalEyes is now running. The config script executes automatically when the game starts. You can start calling `leyes_fetch()` from anywhere in your project.

---

## File Path Configuration

If your language files live somewhere other than `lang/`, adjust `LEYES_FILEPATH_BEGIN` and `LEYES_FILEPATH_END` accordingly. These are concatenated with the language code to form the full path:

```
LEYES_FILEPATH_BEGIN + language_code + LEYES_FILEPATH_END + ".json"
```

So with the defaults, `"en"` resolves to `"lang/en.json"`.

If your files are named like `"en_strings.json"`, you would set:

```gml
#macro LEYES_FILEPATH_END "_strings"
```

---

[Next: Language Files](Language-Files.md)
