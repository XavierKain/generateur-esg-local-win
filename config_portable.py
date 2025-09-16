#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Configuration pour l'environnement portable Windows
"""

import os
import sys

# Configuration pour l'environnement XLWings exclusif
# Plus de mode portable - XLWings obligatoire
FORCE_OPENPYXL = False  # XLWings autorisé
PORTABLE_MODE = False   # Mode portable désactivé - XLWings requis

def is_excel_available():
    """
    Vérifie si Excel est disponible sur le système
    Teste réellement la présence d'Excel même en mode portable
    """
    if FORCE_OPENPYXL:
        return False
    
    try:
        import xlwings as xw
        # Test d'accès à Excel
        app = xw.App(visible=False)
        app.quit()
        return True
    except Exception:
        return False

def get_recommended_generator():
    """
    Retourne le générateur recommandé selon l'environnement
    """
    if FORCE_OPENPYXL or not is_excel_available():
        return "openpyxl"
    else:
        return "xlwings"

def setup_portable_environment():
    """
    Configure l'environnement pour le mode portable
    """
    # Désactive les fonctionnalités qui nécessitent Excel
    os.environ['XLWINGS_LICENSE_KEY'] = ''
    os.environ['PYTHONPATH'] = os.getcwd()
    
    # Configuration pour éviter les erreurs XLWings
    try:
        import xlwings
        # Désactive l'auto-ouverture d'Excel
        xlwings.App.impl = None
    except ImportError:
        pass

if __name__ == "__main__":
    print(f"Mode portable: {PORTABLE_MODE}")
    print(f"Excel disponible: {is_excel_available()}")
    print(f"Générateur recommandé: {get_recommended_generator()}")