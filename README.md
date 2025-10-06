You can use these for development, It can be useful - It's Free Software for everyone.

If you install a Debian system (I used Debian Trixe) you can find useful scripts in the install directory!
I used these in my home lab, you can modify of course to your needs.

After you install Debian and NVM You have to setup Node.js for Emacs:
nvm install 18.20.8 && nvm use 18.20.8

You need few Node.js packages: (NOT use sudo for these, not necessary to give root priviledges)<br>
 npm install -g typescript typescript-language-server<br>
 npm install -g vscode-langservers-extracted<br>
Python lisp:<br>
 npm install -g pyright semgrep<br>



You need install phpactor for Emacs in your home directory:
composer install

You have to change zsolt in ./.emacs.d/init.el to your username!
