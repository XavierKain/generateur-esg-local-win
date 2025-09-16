@echo off
chcp 65001 >nul
title Mise a Jour Application Seulement

echo ==========================================
echo    MISE A JOUR APPLICATION SEULEMENT
echo ==========================================
echo.

set /p "destination=Entrez le chemin du dossier local existant: "

if not exist "%destination%" (
    echo ERREUR: Le dossier %destination% n'existe pas
    echo Utilisez d'abord COPIE_LOCALE_RAPIDE.bat
    pause
    exit /b 1
)

echo.
echo Mise a jour des fichiers application uniquement...
echo.

echo [1/3] Mise a jour des scripts CORRIGES...
copy /Y "LANCER_ESG.bat" "%destination%\"
copy /Y "LANCER_ESG_SILENT.bat" "%destination%\"
copy /Y "TEST_STREAMLIT.bat" "%destination%\"
copy /Y "DIAGNOSTIC.bat" "%destination%\"

echo [2/3] Mise a jour de l'application Python...
copy /Y "app.py" "%destination%\"
copy /Y "xlwings_generator.py" "%destination%\"
copy /Y "generateur_2025_streamlit.py" "%destination%\"

echo [3/3] Mise a jour documentation...
copy /Y "README.txt" "%destination%\"

echo.
echo ==========================================
echo      MISE A JOUR TERMINEE
echo ==========================================
echo.
echo IMPORTANT: Les scripts ont ete CORRIGES
echo - Probleme de repertoire de travail resolu
echo - Chemins absolus utilises
echo - Verification des fichiers ajoutee
echo.
echo Les fichiers ont ete copies vers: %destination%
echo Python portable n'a pas ete recopie (plus rapide)
echo.
echo Vous pouvez maintenant tester LANCER_ESG.bat !
echo.
pause