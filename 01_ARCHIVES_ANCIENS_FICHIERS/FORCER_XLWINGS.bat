@echo off
chcp 65001 >nul
title Configuration XLWings Excel Windows

echo ==========================================
echo   CONFIGURATION XLWINGS POUR WINDOWS
echo ==========================================
echo.

echo Cette version EXIGE XLWings + Excel.
echo Plus de fallback vers OpenPyXL.
echo.

echo [1/5] Verification de Excel...
tasklist /FI "IMAGENAME eq excel.exe" 2>NUL | find /I /N "excel.exe">NUL
if "%ERRORLEVEL%"=="0" (
    echo ✅ Excel en cours d'execution
) else (
    echo ⚠️  Excel non detecte en cours d'execution
    echo Tentative de demarrage d'Excel...
    start /min excel.exe
    timeout /t 3 >nul
    echo Excel demarre en arriere-plan
)

echo.
echo [2/5] Test de XLWings avec Python portable...
"%CD%\python311\python.exe" -c "import xlwings as xw; print('✅ XLWings importe'); app = xw.App(visible=False, add_book=False); print('✅ Excel accessible'); app.quit(); print('✅ Test reussi')" 2>error.log
if errorlevel 1 (
    echo ❌ Erreur XLWings. Voir error.log:
    type error.log
) else (
    echo ✅ XLWings fonctionne avec Excel
    del error.log 2>nul
)

echo.
echo [3/5] Verification de COM Excel...
"%CD%\python311\python.exe" -c "import win32com.client; xl = win32com.client.Dispatch('Excel.Application'); print('✅ COM Excel OK'); xl.Quit()" 2>nul
if errorlevel 1 (
    echo ❌ COM Excel non disponible
    echo Installation de pywin32 necessaire...
    "%CD%\python311\python.exe" -m pip install pywin32
) else (
    echo ✅ COM Excel disponible
)

echo.
echo [4/5] Configuration des permissions...
REM S'assurer qu'Excel peut etre automatise
reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Excel\Security" /v AccessVBOM /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\15.0\Excel\Security" /v AccessVBOM /t REG_DWORD /d 1 /f >nul 2>&1
echo ✅ Permissions Excel configurees

echo.
echo [5/5] Test final complet...
"%CD%\python311\python.exe" -c "
from xlwings_generator import XLWingsGenerator
gen = XLWingsGenerator()
available, status = gen.is_available()
print(f'Disponible: {available}')
print(f'Status: {status}')
if available:
    print('🎯 XLWINGS PRET!')
else:
    print('❌ PROBLEME:', status)
"

echo.
echo ==========================================
echo        CONFIGURATION TERMINEE
echo ==========================================
echo.
echo Si vous voyez "XLWINGS PRET!", lancez l'application.
echo Sinon, verifiez qu'Excel est bien installe.
echo.
pause