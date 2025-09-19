#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Configuration spécifique pour Windows
"""

import os
import platform
import tempfile
from pathlib import Path

def get_system_info():
    """Retourne les informations système"""
    return {
        'platform': platform.system(),
        'platform_release': platform.release(),
        'platform_version': platform.version(),
        'python_version': platform.python_version()
    }

def get_temp_directory():
    """Retourne le répertoire temporaire système"""
    return tempfile.gettempdir()

def ensure_directory_exists(path):
    """S'assurer qu'un répertoire existe"""
    try:
        Path(path).mkdir(parents=True, exist_ok=True)
        return True
    except Exception as e:
        print(f"Erreur lors de la création du répertoire {path}: {e}")
        return False

def is_windows():
    """Vérifie si on est sur Windows"""
    return platform.system().lower() == 'windows'

def get_downloads_folder():
    """Retourne le dossier Downloads/Téléchargements de l'utilisateur"""
    if is_windows():
        # Windows
        downloads = Path.home() / "Downloads"
        if downloads.exists():
            return str(downloads)
        # Fallback français
        downloads_fr = Path.home() / "Téléchargements"
        if downloads_fr.exists():
            return str(downloads_fr)
    
    # Fallback vers temp
    return get_temp_directory()

def normalize_path(path):
    """Normalise un chemin pour Windows"""
    if is_windows():
        return str(Path(path).resolve())
    return path

# Configuration par défaut
DEFAULT_CONFIG = {
    'temp_dir': get_temp_directory(),
    'downloads_dir': get_downloads_folder(),
    'max_file_size': 50 * 1024 * 1024,  # 50MB
    'allowed_extensions': ['.xlsx', '.xlsm', '.csv'],
    'streamlit_port': 8501,
    'streamlit_host': 'localhost'
}

if __name__ == "__main__":
    print("Configuration Windows:")
    print(f"- Système: {get_system_info()}")
    print(f"- Répertoire temporaire: {get_temp_directory()}")
    print(f"- Dossier téléchargements: {get_downloads_folder()}")
    print(f"- Est Windows: {is_windows()}")