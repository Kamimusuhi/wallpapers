#!/bin/bash

mkdir -p preview

for file in *.png; do
    filename=$(basename -- "$file" .png)
    # Convert PNG to WebP using ffmpeg with a compression level of 6 and a quality scale of 20.
    ffmpeg -i "$file" -compression_level 6 -qscale 20 "preview/$filename.webp"
done

