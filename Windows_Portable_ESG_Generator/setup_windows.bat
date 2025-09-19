@echo off
echo ====================================
echo   GENERATEUR ESG - Configuration
echo ====================================
echo.

REM Check if Python is installed
python --version >nul 2>&1
if errorlevel 1 (
    echo ❌ ERREUR: Python n'est pas installé ou n'est pas dans le PATH
    echo.
    echo 📋 SOLUTION:
    echo 1. Allez sur https://python.org/downloads/
    echo 2. Téléchargez Python 3.8 ou plus récent
    echo 3. Lors de l'installation, COCHEZ IMPÉRATIVEMENT:
    echo    "Add Python to PATH" ou "Ajouter Python au PATH"
    echo 4. Redémarrez votre ordinateur après l'installation
    echo 5. Relancez ce script
    echo.
    echo 💡 Si Python est déjà installé:
    echo    - Redémarrez votre ordinateur
    echo    - Ou ajoutez Python au PATH manuellement
    echo.
    pause
    exit /b 1
)

echo Python détecté: 
python --version

REM Create virtual environment if it doesn't exist
if not exist "venv" (
    echo.
    echo Création de l'environnement virtuel...
    python -m venv venv
)

REM Activate virtual environment
echo.
echo Activation de l'environnement virtuel...
call venv\Scripts\activate.bat

REM Upgrade pip
echo.
echo Mise à jour de pip...
python -m pip install --upgrade pip

REM Install requirements
echo.
echo Installation des dépendances...
pip install -r requirements_windows.txt

echo.
echo ====================================
echo   Configuration terminée avec succès!
echo ====================================
echo.
echo Vous pouvez maintenant lancer l'application avec "launch_esg_app.bat"
echo.
pause