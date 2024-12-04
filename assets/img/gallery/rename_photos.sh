#!/bin/bash

# Initialize counter starting at 10
count=10

# Define the desired prefix
prefix="gallery"

# Loop through common image file extensions (case-insensitive)
for file in *.[jJ][pP][gG] *.[jJ][pP][eE][gG] *.[pP][nN][gG] *.[gG][iI][fF]; do
  # Check if the file exists to avoid errors
  if [ -f "$file" ]; then
    # Extract the file extension
    ext="${file##*.}"
    # Construct the new filename
    new_filename="${prefix}-${count}.${ext}"
    
    # Check if a file with the new name already exists to prevent overwriting
    if [ -e "$new_filename" ]; then
      echo "Error: $new_filename already exists. Skipping $file."
    else
      # Rename the file
      mv "$file" "$new_filename"
      echo "Renamed $file to $new_filename"
      # Increment the counter
      count=$((count + 1))
    fi
  fi
done
