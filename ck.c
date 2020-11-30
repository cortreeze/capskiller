#include <Windows.h>

#define CK_EXPORT __declspec(dllexport)


// Returns 1 if key is toggled and zero otherwise
static int key_is_toggled(WORD key)
{
    SHORT state = GetKeyState(key);
    return state & 1;
}

// Returns zero on success and -1 otherwise
static int toggle_key(WORD key)
{
    INPUT input;
    ZeroMemory(&input, sizeof(input));
    input.type = INPUT_KEYBOARD;
    input.ki.wVk = key;

    // Key press
    UINT sent = SendInput(1, &input, sizeof(input));
    if (sent != 1)
        return -1;

    // Key release
    input.ki.dwFlags = KEYEVENTF_KEYUP;
    sent = SendInput(1, &input, sizeof(input));
    if (sent != 1)
        return -1;

    return 0;
}


/*                    Public API                    */

// Returns 1 if CapsLock is enabled and 0 otherwise
CK_EXPORT int ck_caps_enabled()
{
    return key_is_toggled(VK_CAPITAL);
}

// Returns zero on success and -1 otherwise
CK_EXPORT int ck_caps_on()
{
    if (!key_is_toggled(VK_CAPITAL))
        return toggle_key(VK_CAPITAL);
    return 0;
}

// Returns zero on success and -1 otherwise
CK_EXPORT int ck_caps_off() 
{
    if (key_is_toggled(VK_CAPITAL))
        return toggle_key(VK_CAPITAL);
    return 0;
}

