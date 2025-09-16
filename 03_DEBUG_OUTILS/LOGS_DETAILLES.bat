@echo off
chcp 65001 >nul
title Logs Détaillés ESG Generator

REM Set working directory to script location
cd /d "%~dp0"

echo ==========================================
echo   LOGS DETAILLES ESG GENERATOR
echo ==========================================
echo.

echo Création des logs détaillés dans logs_debug.txt...
echo.

(
echo ==========================================
echo LOGS DETAILLES - %DATE% %TIME%
echo ==========================================
echo.

echo [ENVIRONNEMENT SYSTEME]
echo Windows Version:
ver
echo.
echo Variables d'environnement critiques:
echo TEMP: %TEMP%
echo USERPROFILE: %USERPROFILE%
echo.

echo [PYTHON PORTABLE INFO]
"..\02_CLIENT_PRODUCTION\python311\python.exe" -c "
import sys, os, platform
print(f'Python Executable: {sys.executable}')
print(f'Python Version: {sys.version}')
print(f'Platform: {platform.platform()}')
print(f'Architecture: {platform.architecture()}')
print(f'Working Directory: {os.getcwd()}')
print('Python Path:')
for p in sys.path:
    print(f'  {p}')
"

echo.
echo [MODULES DETAILLES]
"..\02_CLIENT_PRODUCTION\python311\python.exe" -c "
import importlib
modules = ['streamlit', 'pandas', 'openpyxl', 'xlwings', 'win32com', 'pywintypes', 'pythoncom']

for module in modules:
    try:
        mod = importlib.import_module(module)
        version = getattr(mod, '__version__', 'N/A')
        file_path = getattr(mod, '__file__', 'N/A')
        print(f'{module}: v{version} - {file_path}')
    except ImportError as e:
        print(f'{module}: MANQUANT - {e}')
"

echo.
echo [XLWINGS DIAGNOSTIC APPROFONDI]
"..\02_CLIENT_PRODUCTION\python311\python.exe" -c "
try:
    import xlwings as xw
    print(f'XLWings Module: {xw.__file__}')
    print(f'XLWings Version: {xw.__version__}')
    
    print('Test Apps Collection:')
    try:
        print(f'  Apps Type: {type(xw.apps)}')
        print(f'  Apps Repr: {repr(xw.apps)}')
        print(f'  Apps Length: {len(xw.apps)}')
    except Exception as e:
        print(f'  Apps Error: {e}')
        import traceback
        traceback.print_exc()
        
except Exception as e:
    print(f'XLWings Import Error: {e}')
    import traceback
    traceback.print_exc()
"

echo.
echo [CONFIGURATION APPLICATION]
"..\02_CLIENT_PRODUCTION\python311\python.exe" -c "
import sys, os
sys.path.insert(0, '../02_CLIENT_PRODUCTION')

try:
    from config_portable import *
    print('Configuration actuelle:')
    for var in ['FORCE_OPENPYXL', 'PORTABLE_MODE']:
        if var in globals():
            print(f'  {var}: {globals()[var]}')
            
    print()            
    print('Test de la fonction is_excel_available:')
    try:
        result = is_excel_available()
        print(f'  is_excel_available(): {result}')
    except Exception as e:
        print(f'  is_excel_available() error: {e}')
        
except Exception as e:
    print(f'Config import error: {e}')
    import traceback
    traceback.print_exc()
"

echo.
echo ==========================================
echo FIN DES LOGS - %DATE% %TIME%
echo ==========================================

) > logs_debug.txt 2>&1

echo ✅ Logs créés dans logs_debug.txt
echo.
echo Voulez-vous voir les logs maintenant ? (O/N)
set /p choice=
if /i "%choice%"=="O" (
    type logs_debug.txt
    echo.
)

echo.
echo Les logs sont sauvegardés dans logs_debug.txt
echo Vous pouvez les envoyer au support technique si nécessaire.
echo.
pause