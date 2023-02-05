STUDENTS=(
  "Nama Mahasiswa 0"
  "Nama Mahasiswa 1"
  "Nama Mahasiswa 2"
  "Nama Mahasiswa N"
)

STUDENTS_GITHUB=(
  "URL Mahasiswa 0"
  "URL Mahasiswa 1"
  "URL Mahasiswa 2"
  "URL Mahasiswa N"
)

show_students_index() {
  for i in "${!STUDENTS[@]}"; do
    echo "${i} - ${STUDENTS[$i]}"
  done
}