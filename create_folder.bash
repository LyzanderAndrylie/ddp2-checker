source students.bash

# Creates folder for each lab
create_folder_lab() {
  for i in {01..10}; do
    if [[ "${1}" == "solution" ]]; then
      mkdir -p "${1}/lab${i}/in"
    fi
    
    mkdir -p "${1}/lab${i}/out"
    mkdir -p "${1}/lab${i}/src"
    mkdir -p "${1}/lab${i}/bin"
  done
}

# Creates folder for tp
create_folder_tp() {
  mkdir -p "${1}/tp"
}

# Creates initial project folder
create_folder() {
  read -r -p "Apakah Anda ingin membuat struktur folder awal? [Y/n]: " answer

  if [[ "${answer}" == "Y" ]]; then
    # Create folder for solution
    mkdir tmp-submission
    create_folder_lab "solution"
    create_folder_tp "solution"

    # Create folder for each student
    for student in "${STUDENTS[@]}"; do
      create_folder_lab "students/${student}"
      create_folder_tp "students/${student}"
    done

    echo "Folder Berhasil dibuat"
  else
    echo "Folder tidak dibuat"
  fi
}

create_folder
