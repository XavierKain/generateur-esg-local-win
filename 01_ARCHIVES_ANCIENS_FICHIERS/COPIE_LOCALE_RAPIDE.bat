@echo off
chcp 65001 >nul
title Copie Locale Rapide

echo ==========================================
echo    COPIE LOCALE RAPIDE - POUR TEST
echo ==========================================
echo.

set /p "destination=Entrez le chemin de destination (ex: C:\temp\esg): "

echo.
echo Creation du dossier de destination...
mkdir "%destination%" 2>nul

echo Copie des fichiers essentiels uniquement...
echo.

echo [1/6] Copie de Python portable...
xcopy /E /I /Y "python311" "%destination%\python311\"

echo [2/6] Copie des scripts de lancement...
copy /Y "LANCER_ESG.bat" "%destination%\"
copy /Y "LANCER_ESG_SILENT.bat" "%destination%\"
copy /Y "TEST_STREAMLIT.bat" "%destination%\"
copy /Y "DIAGNOSTIC.bat" "%destination%\"

echo [3/6] Copie de l'application...
copy /Y "app.py" "%destination%\"
copy /Y "xlwings_generator.py" "%destination%\"
copy /Y "generateur_2025_streamlit.py" "%destination%\"

echo [4/6] Copie de la documentation...
copy /Y "README.txt" "%destination%\"

echo.
echo ==========================================
echo         COPIE TERMINEE
echo ==========================================
echo.
echo Dossier cree: %destination%
echo.
echo ETAPES SUIVANTES:
echo 1. Allez dans %destination%
echo 2. Lancez TEST_STREAMLIT.bat pour diagnostiquer
echo 3. Si OK, lancez LANCER_ESG.bat
echo.
pause