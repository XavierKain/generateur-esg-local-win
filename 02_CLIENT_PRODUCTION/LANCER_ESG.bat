@echo off
chcp 65001 >nul
title Generateur ESG - Version Portable

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

REM Start Streamlit en arriere-plan
start /min "ESG Server" "%CD%\python311\python.exe" -m streamlit run app.py --server.headless true --server.port 8501 --server.address localhost

echo Demarrage du serveur en cours...
echo Attente de 8 secondes pour que le serveur soit pret...
timeout /t 8 /nobreak >nul

echo Ouverture automatique du navigateur...
start "" "http://localhost:8501"

echo.
echo L'application ESG s'ouvre dans votre navigateur !
echo.
echo Pour arreter l'application :
echo - Fermez cette fenetre OU
echo - Tapez Ctrl+C dans la fenetre minimisee "ESG Server"
echo.
pause