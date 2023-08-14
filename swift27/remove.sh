# Loop over subdirectories (obsid directories)
for obsid_dir in */; do
  obs_id=$(basename "${obsid_dir}")  # Get the observation ID from the subdirectory name
  rm ${obs_id}/uvot/image/maghist_u*
done
