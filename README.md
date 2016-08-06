# Personal set of configuration files

## Bash

Put this in the main ~/.bashrc (or ~/.bash_profile).  It will
automatically load the aliases.

```bash
source ~/jas-config-files/.bashrc 
```

## Emacs

Everything is under `disembodied_emacs_config`, including the dotfile.

Put this in the main ~/.emacs:

```elisp
(load "~/jas-config-files/disembodied_emacs_config/.emacs")
```

## Vim

Put this in the main ~/.vimrc:

```vimrc
source ~/jas-config-files/.vimrc
```

