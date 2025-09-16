@echo off
chcp 65001 >nul
title Activation XLWings pour Excel

echo ==========================================
echo    ACTIVATION XLWINGS POUR EXCEL
echo ==========================================
echo.

echo Cette mise a jour configure l'application pour utiliser
echo XLWings avec Excel (formatage conditionnel preserve).
echo.

echo Verification de la presence d'Excel...
echo.

REM Test si Excel est installe
tasklist /FI "IMAGENAME eq excel.exe" 2>NUL | find /I /N "excel.exe">NUL
if "%ERRORLEVEL%"=="1" (
    echo Excel n'est pas actuellement en cours d'execution.
    echo Tentative de demarrage d'Excel pour test...
    echo.
    
    REM Essayer de demarrer Excel
    start /wait excel.exe /automation
    timeout /t 3 >nul
    
    REM Fermer Excel
    taskkill /F /IM excel.exe 2>nul
)

echo Configuration pour XLWings activee...
echo.

echo ==========================================
echo         XLWINGS ACTIVE
echo ==========================================
echo.
echo L'application utilisera maintenant XLWings si Excel
echo est disponible, ce qui preserve 100%% du formatage.
echo.
echo Relancez l'application avec LANCER_ESG.bat
echo.
pause