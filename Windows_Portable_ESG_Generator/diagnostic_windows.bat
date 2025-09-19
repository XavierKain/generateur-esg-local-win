@echo off
title Générateur ESG - Diagnostic Système

echo ==========================================
echo    GENERATEUR ESG - Diagnostic
echo ==========================================
echo.

echo [1/5] Vérification de Python...
python --version >nul 2>&1
if errorlevel 1 (
    echo ❌ Python non trouvé!
    echo    Veuillez installer Python depuis https://python.org
    echo    N'oubliez pas "Add Python to PATH"
) else (
    echo ✅ Python détecté: 
    python --version
)

echo.
echo [2/5] Vérification de pip...
pip --version >nul 2>&1
if errorlevel 1 (
    echo ❌ pip non trouvé!
) else (
    echo ✅ pip détecté: 
    pip --version
)

echo.
echo [3/5] Vérification de l'environnement virtuel...
if exist "venv" (
    echo ✅ Environnement virtuel trouvé
) else (
    echo ⚠️  Environnement virtuel non trouvé
    echo    Lancez setup_windows.bat pour le créer
)

echo.
echo [4/5] Vérification des fichiers de l'application...
if exist "app.py" (
    echo ✅ Fichier principal app.py trouvé
) else (
    echo ❌ Fichier app.py manquant!
)

if exist "requirements_windows.txt" (
    echo ✅ Fichier requirements trouvé
) else (
    echo ❌ Fichier requirements_windows.txt manquant!
)

echo.
echo [5/5] Test de connexion réseau locale...
echo Tentative de connexion à localhost:8501...
netstat -an | findstr "8501" >nul 2>&1
if errorlevel 1 (
    echo ✅ Port 8501 disponible
) else (
    echo ⚠️  Port 8501 déjà utilisé
    echo    Une autre instance peut être en cours
)

echo.
echo ==========================================
echo              Diagnostic terminé
echo ==========================================
echo.
echo Si vous voyez des ❌, corrigez les problèmes et relancez.
echo Si tout est ✅, vous pouvez lancer DEMARRER_ESG.bat
echo.
pause