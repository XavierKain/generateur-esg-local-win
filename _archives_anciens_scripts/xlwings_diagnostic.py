#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Diagnostic détaillé pour XLWings et Excel sur Windows
"""

import sys
import os
import platform
import subprocess
import tempfile
from pathlib import Path

def log_step(step, message):
    """Logger avec numérotation"""
    print(f"[{step}] {message}")

def diagnostic_xlwings_complet():
    """Diagnostic complet de XLWings et Excel"""
    
    print("=" * 60)
    print("DIAGNOSTIC XLWINGS DÉTAILLÉ")
    print("=" * 60)
    
    # 1. Informations système
    log_step("1", "Informations système:")
    print(f"    OS: {platform.system()} {platform.release()}")
    print(f"    Python: {platform.python_version()}")
    print(f"    Architecture: {platform.architecture()}")
    print(f"    Répertoire courant: {os.getcwd()}")
    
    # 2. Test import XLWings
    log_step("2", "Test import XLWings...")
    try:
        import xlwings as xw
        print(f"    ✅ XLWings importé - Version: {xw.__version__}")
    except ImportError as e:
        print(f"    ❌ Erreur import XLWings: {e}")
        return False
    except Exception as e:
        print(f"    ❌ Erreur inattendue: {e}")
        return False
    
    # 3. Détection Excel
    log_step("3", "Détection d'Excel...")
    
    # 3a. Via processus
    try:
        result = subprocess.run(['tasklist', '/FI', 'IMAGENAME eq excel.exe'], 
                              capture_output=True, text=True, timeout=10)
        if 'excel.exe' in result.stdout.lower():
            print("    ✅ Excel détecté en cours d'exécution")
        else:
            print("    ⚠️  Excel non détecté en cours d'exécution")
    except Exception as e:
        print(f"    ❌ Erreur détection processus: {e}")
    
    # 3b. Via registre Windows
    try:
        import winreg
        key = winreg.OpenKey(winreg.HKEY_LOCAL_MACHINE, 
                           r"SOFTWARE\Microsoft\Office\ClickToRun\Configuration")
        version = winreg.QueryValueEx(key, "VersionToReport")[0]
        print(f"    ✅ Excel installé - Version: {version}")
        winreg.CloseKey(key)
    except Exception as e:
        print(f"    ⚠️  Registre Office: {e}")
        
        # Fallback - ancien chemin registre
        try:
            key = winreg.OpenKey(winreg.HKEY_LOCAL_MACHINE, 
                               r"SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\excel.exe")
            path = winreg.QueryValueEx(key, "")[0]
            print(f"    ✅ Excel trouvé dans: {path}")
            winreg.CloseKey(key)
        except Exception as e2:
            print(f"    ❌ Excel non trouvé dans le registre: {e2}")
    
    # 4. Test COM Excel
    log_step("4", "Test COM Excel...")
    try:
        import win32com.client
        xl = win32com.client.Dispatch('Excel.Application')
        print(f"    ✅ COM Excel OK - Version: {xl.Version}")
        xl.Quit()
        del xl
    except ImportError:
        print("    ❌ win32com non disponible")
    except Exception as e:
        print(f"    ❌ Erreur COM Excel: {e}")
    
    # 5. Test XLWings Apps
    log_step("5", "Test XLWings Apps...")
    try:
        print(f"    Apps disponibles: {xw.apps}")
        print(f"    Type apps: {type(xw.apps)}")
        if xw.apps is None:
            print("    ❌ xw.apps est None - Problème critique!")
            return False
        else:
            print(f"    ✅ xw.apps initialisé: {len(xw.apps)} applications")
    except Exception as e:
        print(f"    ❌ Erreur xw.apps: {e}")
        return False
    
    # 6. Test création App
    log_step("6", "Test création App XLWings...")
    app = None
    try:
        print("    Tentative 1: App(visible=False)")
        app = xw.App(visible=False)
        print(f"    ✅ App créée: {app}")
        
        print("    Test books...")
        print(f"    Books: {app.books}")
        
        print("    Fermeture app...")
        app.quit()
        print("    ✅ App fermée avec succès")
        
    except Exception as e:
        print(f"    ❌ Erreur création App: {e}")
        print(f"    Type erreur: {type(e)}")
        print(f"    Args: {e.args}")
        
        # Nettoyage si nécessaire
        if app:
            try:
                app.quit()
            except:
                pass
        
        # Tentative alternative
        try:
            print("    Tentative 2: App(visible=False, add_book=False)")
            app2 = xw.App(visible=False, add_book=False)
            print(f"    ✅ App2 créée: {app2}")
            app2.quit()
            print("    ✅ App2 fermée")
        except Exception as e2:
            print(f"    ❌ Tentative 2 échouée: {e2}")
            return False
    
    # 7. Test répertoire temporaire
    log_step("7", "Test répertoire temporaire...")
    temp_dir = Path(tempfile.gettempdir()) / "xlwings_test"
    try:
        temp_dir.mkdir(exist_ok=True)
        test_file = temp_dir / "test.txt"
        test_file.write_text("test")
        test_file.unlink()
        print(f"    ✅ Répertoire temporaire OK: {temp_dir}")
    except Exception as e:
        print(f"    ❌ Problème répertoire temporaire: {e}")
    
    print("\n" + "=" * 60)
    print("DIAGNOSTIC TERMINÉ")
    print("=" * 60)
    return True

if __name__ == "__main__":
    diagnostic_xlwings_complet()