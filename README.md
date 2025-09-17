# 🏭 Générateur ESG - Version Portable Windows

![Version](https://img.shields.io/badge/version-2025.1-blue.svg)
![Python](https://img.shields.io/badge/python-3.11-green.svg)
![XLWings](https://img.shields.io/badge/xlwings-exclusive-orange.svg)
![Platform](https://img.shields.io/badge/platform-Windows%2011-lightgrey.svg)

Application Streamlit portable pour la génération de questionnaires ESG avec formatage conditionnel Excel préservé.

## ✨ Fonctionnalités

- 🎯 **Mode XLWings Exclusif** - Formatage conditionnel Excel garanti
- 💼 **100% Portable** - Aucune installation requise sur la machine cible
- 🔍 **Recherche intelligente** - Filtre par identifiant, locataire ou adresse
- 📊 **Interface intuitive** - Sélection en masse et individuelle
- 🚀 **Démarrage rapide** - Double-clic et ça marche

## 🎯 Prérequis

- **Windows 11** (ou Windows 10)
- **Microsoft Excel** installé (2016+)
- Aucune autre installation requise !

## 🚀 Installation

1. **Télécharger** le package `ESG_Generator_Portable_FINAL_v2025.zip`
2. **Extraire** le contenu dans un dossier (ex: `C:\ESG_Generator`)
3. **Double-cliquer** sur `LANCER_ESG.bat`
4. L'application s'ouvre automatiquement dans votre navigateur

## 📋 Utilisation

### Étape 1 : Upload des fichiers
- **Base de données** (.xlsx) avec les propriétés
- **Template** (.xlsx) du questionnaire ESG

### Étape 2 : Sélection et recherche
- Choisir l'année
- Utiliser la barre de recherche pour filtrer
- Sélectionner les questionnaires à générer

### Étape 3 : Génération
- Cliquer sur "Générer"
- Télécharger le zip avec tous les questionnaires

## 🔧 Architecture Technique

```
ESG_Generator_Portable_Complete/
├── app.py                      # Interface Streamlit
├── generateur_2025_streamlit.py # Moteur de génération
├── xlwings_generator.py        # Module XLWings
├── config_portable.py          # Configuration portable
├── python311/                  # Python 3.11 + dépendances
│   ├── Lib/site-packages/     # Toutes les libs incluses
│   └── DLLs/                  # PyWin32 pré-installé
├── LANCER_ESG.bat             # Lanceur principal
└── README_DISTRIBUTION.txt     # Guide utilisateur
```

## 🎨 Technologies

- **Python 3.11** - Embedded/Portable
- **Streamlit** - Interface web moderne
- **XLWings** - Automation Excel avec formatage
- **PyWin32** - Communication COM Windows
- **Pandas** - Manipulation de données
- **OpenPyXL** - Lecture Excel (backup)

## 📊 Formats supportés

### Entrée
- **Base de données** : `.xlsx` avec colonnes standardisées
- **Template** : `.xlsx` avec formatage conditionnel

### Sortie
- **Questionnaires** : `.xlsx` individuels avec formatage préservé
- **Archive** : `.zip` contenant tous les questionnaires

## 🛠️ Diagnostic

Si l'application ne fonctionne pas :

1. **Tester PyWin32** : Lancer `TEST_PYWIN32_INTEGRE.bat`
2. **Vérifier Excel** : S'assurer qu'Excel est installé
3. **Consulter les logs** : Dans les scripts de diagnostic

## 🏆 Avantages vs autres solutions

| Fonctionnalité | ESG Generator | Excel manuel | Autres outils |
|----------------|---------------|--------------|---------------|
| Formatage conditionnel | ✅ Préservé | ⚠️ Fastidieux | ❌ Perdu |
| Installation | ✅ Portable | ✅ N/A | ❌ Complexe |
| Interface | ✅ Moderne | ❌ Basique | ⚠️ Variable |
| Recherche/Filtre | ✅ Intégrée | ❌ Manuelle | ⚠️ Limitée |
| Traitement en masse | ✅ Automatique | ❌ Un par un | ⚠️ Variable |

## 📝 Changelog

### v2025.1 (Version finale)
- ✅ PyWin32 intégré dans l'environnement portable
- ✅ Barre de recherche intelligente intégrée
- ✅ Interface épurée (suppression des détails techniques)
- ✅ Mode XLWings exclusif
- ✅ Package de distribution complet (109 MB)

### v2024.x (Versions précédentes)
- 🔧 Résolution des problèmes PyWin32
- 🔧 Correction des erreurs de dépendances
- 🔧 Amélioration de la compatibilité Windows

## 📞 Support

Pour toute question ou problème :

1. Consulter `README_DISTRIBUTION.txt`
2. Lancer les scripts de diagnostic
3. Vérifier les logs dans `_archives_anciens_scripts/`

## 👨‍💻 Auteur

**XavierKain** - Développeur principal et créateur du projet

## 📄 Licence

Projet développé pour usage interne. Tous droits réservés.

---

🎉 **Application prête pour production et distribution client !**