#!/bin/bash

rm build_utool.sh && cd && mkdir .utool && cd .utool
curl -L -o utool.tar.gz https://github.com/leanhthang/server-setup/archive/refs/tags/v0.0.1.tar.gz
tar -xzf utool.tar.gz && mv server-setup-*/* . && rm utool.tar.gz server-setup-*/*  && cd
echo "alias utool='source .utool/utool.sh'" | sudo tee -a ~/.bashrc
source ~/.bashrc