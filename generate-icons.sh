#!/usr/bin/bash

set -e
set -u

readonly APP="nl.zevv.Duc"
readonly SOURCE_ICON="duc.png"

wget https://raw.githubusercontent.com/zevv/duc/master/img/duc.png --output-document="${SOURCE_ICON}"

convert "${SOURCE_ICON}" -resize 256x256 -strip "${APP}.png"
convert "${SOURCE_ICON}" -resize 128x128 -strip "${APP}-128.png"
convert "${SOURCE_ICON}" -resize 64x64 -strip "${APP}-64.png"
