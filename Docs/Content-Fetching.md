# Content Fetching

[Home](Home.md)

---

Content fetching is an optional feature that lets you look up strings by their content rather than their key name. Instead of remembering that the play button label is stored under `"ui.play"`, you can just pass `"Play"` directly.

```gml
leyes_fetch("Play")    // same result as leyes_fetch("ui.play")
leyes_fetch("Hello")   // same result as leyes_fetch("greeting")
```

This is handled automatically inside `leyes_fetch()`. If a key lookup fails, LocalEyes checks the content lookup table before falling back to the fallback language.

## How It Works

When a language file is loaded, LocalEyes builds a reverse lookup table that maps each string's content to its key. This table is flat regardless of how deeply nested the original JSON is, so content lookup always works with a single string and no dot-notation.

## Enabling and Disabling

Content fetching is controlled by `LEYES_CONTENT_FETCH_TOGGLE` in `LE_Config`.

```gml
#macro LEYES_CONTENT_FETCH_TOGGLE true
```

Setting this to `false` skips building the reverse lookup table entirely, which reduces memory usage and speeds up initialisation slightly. Attempting a content fetch when the feature is disabled will simply fail and fall through to the fallback language.

## Length Limit

Strings longer than `LEYES_CONTENT_FETCH_LENGTH_LIMIT` characters are excluded from the content lookup table. The default limit is 64 characters.

```gml
#macro LEYES_CONTENT_FETCH_LENGTH_LIMIT 64
```

Long strings are impractical to type as lookup arguments anyway, and excluding them keeps the table lean. Excluded strings are still accessible by key lookup. The number of excluded strings is logged to the debug output on initialisation.

## Use Cases

Content fetching is most useful when:

- You are working in a multilingual team and want to write fetch calls in your own language rather than remembering English key names
- You are prototyping and want to type the string directly without setting up keys first
- Your strings are short and unambiguous enough that the content is a reasonable identifier

## Caveats

**Collisions** -- if two different keys have the same string content in a language file, one will silently overwrite the other in the lookup table. If your strings are ambiguous enough that collisions are a risk, use key lookup instead.

**Language specificity** -- content fetch matches against the strings in the active language file. Passing a string from a different language will not match unless that exact string also exists in the active language file.

**Fragility to edits** -- if a translator changes a string value, any code using that string as a content fetch argument will silently break. Key lookup is immune to this. Content fetch is a convenience feature and key lookup is the more robust choice for production code.

## Multilingual Teams

The main motivation for content fetch is multilingual teams. Without it, every developer has to use the same key naming convention regardless of the language they work in, which in practice means everyone ends up writing English key names. Content fetch removes that requirement. A French developer can write `leyes_fetch("Bonjour")` and a Japanese developer can write `leyes_fetch("こんにちは")` and both resolve correctly without either needing to know the key name.

---

[Next: Error Reference](Error-Reference.md)
