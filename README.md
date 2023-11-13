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

How to export Windows package lists:
```ps1
choco export -o=".\chocolatey-packages.xml" --allowunofficial
choco export -o=".\chocolatey-packages.xml" --include-version-numbers --allowunofficial
winget export -o .\winget.json
winget export -o .\winget.json --include-versions
```

How to import Windows package lists:
```ps1
# N.B. TortoiseSVN does not include its command-line tools by default;
# either fix it in appwiz.cpl or run:
winget install TortoiseSVN.TortoiseSVN --custom "ADDLOCAL=ALL"
# The rest are straightforward:
winget import -i .\winget.json
choco install .\chocolatey.xml.config  # must end in .config
```
