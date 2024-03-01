#!/bin/bash

mkdir -p Converted
counter=1

# Iterate over each image file in the current directory
for file in *.{jpg,jpeg,webp,png}; do
    if [ -f "$file" ]; then

        ext="${file##*.}"
        new_filename=$(printf "Converted/%04d.png" $counter)

        ffmpeg -i "$file" "$new_filename" >/dev/null 2>&1
        if [ $? -eq 0 ]; then
            echo "Converted $file to $new_filename"
            ((counter++))
        else
            echo "Failed to convert $file"
        fi
    fi
done

echo "Conversion completed."
