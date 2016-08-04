#!/usr/bin/env bash

cp .bashrc ~/
cp .git-prompt.sh ~/
cd ../..
bash setup-vim.sh
if command -v git > /dev/null
then
  git config --global color.ui true
fi
