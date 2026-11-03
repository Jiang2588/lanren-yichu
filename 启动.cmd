@echo off
chcp 65001 >nul
setlocal
cd /d "%~dp0"

where py >nul 2>nul
if not errorlevel 1 goto serve

where python >nul 2>nul
if not errorlevel 1 goto serve_python

goto direct

:serve
start "Yixu Local Server" /min cmd /c "py -m http.server 8765 --bind 127.0.0.1"
goto open

:serve_python
start "Yixu Local Server" /min cmd /c "python -m http.server 8765 --bind 127.0.0.1"
goto open

:open
timeout /t 2 >nul
start "" "http://127.0.0.1:8765/index.html"
exit /b

:direct
start "" "%~dp0index.html"
exit /b
