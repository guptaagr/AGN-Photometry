#!/bin/bash

obs_id=$(basename "$(dirname "$(dirname "$(pwd)")")")  # Get the observation ID from the parent directory name
filters=("uw1" "uw2" "um2" "uuu")                          # List of filters

# Loop over filters
for filter in "${filters[@]}"; do
  # Construct the input and output filenames based on the observation ID and filter
  infile="sw${obs_id}${filter}_sk.img.gz"
  expfile="sw${obs_id}${filter}_ex.img.gz"
  
  # Check if the required files exist
  if [[ -f "${infile}" && -f "${expfile}" ]]; then
    # Loop over different aperture radii
    prev_radius=5.000
    cp source source_temp  # Create a temporary copy of the source file
    for radius in 7.000 10.000 12.000 15.000 18.000 20.000 25.000 30.000 35.000 5.000; do

      # Modify the copied source file with the new radius
      sed -i "s/${prev_radius}\"/${radius}\"/" source_temp
      prev_radius=${radius}

      # Construct the output filename based on the observation ID, filter, and radius
      outfile="maghist_${filter}_${radius}_${obs_id}.fits"

      # Run uvotmaghist command with the appropriate input and output filenames
      uvotmaghist infile="${infile}" expfile="${expfile}" srcreg=source_temp bkgreg=back outfile="${outfile}" plotfile=NONE
    done
    rm source_temp  # Remove the temporary file
  else
    echo "Required files for ${filter} filter in observation ID ${obs_id} not found. Skipping..."
  fi
done

