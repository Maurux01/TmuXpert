@echo off
REM =============================================================================
REM TMUX INSTALLATION SCRIPT FOR WINDOWS - Optimized for Neovim VimX
REM =============================================================================

echo 🚀 Installing Tmux configuration optimized for Neovim VimX...

REM Check if tmux is installed
where tmux >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Tmux is not installed. Please install tmux first:
    echo.
    echo Windows: choco install tmux
    echo Or download from: https://github.com/tmux/tmux/releases
    pause
    exit /b 1
)

echo [INFO] Tmux version:
tmux -V

REM Create necessary directories
echo ================================
echo Creating directories...
echo ================================

if not exist "%USERPROFILE%\.tmux" mkdir "%USERPROFILE%\.tmux"
if not exist "%USERPROFILE%\.tmux\plugins" mkdir "%USERPROFILE%\.tmux\plugins"
if not exist "%USERPROFILE%\.tmux\resurrect" mkdir "%USERPROFILE%\.tmux\resurrect"
if not exist "%USERPROFILE%\.tmux\logs" mkdir "%USERPROFILE%\.tmux\logs"

echo [INFO] Directories created successfully

REM Install TPM (Tmux Plugin Manager)
echo ================================
echo Installing TPM (Tmux Plugin Manager)...
echo ================================

if not exist "%USERPROFILE%\.tmux\plugins\tpm" (
    git clone https://github.com/tmux-plugins/tpm "%USERPROFILE%\.tmux\plugins\tpm"
    echo [INFO] TPM installed successfully
) else (
    echo [INFO] TPM already installed, updating...
    cd /d "%USERPROFILE%\.tmux\plugins\tpm" && git pull
)

REM Copy tmux configuration
echo ================================
echo Installing Tmux configuration...
echo ================================

if exist "%USERPROFILE%\.tmux.conf" (
    echo [WARNING] %USERPROFILE%\.tmux.conf already exists. Creating backup...
    copy "%USERPROFILE%\.tmux.conf" "%USERPROFILE%\.tmux.conf.backup.%date:~-4,4%%date:~-10,2%%date:~-7,2%_%time:~0,2%%time:~3,2%%time:~6,2%"
)

copy ".tmux.conf.windows" "%USERPROFILE%\.tmux.conf"
echo [INFO] Tmux configuration for Windows installed

REM Create battery script for Windows
echo ================================
echo Creating battery script...
echo ================================

echo @echo off > "%USERPROFILE%\.tmux\battery.bat"
echo REM Simple battery status for tmux on Windows >> "%USERPROFILE%\.tmux\battery.bat"
echo for /f "tokens=2 delims==" %%i in ('wmic path win32_battery get EstimatedChargeRemaining /value ^| find "="') do set battery=%%i >> "%USERPROFILE%\.tmux\battery.bat"
echo echo %%battery%%%% >> "%USERPROFILE%\.tmux\battery.bat"

REM Create theme switcher for Windows
echo ================================
echo Creating theme switcher...
echo ================================

