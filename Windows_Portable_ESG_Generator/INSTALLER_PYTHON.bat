@echo off
title Installation Python - Générateur ESG

echo ===========================================
echo   GÉNÉRATEUR ESG - Installation Python
echo ===========================================
echo.
echo Ce script va vous guider pour installer Python correctement.
echo.
echo 📋 ÉTAPES À SUIVRE:
echo.
echo 1. Ce script va ouvrir la page de téléchargement Python
echo 2. Téléchargez la version recommandée (3.11 ou plus récent)
echo 3. Lancez l'installateur téléchargé
echo 4. IMPORTANT: Cochez "Add Python to PATH"
echo 5. Suivez l'installation standard
echo 6. Redémarrez votre ordinateur
echo 7. Relancez DEMARRER_ESG.bat
echo.
echo ⚠️  TRÈS IMPORTANT: 
echo    Pendant l'installation, cochez absolument
echo    "Add Python to PATH" (première option)
echo.

set /p "continue=Appuyez sur ENTRÉE pour ouvrir le site Python..."

echo.
echo Ouverture de https://python.org/downloads/...
start "" "https://python.org/downloads/"

echo.
echo ===========================================
echo            APRÈS L'INSTALLATION
echo ===========================================
echo.
echo 1. Redémarrez votre ordinateur
echo 2. Double-cliquez sur "DEMARRER_ESG.bat"
echo.
echo Si vous avez des problèmes:
echo → Utilisez "diagnostic_windows.bat" pour vérifier
echo.
pause