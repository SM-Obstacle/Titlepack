#!/bin/bash

# Resize the background image
convert ../../Logos/Background.png -resize 1920x1080 resizedBackground.png

# Resize the corners image and make all non-transparent pixels fully opaque
convert FThumbnailMapClip_black.png -resize 318x215! -channel A -threshold 1% FThumbnailMapClip_resized_opaque.png

# Crop the part of the background that aligns with the resized corners image
convert resizedBackground.png -crop 318x215+35+218 croppedBackground.png

# Use the corners image to cut out the shape from the cropped background
composite -compose CopyOpacity FThumbnailMapClip_resized_opaque.png croppedBackground.png FThumbnailMapClip.png

# Remove temporary images
rm resizedBackground.png FThumbnailMapClip_resized_opaque.png croppedBackground.png

