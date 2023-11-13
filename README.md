# Personal set of configuration files

Usage:
```sh
git clone https://github.com/jstarkman/jas-config-files
jas-config-files/set-config-files
. ~/.bashrc # and refresh/restart other programs as needed
```

This is a collection of scripts, tools, and libraries that I find
useful to have on new systems.

Visual Studio Code extensions with any POSIX shell:
```sh
xargs -L 1 code --install-extension < ./vscode-extensions.txt
```

Visual Studio Code extensions with Powershell:
```ps1
gc .\vscode-extensions.txt | % { code.exe --install-extension $_ }
```
