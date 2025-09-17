@echo off
chcp 65001 >nul

REM Lancement invisible - Version client propre
REM Set working directory to script location
cd /d "%~dp0"

REM Start Streamlit en mode totalement invisible
start /min "" "%CD%\python311\python.exe" -m streamlit run app.py --server.headless true --server.port 8501 --server.address localhost

REM Attendre que le serveur soit pret (10 secondes pour etre sur)
timeout /t 10 /nobreak >nul 2>nul

REM Ouvrir le navigateur automatiquement
start "" "http://localhost:8501"

REM Ce script se ferme automatiquement apres l'ouverture du navigateur
exit