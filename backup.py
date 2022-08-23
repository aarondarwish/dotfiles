# Backup the config/dot-files into the backup directory.

import os

backup_or_recover = int(input("\nBackup [1] - Recover [2]\n"))

if backup_or_recover == 1:
    print("Backing up...\n")
    os.system("cd backup && cp ~/.zshrc ./ && cp ~/.xinitrc ./ && cp ~/.tmux.conf ./ && cp ~/.config/zathura/zathurarc ./ && cp ~/.config/nvim/init.vim ./ && cd ..")
elif backup_or_recover == 2:
    print("Recovering...\n")
    os.system("cd backup && cp -r .zshrc ~/.zshrc; cp -r .xinitrc ~/.xinitrc; cp -r .tmux.conf ~/.tmux.conf; cp -r zathurarc ~/.config/zathura/; cp -r init.vim ~/.config/nvim/ && cd ../")
else:
    exit
