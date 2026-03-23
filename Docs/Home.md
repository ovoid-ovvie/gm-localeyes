# LocalEyes

LocalEyes is a localisation API for GameMaker. It handles importing language files, fetching localised strings, managing draw parameters per language, and switching between languages at runtime, all through a clean set of functions backed by a single config script.

It is designed to be dropped into any project with minimal setup and get out of your way.

---

## Why LocalEyes?

Most localisation setups in GameMaker are ad hoc. You load a JSON file, parse it into a struct, and access it directly. That works fine until you need fallback languages, font management, language switching, or a teammate who does not speak English having to remember key names.

LocalEyes solves all of that with a consistent interface and no boilerplate.

The standout feature is **content fetching**, which lets you look up a string by its actual content rather than its key name. If you know the string, you can fetch it. This is particularly useful for multilingual teams where not everyone works in the same language.

---

## Feature Overview

- JSON-based language files
- Flat and nested key lookup with dot-notation
- Content-based lookup as an alternative to key names
- Automatic fallback to a secondary language when a key is missing
- Per-language font and draw parameter management
- String token replacement
- Language file caching for efficient runtime switching
- A single config script as the only integration point
- A documented error system with fatal and non-fatal errors

---

## Getting Started

See the [Setup](Setup.md) page to get LocalEyes integrated into your project.

---

## Pages

- [Setup](Setup.md)
- [Language Files](Language-Files.md)
- [Fetching Strings](Fetching-Strings.md)
- [Draw Management](Draw-Management.md)
- [Language Switching](Language-Switching.md)
- [Content Fetching](Content-Fetching.md)
- [Error Reference](Error-Reference.md)
- [API Reference](API-Reference.md)
