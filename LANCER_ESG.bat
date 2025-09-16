@echo off
chcp 65001 >nul
title Generateur ESG - Application Portable

REM Set working directory to script location
cd /d "%~dp0"

echo ==========================================
echo    GENERATEUR ESG - Version Portable
echo ==========================================
echo.
echo Demarrage de l'application...
echo.
echo Repertoire de travail: %CD%
echo L'application va s'ouvrir dans votre navigateur par defaut.
echo URL: http://localhost:8501
echo.
echo Pour arreter l'application, fermez cette fenetre.
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

REM Start browser after a delay
start "" http://localhost:8501

REM Start Streamlit with embedded Python  
"%CD%\python311\python.exe" -m streamlit run "%CD%\app.py" --server.port 8501 --server.address localhost --server.headless true

echo.
echo Application arretee.
pause