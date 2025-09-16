@echo off
chcp 65001 >nul
title Test Streamlit Debug

REM Set working directory to script location
cd /d "%~dp0"

echo ==========================================
echo    TEST STREAMLIT - DEBUG MODE
echo ==========================================
echo.

echo Test du lancement de Streamlit...
echo.

echo Dossier actuel:
echo %CD%
echo.

echo Contenu du dossier:
dir
echo.

echo Test d'import Python:
"%CD%\python311\python.exe" -c "print('Python fonctionne')"
echo.

echo Test d'import Streamlit:
"%CD%\python311\python.exe" -c "import streamlit as st; print('Streamlit OK')"
echo.

echo Verification des fichiers:
if exist "app.py" (
    echo OK: app.py trouve
) else (
    echo ERREUR: app.py manquant
)

if exist "python311\python.exe" (
    echo OK: python.exe trouve
) else (
    echo ERREUR: python.exe manquant
)

echo.
echo Tentative de lancement Streamlit (avec debug)...
echo.
"%CD%\python311\python.exe" -m streamlit run "%CD%\app.py" --server.port 8501 --server.address localhost --server.headless true --logger.level debug

echo.
echo Streamlit s'est arrete.
pause