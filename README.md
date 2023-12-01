## **DO NOT DELETE THIS FOLDER**

References:
 - Video: [Sync your dotfiles with git and GNU Stow like a pro](https://www.youtube.com/watch?vzEuBGPPPg)
 - GNU Stow(https://www.gnu.org/software/stow/)
 - Site Excamples:[dotfiles](dotfiles.github.io)

This folder holds the configuration files for Ubuntu 22.04.3
1.  Each folder is for a different application
2.  Configuration files for the applications are kept within each folder
3.  Symlinks are created to link these files into the $HOME folder
3.  Gnu Stow is used to save these files in git

RD 17-Nov-2023

Configuration files for:
``````
bash            - .bashrc, .bash_aliases, .bash_profile
calibre         - ebook library
htop            - process monitor
btop            - process monitor
kitty           - terminal
mc              - midnight commander file manager
mpv             - media player
nvim            - text editor
ranger          - file manater
sublime-text    - text editor
tmux            - terminal multiplexer
vlc             - media player
zsh             - shell (manual configuration)
``````

*Workflow*

To stow the configuration into the archive
```
cd ~/dotfiles                       # this folder
mkdir -p <pkg>                      # create the package
mv ~/.<files>  <pkg>/               # move any dotfiles in ~/
mkdir -p <pkg>/.config              # create the <pkg>/.config folder
mv ~/.config/<pkg>  <pkg>/.config/  # move the pkg config folder/files over
stow -vt  ~  <pkg>                  # stow to make the links
```

17-Nov-23
