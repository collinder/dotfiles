import os
import subprocess
import sys
from shutil import copytree, copy2

files = [
        '/home/fziv/Documents/sync/static/config.js',
        '/home/fziv/Documents/sync/obsidian/notas/.obsidian.vimrc',
        '/home/fziv/.tmux.conf',
        '/home/fziv/.vimrc',
        '/etc/udev/hwdb.d/90-custom-keyboard.hwdb',
        '/home/fziv/.Xresources'
        ]
folders = [
            ['lua' ,'/home/fziv/.config/nvim/lua'],
            ['i3', '/home/fziv/.config/i3'],
            ['i3status', '/home/fziv/.config/i3status'],
          ]

dir = os.getcwd()

for file in files:
    copy2(file, dir)

for fold in folders:
    copytree(fold[1], os.path.join(dir,fold[0]), symlinks=True, copy_function=copy2, dirs_exist_ok=True)
