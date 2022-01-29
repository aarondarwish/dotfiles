# Backup the config/dot-files into the backup directory.

import os

backup_or_recover = int(input("\nBackup [1] - Recover [2]\n"))

if backup_or_recover == 1:
    print("Backing up...\n")
    os.system("cp -r ~/.zshrc ~/.xinitrc ~/.tmux.conf ~/.config/nvim/init.vim ~/.config/zathura/zathurarc ~/.alacritty.yml ./backup")
elif backup_or_recover == 2:
    print("Recovering...\n")
    os.system("cd backup && cp -r .zshrc ~/.zshrc; cp -r .xinitrc ~/.xinitrc; cp -r .tmux.conf ~/.tmux.conf; cp -r .init.vim ~/.config/nvim/; cp -r zathurarc .config/zathura/; cp -r .alacritty.yml ~/.alacritty.yml && cd ../")
else:
    exit