echo @echo off > "%USERPROFILE%\.tmux\theme-switcher.bat"
echo REM Tmux theme switcher for Windows >> "%USERPROFILE%\.tmux\theme-switcher.bat"
echo echo Available themes: >> "%USERPROFILE%\.tmux\theme-switcher.bat"
echo echo 1. tokyo-night >> "%USERPROFILE%\.tmux\theme-switcher.bat"
echo echo 2. catppuccin >> "%USERPROFILE%\.tmux\theme-switcher.bat"
echo echo 3. dracula >> "%USERPROFILE%\.tmux\theme-switcher.bat"
echo echo 4. gruvbox >> "%USERPROFILE%\.tmux\theme-switcher.bat"
echo echo 5. nord >> "%USERPROFILE%\.tmux\theme-switcher.bat"
echo echo 6. material >> "%USERPROFILE%\.tmux\theme-switcher.bat"
echo echo 7. one-dark >> "%USERPROFILE%\.tmux\theme-switcher.bat"
echo echo 8. solarized >> "%USERPROFILE%\.tmux\theme-switcher.bat"
echo echo 9. monokai >> "%USERPROFILE%\.tmux\theme-switcher.bat"
echo echo 10. rose-pine >> "%USERPROFILE%\.tmux\theme-switcher.bat"
echo echo. >> "%USERPROFILE%\.tmux\theme-switcher.bat"
echo set /p choice="Select theme (1-10): " >> "%USERPROFILE%\.tmux\theme-switcher.bat"
echo if "%%choice%%"=="1" tmux set -g status-style "bg=colour235,fg=colour136" ^& tmux set -g window-status-current-style "bg=colour136,fg=colour235" >> "%USERPROFILE%\.tmux\theme-switcher.bat"
echo if "%%choice%%"=="2" tmux set -g status-style "bg=colour240,fg=colour223" ^& tmux set -g window-status-current-style "bg=colour136,fg=colour235" >> "%USERPROFILE%\.tmux\theme-switcher.bat"
echo if "%%choice%%"=="3" tmux set -g status-style "bg=colour53,fg=colour255" ^& tmux set -g window-status-current-style "bg=colour141,fg=colour53" >> "%USERPROFILE%\.tmux\theme-switcher.bat"
echo if "%%choice%%"=="4" tmux set -g status-style "bg=colour237,fg=colour223" ^& tmux set -g window-status-current-style "bg=colour214,fg=colour237" >> "%USERPROFILE%\.tmux\theme-switcher.bat"
echo if "%%choice%%"=="5" tmux set -g status-style "bg=colour240,fg=colour255" ^& tmux set -g window-status-current-style "bg=colour109,fg=colour240" >> "%USERPROFILE%\.tmux\theme-switcher.bat"
echo if "%%choice%%"=="6" tmux set -g status-style "bg=colour238,fg=colour255" ^& tmux set -g window-status-current-style "bg=colour33,fg=colour238" >> "%USERPROFILE%\.tmux\theme-switcher.bat"
echo if "%%choice%%"=="7" tmux set -g status-style "bg=colour235,fg=colour188" ^& tmux set -g window-status-current-style "bg=colour33,fg=colour235" >> "%USERPROFILE%\.tmux\theme-switcher.bat"
echo if "%%choice%%"=="8" tmux set -g status-style "bg=colour254,fg=colour66" ^& tmux set -g window-status-current-style "bg=colour33,fg=colour254" >> "%USERPROFILE%\.tmux\theme-switcher.bat"
echo if "%%choice%%"=="9" tmux set -g status-style "bg=colour52,fg=colour255" ^& tmux set -g window-status-current-style "bg=colour197,fg=colour52" >> "%USERPROFILE%\.tmux\theme-switcher.bat"
echo if "%%choice%%"=="10" tmux set -g status-style "bg=colour235,fg=colour223" ^& tmux set -g window-status-current-style "bg=colour168,fg=colour235" >> "%USERPROFILE%\.tmux\theme-switcher.bat"

REM Create quick reference
echo ================================
echo Creating quick reference...
echo ================================

