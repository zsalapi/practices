#!/bin/bash
sudo apt-get purge 'libreoffice-l10n-*'
sudo apt-get purge 'hunspell-*'
sudo apt-get install libreoffice-l10n-hu
sudo apt-get install libreoffice-l10n-en-gb
sudo apt-get install hunspell-hu
sudo apt-get install hunspell-en-us hunspell-en-gb
