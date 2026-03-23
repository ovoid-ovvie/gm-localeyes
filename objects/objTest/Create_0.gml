// =============================================
// LocalEyes Test Suite
// =============================================

passed = 0;
failed = 0;

var test = method(self, function(name, result, expected)
{
    if ( result == expected )
    {
        show_debug_message($"[PASS] {name}");
        passed++;
    }
    else
    {
        show_debug_message($"[FAIL] {name} | Expected: {expected} | Got: {result}");
        failed++;
    }
});

// =============================================
// 1. INITIALISATION
// =============================================
show_debug_message("--- Initialisation ---");

test("isInit set to true",           global.leyes.isInit,  true);
test("lang set correctly",           global.leyes.lang,    "en");
test("fbkLang set correctly",        global.leyes.fbkLang, "fr");

// =============================================
// 2. FETCH — flat key
// =============================================
show_debug_message("--- Fetch: Flat Key ---");

test("Flat key fetch",               leyes_fetch("greeting"), "Hello");
test("Flat key fetch 2",             leyes_fetch("farewell"), "Goodbye");

// =============================================
// 3. FETCH — dot-notation
// =============================================
show_debug_message("--- Fetch: Dot-Notation ---");

test("Nested key fetch",             leyes_fetch("ui.play"), "Play");
test("Nested key fetch 2",           leyes_fetch("ui.quit"), "Quit");

// =============================================
// 4. FETCH — content fetch
// =============================================
show_debug_message("--- Fetch: Content ---");

test("Content fetch flat",           leyes_fetch("Hello"),  "Hello");
test("Content fetch nested",         leyes_fetch("Play"),   "Play");

// =============================================
// 5. DRAW
// =============================================
show_debug_message("--- Draw ---");

var draw = leyes_get_draw();
test("Draw struct exists",           !is_undefined(draw),   true);
test("Draw font set",                draw.font,             -1);
test("Draw halign set",              draw.halign,           fa_left);
test("Draw valign set",              draw.valign,           fa_top);
test("Draw sep set",                 draw.sep,              -1);
test("Draw width set",               draw.width,            -1);

// =============================================
// 6. FETCH — fallback
// =============================================
show_debug_message("--- Fetch: Fallback ---");

leyes_switch("fr");
test("Lang switched correctly",      global.leyes.lang,      "fr");
test("Key in fr",                    leyes_fetch("greeting"), "Bonjour");
test("Fallback for missing key",     leyes_fetch("ui.quit"),  "Quit");

// =============================================
// 7. FETCH — string replacement
// =============================================
show_debug_message("--- Fetch: String Replacement ---");

leyes_switch("en");
test("String replacement",           leyes_fetch("greeting_name", { name: "John" }), "Hello, John!");
test("Multiple replacements",        leyes_fetch("greeting_name", { name: "John", unused: "token" }), "Hello, John!"); // unused fires nonfatal [3.4]
test("No replacements",              leyes_fetch("greeting_name"), "Hello, {name}!");

// =============================================
// 8. IMPORT AND CACHE
// =============================================
show_debug_message("--- Import and Cache ---");

leyes_import("fr");
test("Language cached after import", variable_struct_exists(global.leyes.cache, "fr"), true);
leyes_import("fr");
test("Duplicate import skipped",     variable_struct_exists(global.leyes.cache, "fr"), true);

// =============================================
// 9. SWITCH
// =============================================
show_debug_message("--- Switch ---");

leyes_switch("fr");
test("Switched to fr",               global.leyes.lang,      "fr");
test("fr removed from cache",        variable_struct_exists(global.leyes.cache, "fr"), false);
test("en cached after switch",       variable_struct_exists(global.leyes.cache, "en"), true);
leyes_switch("fr");
test("Same language switch ignored", global.leyes.lang,       "fr");

// =============================================
// 10. RESET
// =============================================
show_debug_message("--- Reset ---");

leyes_reset("en", "fr");
test("isInit after reset",           global.leyes.isInit,    true);
test("lang after reset",             global.leyes.lang,      "en");
test("cache cleared after reset",    variable_struct_names_count(global.leyes.cache), 0);

// =============================================
// RESULTS
// =============================================
show_debug_message("=============================================");
show_debug_message($"Results: {passed} passed, {failed} failed");
show_debug_message("=============================================");