@echo off
chcp 65001 >nul
title Correction XLWings Apps None

REM Set working directory to script location
cd /d "%~dp0"

echo ==========================================
echo   CORRECTION XLWINGS APPS = NONE
echo ==========================================
echo.

echo Cette erreur "'NoneType' object has no attribute 'apps'" 
echo indique que XLWings n'arrive pas à initialiser Excel.
echo.

echo [1/6] Fermeture de tous les processus Excel...
taskkill /F /IM excel.exe 2>nul
timeout /t 2 /nobreak >nul
echo ✅ Excel fermé

echo.
echo [2/6] Nettoyage du cache XLWings...
rmdir /S /Q "%TEMP%\xlwings" 2>nul
rmdir /S /Q "%USERPROFILE%\AppData\Local\xlwings" 2>nul
echo ✅ Cache nettoyé

echo.
echo [3/6] Configuration registre Excel pour automation...
reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Excel\Security" /v AccessVBOM /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\15.0\Excel\Security" /v AccessVBOM /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\14.0\Excel\Security" /v AccessVBOM /t REG_DWORD /d 1 /f >nul 2>&1
echo ✅ Registre configuré

echo.
echo [4/6] Test démarrage Excel en mode automation...
start /min excel.exe /automation
timeout /t 3 /nobreak >nul
echo ✅ Excel démarré en mode automation

echo.
echo [5/6] Test XLWings avec logs détaillés...
"%CD%\python311\python.exe" -c "
import xlwings as xw
print('XLWings version:', xw.__version__)
print('Apps avant init:', xw.apps)
print('Type apps:', type(xw.apps))

try:
    # Force la réinitialisation
    if hasattr(xw, '_xlplatform'):
        print('Réinitialisation xlplatform...')
        xw._xlplatform = None
    
    print('Tentative App...')
    app = xw.App(visible=True, add_book=False)  # Visible pour debug
    print('SUCCESS! App créée:', app)
    print('Apps après:', xw.apps)
    
    # Test books
    print('Books:', app.books)
    
    # Fermeture
    app.quit()
    print('App fermée correctement')
    
except Exception as e:
    print('ERREUR:', e)
    import traceback
    traceback.print_exc()
"

echo.
echo [6/6] Fermeture Excel...
taskkill /F /IM excel.exe 2>nul
echo ✅ Excel fermé

echo.
echo ==========================================
echo         CORRECTION TERMINEE
echo ==========================================
echo.
echo Si vous voyez "SUCCESS! App créée", le problème est corrigé.
echo Sinon, le problème vient peut-être d'une installation Excel corrompue.
echo.
echo ESSAYEZ MAINTENANT:
echo 1. MAJ_APP_SEULEMENT.bat (pour copier les corrections)
echo 2. LANCER_ESG.bat (pour tester l'application)
echo.
pause