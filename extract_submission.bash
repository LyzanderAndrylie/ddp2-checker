source students.bash

# Extract all submissions
extract_submission() {
  read -r -p "Ekstrak Lab ke-(XX): " number
  read -r -p "Apakah ingin mengekstrak file mahasiswa? [Y/n]" answer

  if [[ "${answer}" == "Y" ]]; then
    # Extract DDP1 gradebook zip
    unzip tmp-submission/DDP2*.zip -d tmp-submission

    # Extract all student submission
    for student in "${STUDENTS[@]}"; do
      unzip tmp-submission/"${student}"*/*.zip -d "students/${student}/lab${number}/src"
    done
    echo "Ekstrak berhasil"
  else
    echo "File mahasiswa tidak diekstrak"
  fi
}

extract_submission
