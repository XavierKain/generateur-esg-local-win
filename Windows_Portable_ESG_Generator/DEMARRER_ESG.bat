@echo off
title Générateur ESG - Démarrage Rapide

echo ==========================================
echo    GENERATEUR ESG - Démarrage Rapide
echo ==========================================
echo.

REM Quick Python check
python --version >nul 2>&1
if errorlevel 1 (
    echo ❌ Python non détecté!
    echo.
    echo 🔧 SOLUTION RAPIDE:
    echo 1. Double-cliquez sur "INSTALLER_PYTHON.bat"
    echo 2. Suivez les instructions d'installation
    echo 3. Redémarrez votre ordinateur
    echo 4. Relancez ce script
    echo.
    set /p "install=Voulez-vous ouvrir l'installateur Python maintenant? (o/n): "
    if /i "%install%"=="o" (
        call INSTALLER_PYTHON.bat
    )
    pause
    exit /b 1
)

REM Check if setup was done
if not exist "venv" (
    echo 🔧 Installation automatique en cours...
    call setup_windows.bat
    echo.
    echo ✅ Installation terminée! Démarrage de l'application...
    echo.
)

REM Launch the application
call launch_esg_app.bat