#!/bin/bash
# sudo apt install nsis nsis-pluginapi imagemagick -y
wget https://github.com/mifi/lossless-cut/releases/latest/download/LosslessCut-win-x64.7z -O archive.7z
wget https://github.com/mifi/lossless-cut/raw/master/src/renderer/src/icon.svg -O icon.svg
rm -rf dist
7z x -odist archive.7z
npx svgexport icon.svg icon-256.png 256:256
npx svgexport icon.svg icon-128.png 128:128
npx svgexport icon.svg icon-64.png 64:64
npx svgexport icon.svg icon-32.png 32:32

convert icon-256.png icon-128.png icon-64.png icon-32.png icon.ico
makensis -V4 setup.nsi
