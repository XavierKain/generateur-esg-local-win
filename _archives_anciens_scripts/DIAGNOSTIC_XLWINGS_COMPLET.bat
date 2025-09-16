@echo off
chcp 65001 >nul
title Diagnostic XLWings Complet

REM Set working directory to script location
cd /d "%~dp0"

echo ==========================================
echo   DIAGNOSTIC XLWINGS ULTRA-DETAILLE
echo ==========================================
echo.

echo Ce diagnostic va identifier EXACTEMENT pourquoi XLWings ne fonctionne pas.
echo.

echo [Phase 1] Diagnostic système complet...
"%CD%\python311\python.exe" xlwings_diagnostic.py

echo.
echo [Phase 2] Test XLWings Generator avec logs...
"%CD%\python311\python.exe" -c "
print('=' * 50)
print('TEST XLWINGS GENERATOR')
print('=' * 50)

from xlwings_generator import XLWingsGenerator

print('Création XLWingsGenerator...')
gen = XLWingsGenerator()

print('Test is_available()...')
available, status = gen.is_available()

print(f'Résultat: {available}')
print(f'Status: {status}')

if available:
    print('🎯 XLWINGS GENERATOR FONCTIONNE!')
else:
    print('❌ XLWINGS GENERATOR ÉCHOUE')
    print('Voir les logs détaillés ci-dessus pour la cause exacte.')
"

echo.
echo [Phase 3] Test configuration portable...
"%CD%\python311\python.exe" -c "
print('=' * 50)
print('CONFIGURATION PORTABLE')
print('=' * 50)

try:
    from config_portable import FORCE_OPENPYXL, PORTABLE_MODE, is_excel_available
    print(f'FORCE_OPENPYXL: {FORCE_OPENPYXL}')
    print(f'PORTABLE_MODE: {PORTABLE_MODE}')
    
    excel_available = is_excel_available()
    print(f'Excel disponible selon config: {excel_available}')
    
except Exception as e:
    print(f'Erreur configuration: {e}')
"

echo.
echo ==========================================
echo         DIAGNOSTIC TERMINE
echo ==========================================
echo.
echo Analysez les logs ci-dessus pour identifier le problème.
echo.
echo PROBLEMES COURANTS:
echo - "xw.apps est None" → Excel pas démarre correctement
echo - "COM Excel échoué" → Problème permissions/installation Excel  
echo - "Module win32com non disponible" → pywin32 manquant
echo.
pause