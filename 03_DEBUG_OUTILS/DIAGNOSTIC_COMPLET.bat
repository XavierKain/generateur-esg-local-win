@echo off
chcp 65001 >nul
title Diagnostic Complet ESG Generator

REM Set working directory to script location
cd /d "%~dp0"

echo ==========================================
echo   DIAGNOSTIC COMPLET ESG GENERATOR
echo ==========================================
echo.

echo [1/5] Test de l'environnement Python...
if not exist "..\02_CLIENT_PRODUCTION\python311\python.exe" (
    echo ❌ Python portable introuvable !
    pause
    exit /b 1
)
echo ✅ Python portable trouvé

echo.
echo [2/5] Test des modules critiques...
"..\02_CLIENT_PRODUCTION\python311\python.exe" -c "
import sys
print(f'Python version: {sys.version}')

try:
    import streamlit
    print(f'✅ Streamlit {streamlit.__version__}')
except ImportError:
    print('❌ Streamlit manquant')

try:
    import pandas
    print(f'✅ Pandas {pandas.__version__}')
except ImportError:
    print('❌ Pandas manquant')

try:
    import openpyxl
    print(f'✅ OpenPyXL {openpyxl.__version__}')
except ImportError:
    print('❌ OpenPyXL manquant')

try:
    import xlwings
    print(f'✅ XLWings {xlwings.__version__}')
except ImportError:
    print('❌ XLWings manquant')

try:
    import win32com.client
    print('✅ PyWin32 disponible')
except ImportError:
    print('❌ PyWin32 manquant')
"

echo.
echo [3/5] Test spécifique XLWings...
"..\02_CLIENT_PRODUCTION\python311\python.exe" -c "
try:
    import xlwings as xw
    print('XLWings version:', xw.__version__)
    print('Apps object:', type(xw.apps))
    
    # Test critique
    try:
        apps_repr = repr(xw.apps)
        if 'Make sure to have' in apps_repr:
            print('❌ PyWin32 non configuré')
        else:
            print('✅ XLWings opérationnel')
    except Exception as e:
        print(f'⚠️  XLWings apps error: {e}')
        
except Exception as e:
    print(f'❌ XLWings error: {e}')
"

echo.
echo [4/5] Test Excel COM...
"..\02_CLIENT_PRODUCTION\python311\python.exe" -c "
try:
    import win32com.client
    excel = win32com.client.Dispatch('Excel.Application')
    print('✅ Excel accessible via COM')
    excel.Quit()
except Exception as e:
    print(f'⚠️  Excel COM: {e}')
"

echo.
echo [5/5] Test configuration application...
"..\02_CLIENT_PRODUCTION\python311\python.exe" -c "
import sys
sys.path.insert(0, '../02_CLIENT_PRODUCTION')

try:
    from config_portable import FORCE_OPENPYXL, PORTABLE_MODE
    print(f'FORCE_OPENPYXL: {FORCE_OPENPYXL}')
    print(f'PORTABLE_MODE: {PORTABLE_MODE}')
    
    if not FORCE_OPENPYXL and not PORTABLE_MODE:
        print('✅ Configuration XLWings exclusive')
    else:
        print('⚠️  Configuration non optimale')
        
except Exception as e:
    print(f'❌ Config error: {e}')
"

echo.
echo ==========================================
echo         DIAGNOSTIC TERMINE
echo ==========================================
echo.
echo Si tout est vert (✅), l'application devrait fonctionner.
echo Si des erreurs (❌), consultez la documentation.
echo.
pause