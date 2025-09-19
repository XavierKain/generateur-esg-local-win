# Générateur ESG - Version Portable Windows 11

## 🚀 Installation et Utilisation Rapide

### Prérequis
- **Windows 11** (ou Windows 10)
- **Python 3.8+** installé sur votre système
  - Si Python n'est pas installé, téléchargez-le depuis [python.org](https://www.python.org/downloads/)
  - **IMPORTANT**: Lors de l'installation, cochez "Add Python to PATH"

### Installation en 2 étapes

1. **Configuration initiale** (à faire une seule fois)
   - Double-cliquez sur `setup_windows.bat`
   - Attendez que l'installation se termine

2. **Lancement de l'application**
   - Double-cliquez sur `launch_esg_app.bat`
   - L'application s'ouvrira automatiquement dans votre navigateur

## 📁 Structure du dossier

```
Windows_Portable_ESG_Generator/
├── setup_windows.bat          # Script de configuration initiale
├── launch_esg_app.bat         # Script de lancement de l'application
├── app.py                     # Application principale
├── requirements_windows.txt   # Dépendances Python
├── venv/                      # Environnement virtuel (créé après setup)
└── [autres fichiers de l'application]
```

## 🖥️ Utilisation

### Première utilisation
1. Exécutez `setup_windows.bat` (une seule fois)
2. Lancez `launch_esg_app.bat`
3. L'application s'ouvre à l'adresse: http://localhost:8501

### Utilisations suivantes
- Double-cliquez simplement sur `launch_esg_app.bat`

## ⚠️ Résolution des problèmes courants

### Python non trouvé
- Vérifiez que Python est installé
- Vérifiez que Python est dans le PATH système
- Relancez `setup_windows.bat`

### Erreur de dépendances
- Supprimez le dossier `venv`
- Relancez `setup_windows.bat`

### L'application ne s'ouvre pas dans le navigateur
- Ouvrez manuellement: http://localhost:8501
- Vérifiez qu'aucun antivirus ne bloque l'application

## 📋 Fonctionnalités

Cette application permet de :
- Générer des questionnaires ESG automatiquement
- Traiter des bases de données Excel
- Exporter les résultats en format ZIP
- Interface web intuitive avec Streamlit

## 🔧 Support Technique

En cas de problème :
1. Vérifiez que Python 3.8+ est installé
2. Vérifiez que tous les fichiers sont présents
3. Relancez la configuration avec `setup_windows.bat`

---

**Version**: ESG Generator v2.0 - Windows Portable Edition
**Compatible**: Windows 10/11 + Python 3.8+