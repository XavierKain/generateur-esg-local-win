================================================================================
                    OUTILS DE DEBUG - GÉNÉRATEUR ESG
================================================================================

🔧 DOSSIER POUR DÉVELOPPEURS ET SUPPORT TECHNIQUE
📅 VERSION : Optimisation 2025
🎯 USAGE : Diagnostic et résolution de problèmes

================================================================================
                              📋 OUTILS DISPONIBLES
================================================================================

🔍 **DIAGNOSTIC_COMPLET.bat**
→ Test complet de tous les composants
→ Vérifie Python, modules, XLWings, Excel COM
→ Résultat en temps réel dans la console
→ Usage : Double-clic pour diagnostic rapide

📊 **LOGS_DETAILLES.bat**
→ Génère des logs ultra-détaillés
→ Sauvegarde dans logs_debug.txt
→ Informations système complètes
→ Usage : Pour support technique avancé

✅ **TEST_PYWIN32_INTEGRE.bat**
→ Test spécifique PyWin32 portable
→ Vérifie les DLL et modules COM
→ Test connexion Excel
→ Usage : Si problème XLWings spécifiquement

🌐 **TEST_STREAMLIT.bat**
→ Test interface Streamlit uniquement
→ Vérifie le démarrage web
→ Sans test Excel/XLWings
→ Usage : Si problème d'interface

================================================================================
                              🚨 PROCÉDURE DE DEBUG
================================================================================

**PROBLÈME SIGNALÉ PAR CLIENT :**

1️⃣ **Diagnostic Initial**
   → Lancer DIAGNOSTIC_COMPLET.bat
   → Noter tous les ❌ et ⚠️
   → Prendre screenshot si nécessaire

2️⃣ **Logs Détaillés** (si problème persiste)
   → Lancer LOGS_DETAILLES.bat
   → Récupérer le fichier logs_debug.txt
   → Analyser les erreurs Python

3️⃣ **Tests Spécifiques**
   → TEST_PYWIN32_INTEGRE.bat pour problèmes XLWings
   → TEST_STREAMLIT.bat pour problèmes interface
   → Selon les symptômes observés

4️⃣ **Analyse et Résolution**
   → Comparer avec environnement de référence
   → Identifier les différences système
   → Proposer corrections ciblées

================================================================================
                              🔧 PROBLÈMES FRÉQUENTS
================================================================================

❌ **"Make sure to have pywin32 installed"**
→ Lancer TEST_PYWIN32_INTEGRE.bat
→ Vérifier DLL dans python311/DLLs/
→ Problème : PyWin32 mal intégré

❌ **"Excel non accessible via xlwings"**
→ Vérifier installation Excel (version complète)
→ Tester droits administrateur
→ Problème : COM Excel bloqué

❌ **Interface Streamlit ne s'ouvre pas**
→ Lancer TEST_STREAMLIT.bat
→ Vérifier port 8501 libre
→ Problème : Conflit réseau/firewall

❌ **Modules Python manquants**
→ Vérifier intégrité python311/
→ Comparer avec version de référence
→ Problème : Environnement corrompu

================================================================================
                              📞 SUPPORT AVANCÉ
================================================================================

**POUR REMONTER UN BUG :**

📎 **Fichiers à fournir :**
→ logs_debug.txt (via LOGS_DETAILLES.bat)
→ Screenshot des erreurs
→ Version Windows + Excel

📋 **Informations contexte :**
→ Moment d'apparition du problème
→ Actions utilisateur avant l'erreur
→ Reproductibilité (toujours/parfois/jamais)

🔧 **Tests de validation :**
→ Résultat DIAGNOSTIC_COMPLET.bat
→ Test sur machine similaire
→ Comparaison avec version fonctionnelle

================================================================================
Ces outils permettent de diagnostiquer 95% des problèmes terrain.
Pour les 5% restants, escalade vers développement principal.
================================================================================