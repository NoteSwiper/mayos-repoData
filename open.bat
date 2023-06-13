@echo off

set loadDir = "%~dp0\open.bat"

ver | find /i "Version 6.1." > nul
if %ERRORLEVEL% equ 0 GOTO :WIN7MINUS
ver | find /i "Version 6.2." > nul
if %ERRORLEVEL% equ 0 GOTO :WIN8PLUS
ver | find /i "Version 6.3." > nul
if %ERRORLEVEL% equ 0 GOTO :WIN8PLUS
ver | find /i "Version 10.0." > nul
if %ERRORLEVEL% equ 0 GOTO :WIN8PLUS
goto :OTHER


:WIN8PLUS
echo "Your OS Supports VS Code!"
echo "Checking VS Code Installed..."
if exist "%userprofile%\AppData\Local\Programs\Microsoft VS Code\Code.exe" (
    echo "Visual Studio Code found from %userprofile%\AppData\Local\Programs\Microsoft VS Code !"
    %userprofile%\AppData\Local\Programs\Microsoft VS Code\Code.exe -v
    %userprofile%\AppData\Local\Programs\Microsoft VS Code\Code.exe --verbose -n -a %loadDir%
) else if exist "C:\Program Files\Microsoft VS Code\Code.exe" (
    echo "Visual Studio Code found from C:\Program Files\Microsoft VS Code\ !"
    C:\Program Files\Microsoft VS Code\Code.exe -v
    C:\Program Files\Microsoft VS Code\Code.exe --verbose -n -a %loadDir%
) else (
    echo "Visual Studio Code not found from your Computer!"
    echo "download VS Code from Microsoft VS Code Website!"
)
goto END

:WIN7MINUS
echo "Your OS has not Supports VS Code!"
echo "to Use VS Code, Upgrade your OS into Windows 8 or Download Legacy version."
goto END

:OTHEROS
echo "Cannot detecting OS for Non-windows OS!"
echo "when your os has Windows, this is a bug accidentally made off."
echo "Try opener in another command file!"
goto END




