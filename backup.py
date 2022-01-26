# Backup the config/dot-files into the backup directory.

import os

backup_or_recover = input("\nBackup [1] - Recover [2]\n")
backup_or_recover = int(backup_or_recover)

if backup_or_recover == 1:
    print("Backing up...\n")
    os.system("cp -r ~/.zshrc ~/.xinitrc ~/.tmux.conf ~/.config/nvim/init.vim ~/.config/zathura/zathurarc ~/.alacritty.yml ./backup")
elif backup_or_recover == 2:
    print("Recovering...\n")
    os.system("cd backup && mv .zshrc ~/.zshrc; mv .xinitrc ~/.xinitrc; mv .tmux.conf ~/.tmux.conf; mv .init.vim ~/.config/nvim/; mv zathurarc .config/zathura/; mv .alacritty.yml ~/.alacritty.yml")
else:
    exit