echo # Tmux Quick Reference > "%USERPROFILE%\.tmux\quick-ref.md"
echo. >> "%USERPROFILE%\.tmux\quick-ref.md"
echo ## Key Bindings >> "%USERPROFILE%\.tmux\quick-ref.md"
echo. >> "%USERPROFILE%\.tmux\quick-ref.md"
echo ### Prefix >> "%USERPROFILE%\.tmux\quick-ref.md"
echo - **Prefix**: `Ctrl+Space` (instead of Ctrl+b) >> "%USERPROFILE%\.tmux\quick-ref.md"
echo. >> "%USERPROFILE%\.tmux\quick-ref.md"
echo ### Windows >> "%USERPROFILE%\.tmux\quick-ref.md"
echo - **New window**: `prefix + c` >> "%USERPROFILE%\.tmux\quick-ref.md"
echo - **Kill window**: `prefix + X` >> "%USERPROFILE%\.tmux\quick-ref.md"
echo - **Switch to window**: `Alt + number` (1-9, 0 for 10) >> "%USERPROFILE%\.tmux\quick-ref.md"
echo. >> "%USERPROFILE%\.tmux\quick-ref.md"
echo ### Panes >> "%USERPROFILE%\.tmux\quick-ref.md"
echo - **Split horizontal**: `prefix + \|` >> "%USERPROFILE%\.tmux\quick-ref.md"
echo - **Split vertical**: `prefix + -` >> "%USERPROFILE%\.tmux\quick-ref.md"
echo - **Kill pane**: `prefix + x` >> "%USERPROFILE%\.tmux\quick-ref.md"
echo - **Toggle zoom**: `prefix + z` >> "%USERPROFILE%\.tmux\quick-ref.md"
echo - **Switch panes**: `Alt + arrow keys` >> "%USERPROFILE%\.tmux\quick-ref.md"
echo - **Resize panes**: `Alt + Shift + arrow keys` >> "%USERPROFILE%\.tmux\quick-ref.md"
echo. >> "%USERPROFILE%\.tmux\quick-ref.md"
echo ### Sessions >> "%USERPROFILE%\.tmux\quick-ref.md"
echo - **Save session**: `prefix + S` >> "%USERPROFILE%\.tmux\quick-ref.md"
echo - **Restore session**: `prefix + R` >> "%USERPROFILE%\.tmux\quick-ref.md"
echo. >> "%USERPROFILE%\.tmux\quick-ref.md"
echo ### Other >> "%USERPROFILE%\.tmux\quick-ref.md"
echo - **Reload config**: `prefix + r` >> "%USERPROFILE%\.tmux\quick-ref.md"
echo - **Theme switcher**: `%USERPROFILE%\.tmux\theme-switcher.bat` >> "%USERPROFILE%\.tmux\quick-ref.md"

echo [INFO] Quick reference created at %USERPROFILE%\.tmux\quick-ref.md

REM Create startup script
echo ================================
echo Creating startup script...
echo ================================

echo @echo off > "%USERPROFILE%\.tmux\start.bat"
echo REM Tmux startup script >> "%USERPROFILE%\.tmux\start.bat"
echo echo Starting Tmux with VimX-optimized configuration... >> "%USERPROFILE%\.tmux\start.bat"
echo. >> "%USERPROFILE%\.tmux\start.bat"
echo REM Check if tmux is running >> "%USERPROFILE%\.tmux\start.bat"
echo tmux has-session -t main 2^>nul >> "%USERPROFILE%\.tmux\start.bat"
echo if %%errorlevel%% equ 0 ( >> "%USERPROFILE%\.tmux\start.bat"
echo     echo Attaching to existing session 'main'... >> "%USERPROFILE%\.tmux\start.bat"
echo     tmux attach-session -t main >> "%USERPROFILE%\.tmux\start.bat"
echo ) else ( >> "%USERPROFILE%\.tmux\start.bat"
echo     echo Creating new session 'main'... >> "%USERPROFILE%\.tmux\start.bat"
echo     tmux new-session -s main >> "%USERPROFILE%\.tmux\start.bat"
echo ) >> "%USERPROFILE%\.tmux\start.bat"

REM Final instructions
echo ================================
echo Installation Complete! 🎉
echo ================================

echo.
echo ✅ Tmux configuration installed successfully!
echo.
echo 📋 Next steps:
echo 1. Start tmux: tmux
echo 2. Install plugins: prefix + I (Ctrl+Space, then I)
echo 3. Reload config: prefix + r
echo.
echo 🎨 Available themes:
echo Run: %USERPROFILE%\.tmux\theme-switcher.bat
echo.
echo 📖 Quick reference:
echo View: type %USERPROFILE%\.tmux\quick-ref.md
echo.
echo 🚀 Quick start:
echo Run: %USERPROFILE%\.tmux\start.bat
echo.
echo 💡 Tips:
echo - Use Ctrl+Space as prefix (instead of Ctrl+b)
echo - Alt+arrow keys to switch panes
echo - Alt+number to switch windows
echo - All keybinds are optimized for Neovim VimX compatibility
echo.
echo Happy coding with Tmux + Neovim VimX! 🚀
echo.
pause 