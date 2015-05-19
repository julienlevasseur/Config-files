#!/usr/bin/env bash

cp .bashrc ~/
cp .profile ~/
chown root:root ~/.bashrc ~/.profile
cd ..
bash setup-vim.sh
