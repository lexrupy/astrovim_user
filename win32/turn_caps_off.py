import ctypes

def turn_capslock():
    dll = ctypes.WinDLL('User32.dll')
    VK_CAPITAL = 0X14
    if dll.GetKeyState(VK_CAPITAL):
        dll.keybd_event(VK_CAPITAL, 0X3a, 0X1, 0)
        dll.keybd_event(VK_CAPITAL, 0X3a, 0X3, 0)


turn_capslock()
print("OK")
