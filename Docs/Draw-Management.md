# Draw Management

[Home](Home.md)

---

Different languages often need different fonts, alignments, or text layout parameters. LocalEyes stores draw parameters per language and applies them with a single function call.

## Setting Draw Parameters

Draw parameters are set in `LE_Config` for the main and fallback languages. You can also call `leyes_set_draw()` at any point to set or update parameters for any language.

```gml
leyes_set_draw
(
    "ja",        // language code
    fnt_japanese, // font
    fa_left,      // halign
    fa_top,       // valign
    -1,           // sep (-1 for default line height)
    -1            // width (-1 for no wrap limit)
)
```

`sep` and `width` correspond to the last two arguments of GML's `draw_text_ext()`. Setting both to `-1` uses GameMaker's defaults.

## Applying Draw Parameters

Call `leyes_apply_draw()` before drawing text to set font, halign, and valign for the current language.

```gml
leyes_apply_draw();
draw_text(x, y, leyes_fetch("greeting"));
leyes_reset_draw();
```

`leyes_reset_draw()` restores the default values defined in `LE_Config`.

You can also apply draw parameters for a specific language rather than the current one:

```gml
leyes_apply_draw("fr");
```

If no draw parameters are found for the specified language, LocalEyes falls back to the fallback language's draw parameters. If those are also missing, a non-fatal `[4.1]` error is logged.

## Using sep and width

Since `sep` and `width` are not global GML draw state, they cannot be applied by `leyes_apply_draw()` directly. Use `leyes_get_draw()` to retrieve the draw struct and pass them to `draw_text_ext()` yourself.

```gml
leyes_apply_draw();
var draw = leyes_get_draw();
draw_text_ext(x, y, leyes_fetch("long_text"), draw.sep, draw.width);
leyes_reset_draw();
```

## Getting Draw Parameters

`leyes_get_draw()` returns the full draw struct for the current language.

```gml
var draw = leyes_get_draw();
// draw.font
// draw.halign
// draw.valign
// draw.sep
// draw.width
```

---

[Next: Language Switching](Language-Switching.md)
