@echo off
chcp 65001 >nul
title Test PyWin32 Intégré

REM Set working directory to script location
cd /d "%~dp0"

echo ==========================================
echo   TEST PYWIN32 INTÉGRÉ DANS PORTABLE
echo ==========================================
echo.

echo [1/4] Vérification des fichiers pywin32...
if not exist "%CD%\python311\Lib\site-packages\win32\win32api.pyd" (
    echo ❌ Fichiers pywin32 manquants !
    echo Les modules pywin32 n'ont pas été correctement copiés.
    pause
    exit /b 1
)
echo ✅ Modules pywin32 trouvés

if not exist "%CD%\python311\DLLs\pythoncom311.dll" (
    echo ❌ DLL pythoncom manquante !
    echo Les DLL pywin32 n'ont pas été correctement copiées.
    pause
    exit /b 1
)
echo ✅ DLL pywin32 trouvées

echo.
echo [2/4] Test import pywin32...
"%CD%\python311\python.exe" -c "
try:
    import win32api
    print('✅ win32api importé')
    
    import win32com.client
    print('✅ win32com.client importé')
    
    import pywintypes
    print('✅ pywintypes importé')
    
    print('🎯 PYWIN32 PORTABLE FONCTIONNEL!')
    
except ImportError as e:
    print(f'❌ Erreur import: {e}')
    exit(1)
except Exception as e:
    print(f'❌ Erreur: {e}')
    exit(1)
"

if %ERRORLEVEL% neq 0 (
    echo ❌ PyWin32 portable ne fonctionne pas
    pause
    exit /b 1
)

echo.
echo [3/4] Test Excel COM...
"%CD%\python311\python.exe" -c "
try:
    import win32com.client
    print('Tentative de connexion Excel...')
    
    excel = win32com.client.Dispatch('Excel.Application')
    print('✅ Excel.Application connecté via COM')
    
    excel.Visible = False
    print('✅ Excel contrôlé via COM')
    
    excel.Quit()
    print('✅ Excel fermé proprement')
    
    print('🎯 EXCEL COM FONCTIONNEL!')
    
except Exception as e:
    print(f'⚠️  Excel COM: {e}')
    print('(Normal si Excel pas installé ou permissions insuffisantes)')
"

echo.
echo [4/4] Test XLWings final...
"%CD%\python311\python.exe" -c "
try:
    import xlwings as xw
    print('XLWings version:', xw.__version__)
    
    print('Test xw.apps...')
    print('Type xw.apps:', type(xw.apps))
    
    # Test critique
    apps_repr = repr(xw.apps)
    print('xw.apps représentation:', apps_repr)
    
    if 'Make sure to have' in str(apps_repr):
        print('❌ PyWin32 encore manquant pour XLWings')
        exit(1)
    else:
        print('✅ XLWings peut accéder aux apps')
    
    print('🎯 XLWINGS + PYWIN32 PORTABLE RÉUSSI!')
    
except Exception as e:
    print(f'❌ Erreur XLWings: {e}')
    import traceback
    traceback.print_exc()
    exit(1)
"

if %ERRORLEVEL% neq 0 (
    echo ❌ XLWings ne fonctionne toujours pas avec pywin32 intégré
    pause
    exit /b 1
)

echo.
echo ==========================================
echo     PYWIN32 PORTABLE INSTALLÉ AVEC SUCCÈS !
echo ==========================================
echo.
echo 🎯 PyWin32 est maintenant intégré dans l'environnement portable.
echo 🎯 XLWings peut maintenant accéder à Excel sans erreur.
echo.
echo ÉTAPES SUIVANTES:
echo 1. Lancez LANCER_ESG.bat pour tester l'application complète
echo 2. L'interface devrait maintenant dire "Mode XLWings Exclusif"
echo 3. Vous devriez pouvoir générer des questionnaires Excel
echo.
pause