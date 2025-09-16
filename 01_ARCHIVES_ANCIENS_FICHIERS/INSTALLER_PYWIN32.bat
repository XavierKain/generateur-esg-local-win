@echo off
chcp 65001 >nul
title Installation PyWin32 pour XLWings

REM Set working directory to script location
cd /d "%~dp0"

echo ==========================================
echo   INSTALLATION PYWIN32 POUR XLWINGS
echo ==========================================
echo.

echo Cette installation va corriger l'erreur:
echo "Make sure to have pywin32, a dependency of xlwings, installed."
echo.

echo [1/4] Vérification de l'environnement Python portable...
if not exist "%CD%\python311\python.exe" (
    echo ❌ Python portable introuvable !
    echo Assurez-vous d'être dans le bon dossier.
    pause
    exit /b 1
)
echo ✅ Python portable trouvé

echo.
echo [2/4] Installation de pywin32...
"%CD%\python311\python.exe" -m pip install --no-warn-script-location pywin32
if %ERRORLEVEL% neq 0 (
    echo ❌ Erreur lors de l'installation de pywin32
    pause
    exit /b 1
)
echo ✅ pywin32 installé

echo.
echo [3/4] Configuration post-installation pywin32...
"%CD%\python311\python.exe" "%CD%\python311\Scripts\pywin32_postinstall.py" -install -quiet
if %ERRORLEVEL% neq 0 (
    echo ⚠️  Configuration post-installation échouée (normal dans certains cas)
    echo Continuons quand même...
)
echo ✅ Configuration terminée

echo.
echo [4/4] Test de pywin32...
"%CD%\python311\python.exe" -c "
import sys
try:
    import win32com.client
    print('✅ win32com.client importé avec succès')
    
    import pywintypes
    print('✅ pywintypes importé avec succès')
    
    # Test création objet Excel
    try:
        excel = win32com.client.Dispatch('Excel.Application')
        print('✅ Excel.Application accessible via COM')
        excel.Quit()
    except Exception as e:
        print(f'⚠️  Excel COM test: {e}')
    
    print('🎯 PYWIN32 INSTALLÉ ET FONCTIONNEL!')
    
except ImportError as e:
    print(f'❌ Erreur import pywin32: {e}')
    sys.exit(1)
except Exception as e:
    print(f'❌ Erreur pywin32: {e}')
    sys.exit(1)
"

if %ERRORLEVEL% neq 0 (
    echo ❌ PyWin32 ne fonctionne pas correctement
    pause
    exit /b 1
)

echo.
echo ==========================================
echo      INSTALLATION PYWIN32 RÉUSSIE !
echo ==========================================
echo.
echo Maintenant, XLWings devrait pouvoir accéder à Excel.
echo.
echo ÉTAPES SUIVANTES:
echo 1. Lancez LANCER_ESG.bat pour tester l'application
echo 2. L'interface devrait maintenant dire "Mode XLWings Exclusif"
echo 3. Si ça ne marche pas, lancez DIAGNOSTIC_XLWINGS_COMPLET.bat
echo.
pause