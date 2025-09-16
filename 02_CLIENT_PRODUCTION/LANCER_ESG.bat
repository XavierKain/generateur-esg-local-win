@echo off
chcp 65001 >nul
title Générateur ESG - Version Portable

REM Set working directory to script location
cd /d "%~dp0"

echo ==========================================
echo   GENERATEUR ESG - Version Portable
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

REM Start Streamlit
"%CD%\python311\python.exe" -m streamlit run app.py --server.headless true --server.port 8501 --server.address localhost