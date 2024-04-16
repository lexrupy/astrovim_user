#!/usr/bin/python3

# This script rely on evdev library. to install it on debian based os run
# sudo apt install python3-evdev

from evdev import InputDevice, UInput, ecodes as e
import os

keyboard_device = InputDevice('/dev/input/by-path/platform-i8042-serio-0-event-kbd')
if keyboard_device and e.LED_CAPSL in keyboard_device.leds():
    # Se o Caps Lock estiver ativado, desativa-o
    ui = UInput()
    # Envia um evento de tecla para pressionar e soltar a tecla Caps Lock
    ui.write(e.EV_KEY, e.KEY_CAPSLOCK, 1)  # Pressiona Caps Lock
    ui.syn()
    ui.write(e.EV_KEY, e.KEY_CAPSLOCK, 0)  # Solta Caps Lock
    ui.syn()
    # Libera o dispositivo de entrada virtual
    ui.close()


# def get_caps_state():
#     caps_lock_state = 0
#     # Find the path to Caps Lock LED
#     caps_lock_led_path = None
#     leds_path = "/sys/class/leds"
#     for led_dir in os.listdir(leds_path):
#         if "capslock" in led_dir.lower():
#             caps_lock_led_path = os.path.join(leds_path, led_dir, "brightness")
#             break
#     # Verify if path has been found
#     if caps_lock_led_path:
#         # Verify actual state o Caps Lock LED
#         with open(caps_lock_led_path, "r") as f:
#             caps_lock_state = int(f.read())
#         return  bool(caps_lock_state)
#
