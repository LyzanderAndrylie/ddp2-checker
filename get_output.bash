source students.bash

########################################################
# Compile solution file
# Arguments:
#   Lab type
########################################################
compile_solution_file() {
  javac "solution/lab${1}/src/"*.java -d "solution/lab${1}/bin"
}

########################################################
# Compile student file
# Arguments:
#   Lab type
########################################################
compile_all_student_file() {
  for student in "${STUDENTS[@]}"; do
    javac "students/${student}/lab${1}/src/"*.java -d "students/${student}/lab${1}/bin"
  done
}

########################################################
# Get output for solution
# Arguments:
#   Lab type
########################################################
get_output_for_solution() {
  local main_class
  main_class=$(find_main_class_solution "${1}")

  for file in "solution/lab${1}/in/"*; do
    java -cp "solution/lab${1}/bin/" "${main_class}" <"${file}" >"${file/in/out}"
  done
}

########################################################
# Get output for all student
# Arguments:
#   Lab type
########################################################
get_output_for_all_student() {
  for student in "${STUDENTS[@]}"; do
    local main_class
    main_class=$(find_main_class_student "${1}" "${student}")

    for file in "solution/lab${1}/in/"*; do
      java -cp "students/${student}/lab${1}/bin/" "${main_class}" <"${file}" >"students/${student}/lab${1}/out/${file##*\/}"
    done
  done
}

########################################################
# Find class containing main method for solution
# Arguments:
#   Lab type
# Output:
#   Class name containing main() method
########################################################
find_main_class_solution() {
  for file in "solution/lab${1}/bin/"*; do
    local class_info
    class_info=$(javap "${file}")

    if [[ "${class_info}" == *"public static void main(java.lang.String[])"* ]]; then
      file="${file##*\/}"
      file="${file%%.class}"
      echo "${file}"
    fi
  done
}

########################################################
# Find class containing main method for student
# Arguments:
#   Lab type
#   Student's name
# Output:
#   Class name containing main() method
########################################################
find_main_class_student() {
  for file in "students/${2}/lab${1}/bin/"*; do
    local class_info
    class_info=$(javap "${file}")

    if [[ "${class_info}" == *"public static void main(java.lang.String[])"* ]]; then
      file="${file##*\/}"
      file="${file%%.class}"
      echo "${file}"
    fi
  done
}

get_output() {
  read -r -p "Ekstrak Lab ke-(XX): " lab_type

  # File output for solution
  read -r -p "Apakah Anda ingin mendapatkan file output untuk solusi? [Y/n] " answer
  if [[ "${answer}" == "Y" ]]; then
    compile_solution_file "${lab_type}"
    get_output_for_solution "${lab_type}"
    echo "File output untuk solusi berhasil dibuat"
  else
    echo "File output tidak dibuat"
  fi

  # File output for students
  read -r -p "Apakah Anda ingin mendapatkan file output untuk Mahasiswa [Y/n] " answer
  if [[ "${answer}" == "Y" ]]; then
    compile_all_student_file "${lab_type}"
    get_output_for_all_student "${lab_type}"
    echo "File mahasiswa untuk solusi berhasil dibuat"
  else
    echo "File output tidak dibuat"
  fi
}

get_output
