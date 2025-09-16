@echo off
chcp 65001 >nul
title Generateur ESG - Mode Silencieux

REM Set working directory to script location
cd /d "%~dp0"

echo ==========================================
echo    GENERATEUR ESG - Mode Silencieux
echo ==========================================
echo.
echo Demarrage silencieux de l'application...
echo.
echo Repertoire de travail: %CD%
echo L'application va s'ouvrir dans votre navigateur.
echo Cette fenetre restera ouverte en arriere-plan.
echo.

REM Verify files exist
if not exist "app.py" (
    echo ERREUR: app.py non trouve dans %CD%
    pause
    exit /b 1
)

if not exist "python311\python.exe" (
    echo ERREUR: python311\python.exe non trouve
    pause
    exit /b 1
)

REM Wait 3 seconds then open browser
timeout /t 3 /nobreak >nul
start "" http://localhost:8501

REM Start Streamlit in headless mode
"%CD%\python311\python.exe" -m streamlit run "%CD%\app.py" --server.port 8501 --server.address localhost --server.headless true

echo.
echo Application arretee.
pause