source students.bash

compile_solution_file() {
    javac "solution/lab${1}/src/"*.java -d "solution/lab${1}/bin"
}

compile_student_file() {
    for student in "${STUDENTS[@]}"; do
        javac "students/${student}/lab${1}/src/"*.java -d "students/${student}/lab${1}/bin"
    done
}

get_output_for_solution() {
    for input in "solution/lab${1}/in/"*; do
        java -cp "solution/lab${1}/bin/" "${2}" <"${input}" >"${input/in/out}"
    done
}

get_output_for_student() {
    for student in "${STUDENTS[@]}"; do
        for input in "solution/lab${1}/in/"*; do
            java -cp "students/${student}/lab${1}/bin/" "${2}" <"${input}" >"students/${student}/lab${1}/out/${input##*\/}"
        done
    done
}

get_output() {
    read -r -p "Ekstrak Lab ke-(XX): " number
    read -r -p "Main Class: " main_class

    # File output for solution
    read -r -p "Apakah Anda ingin mendapatkan file output untuk solusi? [Y/n] " answer
    if [[ "${answer}" == "Y" ]]; then
        compile_solution_file "${number}"
        get_output_for_solution "${number}" "${main_class}"
        echo "File output untuk solusi berhasil dibuat"
    else
        echo "File output tidak dibuat"
    fi

    # File output for students
    read -r -p "Apakah Anda ingin mendapatkan file output untuk Mahasiswa [Y/n] " answer
    if [[ "${answer}" == "Y" ]]; then
        compile_student_file "${number}"
        get_output_for_student "${number}" "${main_class}"
        echo "File mahasiswa untuk solusi berhasil dibuat"
    else
        echo "File output tidak dibuat"
    fi
}

get_output
