================================================================================
                    GÉNÉRATEUR ESG - VERSION PORTABLE WINDOWS
                              🎯 MODE XLWINGS EXCLUSIF
================================================================================

📦 VERSION : Portable Complète avec PyWin32 Intégré
📅 DATE : 16 Septembre 2025
🎯 CIBLE : Windows 11 avec Excel installé

================================================================================
                              🚀 INSTALLATION
================================================================================

1️⃣ **EXTRACTION**
   → Extrayez ce dossier zip sur votre PC Windows
   → Emplacement recommandé : C:\ESG_Generator_Portable_Complete

2️⃣ **LANCEMENT IMMÉDIAT**
   → Double-cliquez sur "LANCER_ESG.bat"
   → L'application s'ouvre automatiquement dans votre navigateur
   → URL : http://localhost:8501

3️⃣ **VÉRIFICATION**
   → L'interface doit afficher "🎯 Mode XLWings Exclusif"
   → Si vous voyez ce message, tout fonctionne parfaitement !

================================================================================
                              📋 FICHIERS PRINCIPAUX
================================================================================

🎯 **LANCEMENT**
   LANCER_ESG.bat              → Lance l'application (recommandé)
   LANCER_ESG_SILENT.bat       → Lance en mode silencieux

🔧 **TESTS & DIAGNOSTIC**  
   TEST_PYWIN32_INTEGRE.bat    → Teste PyWin32 portable
   TEST_STREAMLIT.bat          → Teste juste Streamlit

📁 **APPLICATION**
   app.py                      → Interface Streamlit
   generateur_2025_streamlit.py → Générateur de questionnaires
   xlwings_generator.py        → Module XLWings
   config_portable.py          → Configuration portable

📁 **PYTHON PORTABLE**
   python311/                  → Python 3.11 + toutes dépendances
                               → Inclut PyWin32 pré-installé

================================================================================
                              ✅ FONCTIONNALITÉS
================================================================================

🎯 **GÉNÉRATION EXCEL**
   → Questionnaires ESG complets avec formatage conditionnel
   → Utilise XLWings exclusivement (pas OpenPyXL)
   → Préserve tous les styles et formules Excel

📊 **TYPES DE QUESTIONNAIRES**
   → Questionnaire Standard (20 questions)
   → Questionnaire Avancé (50 questions)  
   → Questionnaire Expert (100 questions)

🔧 **MODE PORTABLE**
   → Aucune installation requise
   → Python 3.11 + toutes dépendances incluses
   → PyWin32 pré-configuré pour Excel COM
   → Fonctionne hors ligne

================================================================================
                              🛠️ DÉPANNAGE
================================================================================

❌ **Si l'application ne démarre pas :**
   1. Vérifiez que vous êtes sur Windows
   2. Assurez-vous qu'Excel est installé
   3. Lancez TEST_PYWIN32_INTEGRE.bat pour diagnostiquer

❌ **Si vous voyez "Mode Portable OpenPyXL" :**
   → Ce mode n'est plus utilisé - contactez le support

❌ **Si erreur XLWings :**
   → Consultez _archives_anciens_scripts/RESOLUTION_XLWINGS_FINALE.txt

📞 **Support :**
   → Tous les scripts de diagnostic sont dans _archives_anciens_scripts/

================================================================================
                              🎉 AVANTAGES VERSION FINALE
================================================================================

✅ **100% Portable** - Aucune installation sur la machine cible
✅ **PyWin32 Intégré** - Plus d'erreurs de dépendances manquantes  
✅ **XLWings Exclusif** - Formatage conditionnel garanti
✅ **Plug & Play** - Double-clic et ça marche
✅ **Offline** - Fonctionne sans internet
✅ **Compatible** - Windows 11 + Excel 2016+

================================================================================
                            📋 NOTES TECHNIQUES
================================================================================

🔧 **Architecture :**
   → Python 3.11.9 Embedded
   → Streamlit 1.x pour l'interface web
   → XLWings pour automation Excel  
   → PyWin32 pour COM Windows

⚙️ **Configuration :**
   → FORCE_OPENPYXL = False (XLWings obligatoire)
   → PORTABLE_MODE = False (Mode production)
   → Port par défaut : 8501

📁 **Taille totale :** ~150MB (Python + dépendances + PyWin32)

================================================================================
Cette version est prête pour distribution client - tout est inclus et testé !
================================================================================