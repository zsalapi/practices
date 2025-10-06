#!/bin/bash

# Ellenőrizze, hogy root joggal fut-e (telepítéshez szükséges lehet)
#if [[ $EUID -ne 0 ]]; then
#  echo "Kérlek rootként futtasd ezt a scriptet (sudo $0)"
#  exit 1
#fi


echo "Kiegészítők (extensions) telepítése..."

# PHP & Laravel
code --install-extension felixfbecker.php-intellisense         # PHP intelligens kiegészítés
code --install-extension bmewburn.vscode-intelephense-client    # PHP Intelephense (erősebb elemzés)
code --install-extension neilbrayfield.php-docblocker           # PHPDoc generálás
code --install-extension mehedidracula.php-namespace-resolver   # PHP namespace importálás
code --install-extension onecentlin.laravel-blade               # Blade syntax kiemelés
code --install-extension amiralizadeh9480.laravel-extra-intellisense # Laravel extra Intellisense

# Web: HTML, CSS, JS, TS, jQuery, React
code --install-extension dbaeumer.vscode-eslint                 # JS/TS lintelés
code --install-extension esbenp.prettier-vscode                 # Kódformázás
code --install-extension ms-vscode.vscode-typescript-next       # TS fejlesztés
code --install-extension msjsdiag.debugger-for-chrome           # Chrome debugger
code --install-extension ritwickdey.liveserver                  # Live Server HTML fejlesztéshez
code --install-extension xabikos.javascriptsnippets             # JS snippetek
code --install-extension eg2.vscode-npm-script                  # npm script támogatás
code --install-extension dsznajder.es7-react-js-snippets        # React snippetek

# Python
code --install-extension ms-python.python                       # Hivatalos Python támogatás
code --install-extension ms-python.vscode-pylance               # Pylance - gyorsabb elemzés

# Git & Docker
code --install-extension ms-azuretools.vscode-docker            # Docker támogatás
code --install-extension eamodio.gitlens                        # GitLens - Git history stb.

# Általános eszközök
code --install-extension editorconfig.editorconfig              # EditorConfig támogatás
code --install-extension usernamehw.errorlens                   # Hibák kiemelése inline
code --install-extension oderwat.indent-rainbow                # Behúzások vizualizálása

echo "VS Code alap beállítások frissítése..."

CONFIG_DIR="$HOME/.vscode"

cat << 'EOF' > "$CONFIG_DIR/settings.json"
{
  "editor.formatOnSave": true,
  "editor.tabSize": 4,
  "editor.detectIndentation": false,
  "files.autoSave": "onWindowChange",
  "files.trimTrailingWhitespace": true,
  "php.validate.executablePath": "/usr/bin/php",
  "intelephense.environment.phpVersion": "8.1",
  "intelephense.diagnostics.enable": true,
  "intelephense.files.maxSize": 5000000,
  "intelephense.telemetry.enabled": false,
  "telemetry.enableTelemetry": false,
  "telemetry.enableCrashReporter": false,
  "workbench.iconTheme": "vs-seti",
  "workbench.colorTheme": "Default Dark+"
}
EOF

echo "Kész! VS Code telepítve és beállítva PHP / Laravel / Web / Python fejlesztéshez."
echo "Indítsd el a VS Code-ot: code"
