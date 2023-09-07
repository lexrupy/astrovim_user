@echo off
REM Call Python Script to turn Caps Lock Off if its On
set scriptPath=%~dp0
python3 %scriptPath%\turn_caps_off.py
