#!/bin/bash

# ============================================
# Script Name: rename_images_to_jpg.sh
# Description: Renames all image files in the current
#              directory to have a .jpg extension.
# Usage: ./rename_images_to_jpg.sh
# ============================================

# **List of Image Extensions to Rename**
IMAGE_EXTENSIONS=("jpeg" "JPEG" "png" "PNG" "gif" "GIF" "bmp" "BMP" "tiff" "TIFF")

# **Counter for Renamed Files**
COUNTER=1

# **Loop Through Each Image Extension**
for EXT in "${IMAGE_EXTENSIONS[@]}"; do
  # Find files with the current extension (case-sensitive)
  for FILE in *."$EXT"; do
    # Check if the file exists to avoid literal "*.<ext>" if no match
    if [[ -f "$FILE" ]]; then
      # Extract the base name without the extension
      BASENAME="${FILE%.*}"
      
      # Define the new filename with .jpg extension
      NEW_FILENAME="${BASENAME}.jpg"
      
      # Check if the new filename already exists
      if [[ -e "$NEW_FILENAME" ]]; then
        echo "Warning: '$NEW_FILENAME' already exists. Skipping '$FILE'."
      else
        # Rename the file
        mv "$FILE" "$NEW_FILENAME"
        echo "Renamed '$FILE' to '$NEW_FILENAME'"
        COUNTER=$((COUNTER + 1))
      fi
    fi
  done
done

# **Final Output**
echo "Renaming completed. Total files renamed: $((COUNTER - 1))"
