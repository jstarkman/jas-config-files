# Personal set of configuration files

Usage:
```sh
git clone https://github.com/jstarkman/jas-config-files
jas-config-files/set-config-files
. ~/.bashrc # and refresh/restart other programs as needed
```

This is a collection of scripts, tools, and libraries that I find
useful to have on new systems.


## Visual Studio Code

### POSIX
```sh
cd ~/jas-config-files
cp ./.config/Code/User/keybindings.json ~/.config/Code/User/
cp ./.config/Code/User/settings.json    ~/.config/Code/User/
xargs -L 1 code --install-extension < ./vscode-extensions.txt
```

### Windows with Powershell
```ps1
cd "$HOME\jas-config-files"
copy .\.config\Code\User\keybindings.json ..\AppData\Roaming\Code\User\
copy .\.config\Code\User\settings.json    ..\AppData\Roaming\Code\User\
gc .\packages\vscode-extensions.txt | % { code.exe --install-extension $_ }
```


## Windows package lists

### Export
```ps1
cd "$HOME\jas-config-files\packages"
choco export -o=".\chocolatey-packages.xml" --allowunofficial
choco export -o=".\chocolatey-packages.xml" --include-version-numbers --allowunofficial
winget export -o .\winget.json
winget export -o .\winget.json --include-versions
# Then, for consistency in source control:
# (N.B. This is not a UUOC in Powershell; using < gives an error.)
gc .\winget.json | jq --tab '(.Sources[] | .Packages) |= sort_by(.PackageIdentifier)' > winget-foo.json
```

### Import
```ps1
# N.B. TortoiseSVN does not include its command-line tools by default;
# either fix it in appwiz.cpl or run:
winget install TortoiseSVN.TortoiseSVN --custom "ADDLOCAL=ALL"
# The rest are straightforward:
winget import -i .\winget.json
choco install .\chocolatey.xml.config  # must end in .config
```


## Windows cmd.exe aliases
*N.B. Doskey aliases have many drawbacks; these will not work from scripts.*

Installation into cmd.exe:
```bat
reg add "HKCU\Software\Microsoft\Command Processor" /v Autorun /d "doskey /macrofile=\"%USERPROFILE%\jas-config-files\alias.cmd\"" /f
```
