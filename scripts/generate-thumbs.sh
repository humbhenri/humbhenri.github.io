#!/usr/bin/env bash

set -euo pipefail

SOURCE="assets/img"
DEST="$SOURCE/thumbs"

mkdir -p "$DEST"

find "$SOURCE" -maxdepth 1 -type f \
  \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' \) \
  -print0 |
while IFS= read -r -d '' image; do
  filename=$(basename "$image")

  magick "$image" \
    -thumbnail '300x300>' \
    -strip \
    -quality 85 \
    "$DEST/$filename"

  echo "Thumbnail gerada: $filename"
done
