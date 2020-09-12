#!/bin/bash

default_user=$(logname 2>/dev/null || echo ${SUDO_USER:-${USER}})
HOME="/home/${default_user}"


## Download:
wget https://github.com/JetBrains/JetBrainsMono/releases/download/v2.001/JetBrains.Mono.2.001.zip -O ~/JetBrains.Mono.2.001.zip

## Unzip , send to ~/.local/share/fonts and remove zip file
unzip ~/JetBrains.Mono.2.001.zip -d ~/.local/share/fonts && fc-cache -fv && rm ~/JetBrains.Mono.2.001.zip
