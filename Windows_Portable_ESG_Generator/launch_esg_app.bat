@echo off
title Générateur ESG - Application Streamlit

REM Check if virtual environment exists
if not exist "venv" (
    echo.
    echo ERREUR: Environnement virtuel non trouvé!
    echo Veuillez d'abord exécuter "setup_windows.bat" pour configurer l'application.
    echo.
    pause
    exit /b 1
)

echo ====================================
echo      GENERATEUR ESG - Démarrage
echo ====================================
echo.

REM Activate virtual environment
echo Activation de l'environnement virtuel...
call venv\Scripts\activate.bat

REM Check if streamlit is installed
python -c "import streamlit" >nul 2>&1
if errorlevel 1 (
    echo ERREUR: Streamlit n'est pas installé!
    echo Veuillez exécuter "setup_windows.bat" pour installer les dépendances.
    echo.
    pause
    exit /b 1
)

echo.
echo Démarrage de l'application ESG...
echo L'application va s'ouvrir dans votre navigateur par défaut.
echo.
echo URL: http://localhost:8501
echo.
echo Pour arrêter l'application, fermez cette fenêtre ou appuyez sur Ctrl+C
echo.

REM Start Streamlit and open browser
start "" http://localhost:8501
streamlit run app.py --server.port 8501 --server.address localhost

echo.
echo Application arrêtée.
pause