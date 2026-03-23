# Fetching Strings

[Home](Home.md)

---

All string lookups go through `leyes_fetch()`. It handles key lookup, dot-notation for nested keys, content-based lookup, fallback, and token replacement.

## Basic Usage

```gml
var str = leyes_fetch("greeting");
draw_text(x, y, str);
```

Or inline:

```gml
draw_text(x, y, leyes_fetch("greeting"));
```

## Dot-Notation

Nested keys are accessed by separating each level with a dot.

```gml
leyes_fetch("ui.play")         // accesses strings.ui.play
leyes_fetch("dialogue.intro")  // accesses strings.dialogue.intro
```

You can go as deep as your JSON structure requires.

## Fallback

If a key is not found in the active language, LocalEyes automatically looks it up in the fallback language. If it is found there, it logs a non-fatal `[3.1]` message and returns the fallback string. If it is not found in the fallback either, a fatal `[3.2]` error is thrown.

This means missing translations degrade gracefully rather than crashing the game.

## Token Replacement

You can insert dynamic values into strings by passing a struct of replacements as the second argument.

```gml
leyes_fetch("greeting_name", { name: "John" })
// "Hello, {name}!" becomes "Hello, John!"
```

Multiple tokens work the same way:

```gml
leyes_fetch("score_message", { player: "John", score: 4200 })
// "Good job, {player}! You scored {score} points."
// becomes "Good job, John! You scored 4200 points."
```

If a token in the replacement struct does not appear in the string, a non-fatal `[3.4]` error is logged and the unmatched token is ignored. The string is still returned with all matched tokens replaced.

If you pass a string with a `{token}` placeholder and no replacement struct, the placeholder is returned as-is.

## Content Fetching

As an alternative to key names, you can look up strings by their actual content. See [Content Fetching](Content-Fetching.md) for a full explanation.

## Error Summary

| Situation | Error | Fatal |
|---|---|---|
| Key not found, fallback succeeded | 3.1 | No |
| Key not found, fallback also missing | 3.2 | Yes |
| Key not found, fallback lookup failed unexpectedly | 3.3 | Yes |
| Unmatched token in replacement struct | 3.4 | No |

See [Error Reference](Error-Reference.md) for the full error list.

---

[Next: Draw Management](Draw-Management.md)
