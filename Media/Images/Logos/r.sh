#!/bin/bash

# Check if the input file is provided
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <input_file>"
  exit 1
fi

input_file=$1

# Get the dimensions of the input image
dimensions=$(identify -format "%w %h" "$input_file")
width=$(echo "$dimensions" | awk '{print $1}')
height=$(echo "$dimensions" | awk '{print $2}')

# Create a new transparent image with twice the height
new_height=$((height * 2))
convert -size "${width}x${new_height}" -colorspace sRGB xc:none new_background.png

# Composite the original logo onto the new image
composite -colorspace sRGB -geometry +0+0 "$input_file" new_background.png resized_logo.png

echo "Resized logo saved as resized_logo.png"

