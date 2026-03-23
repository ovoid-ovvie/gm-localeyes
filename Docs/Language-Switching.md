# Language Switching

[Home](Home.md)

---

LocalEyes supports switching the active language at runtime. Language files are cached after their first load so switching back to a previously used language does not re-read the file.

## Switching Language

```gml
leyes_switch("fr");
```

This does the following:

1. Caches the current language so it can be restored later
2. Imports the target language if it has not been loaded yet
3. Sets the target language as active
4. Removes the target language from the cache since it is now the active language

If the language being switched to is the current fallback language, the main and fallback languages swap. The previous main language becomes the new fallback. This ensures the fallback is always a different language from the active one.

Calling `leyes_switch()` with the current language does nothing.

## Pre-loading Languages

If you want to load a language file ahead of time without switching to it, use `leyes_import()`.

```gml
leyes_import("de");
```

This parses the file and adds it to the cache. Calling `leyes_import()` on a language that is already cached does nothing.

## Resetting

`leyes_reset()` wipes the entire framework and reinitialises it with new languages, as if it had just been set up for the first time.

```gml
leyes_reset("en", "fr");
```

This clears the cache, clears draw parameters, and runs initialisation again. Useful during development or if you need a completely clean state.

---

[Next: Content Fetching](Content-Fetching.md)
