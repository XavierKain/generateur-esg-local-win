@echo off
chcp 65001 >nul
title Diagnostic ESG Generator

REM Set working directory to script location
cd /d "%~dp0"

echo ==========================================
echo    DIAGNOSTIC ESG GENERATOR
echo ==========================================
echo.
echo Repertoire de travail: %CD%
echo.

echo [1/4] Verification de Python portable...
if exist "python311\python.exe" (
    echo OK: Python portable trouve
    "%CD%\python311\python.exe" --version
) else (
    echo ERREUR: Python portable manquant
)

echo.
echo [2/4] Verification des dependances...
"%CD%\python311\python.exe" -c "import streamlit; print('Streamlit:', streamlit.__version__)" 2>nul
if errorlevel 1 (
    echo ERREUR: Streamlit non trouve
) else (
    echo OK: Streamlit disponible
)

"%CD%\python311\python.exe" -c "import pandas; print('Pandas:', pandas.__version__)" 2>nul
if errorlevel 1 (
    echo ERREUR: Pandas non trouve
) else (
    echo OK: Pandas disponible
)

"%CD%\python311\python.exe" -c "import numpy; print('Numpy:', numpy.__version__)" 2>nul
if errorlevel 1 (
    echo ERREUR: Numpy non trouve
) else (
    echo OK: Numpy disponible
)

echo.
echo [3/4] Verification des fichiers application...
if exist "app.py" (
    echo OK: app.py trouve
) else (
    echo ERREUR: app.py manquant
)

if exist "xlwings_generator.py" (
    echo OK: xlwings_generator.py trouve
) else (
    echo ERREUR: xlwings_generator.py manquant
)

echo.
echo [4/4] Test de port reseau...
netstat -an | findstr ":8501" >nul
if errorlevel 1 (
    echo OK: Port 8501 disponible
) else (
    echo ATTENTION: Port 8501 deja utilise
)

echo.
echo ==========================================
echo              DIAGNOSTIC TERMINE
echo ==========================================
echo.
echo Si tout est OK, vous pouvez lancer LANCER_ESG.bat
echo.
pause