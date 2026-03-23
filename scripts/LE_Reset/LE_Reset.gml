function leyes_reset(lang, fallback_lang)
{
    global.leyes = new __leyes_framework();
    leyes_init(lang, fallback_lang);
}