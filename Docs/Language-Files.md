# Language Files

[Home](Home.md)

---

Language files are JSON files stored in your project's data files. By default LocalEyes expects them at `lang/<code>.json`.

## Basic Structure

A language file is a flat or nested JSON object where each key maps to a localised string.

```json
{
    "greeting": "Hello",
    "farewell": "Goodbye"
}
```

Keys are what you pass to `leyes_fetch()`. Values are the strings that get returned.

## Nested Structure

Keys can be nested into logical groups using objects.

```json
{
    "ui": {
        "play": "Play",
        "quit": "Quit",
        "settings": "Settings"
    },
    "dialogue": {
        "intro": "Welcome to the game.",
        "outro": "Thanks for playing."
    }
}
```

Nested keys are accessed with dot-notation:

```gml
leyes_fetch("ui.play")      // "Play"
leyes_fetch("dialogue.intro") // "Welcome to the game."
```

You can nest as deeply as you like. LocalEyes traverses the full path.

## String Tokens

If you want to insert dynamic values into a string, use `{token}` placeholders:

```json
{
    "greeting_name": "Hello, {name}!",
    "score": "Your score is {score} points."
}
```

These are replaced at fetch time by passing a struct to `leyes_fetch()`. See [Fetching Strings](Fetching-Strings.md) for details.

## Fallback Language

Your fallback language file does not need to be a complete copy of your main language file, but it should contain any strings that might be missing from other language files. Any key that cannot be found in the active language will be looked up in the fallback.

## Naming

Language codes can be anything you like as long as they match what you pass to `leyes_init()` and `leyes_switch()`. ISO 639-1 codes like `"en"`, `"fr"`, `"ja"` are the obvious choice, but LocalEyes does not enforce any format.

---

[Next: Fetching Strings](Fetching-Strings.md)
