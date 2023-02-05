source students.bash

show_diff_vscode() {
  for output in "solution/lab${1}/out/"*; do
    code -d "${output}" "${output/"solution"/"students/${2}"}"
  done
}

compare_output() {
  read -r -p "Output Lab ke-(XX): " number
  read -r -p "Apakah Anda ingin membandingkan output? [Y/n] " answer

  if [[ "${answer}" == "Y" ]]; then
    show_students_index
    read -r -p "Pilih indeks mahasiswa: " index

    show_diff_vscode "${number}" "${STUDENTS[$index]}"
  else
    echo "Output tidak dibandingkan"
  fi
}

compare_output