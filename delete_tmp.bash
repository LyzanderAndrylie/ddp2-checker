source students.bash

delete_tmp() {
    read -r -p "Apakah Anda ingin menghapus semua file dalam tmp? [Y/n]" answer

    if [[ "${answer}" == "Y" ]]; then
        rm -r tmp-submission/*
        echo "Folder berhasil dihapus"
    else
        echo "Folder tidak dibuat"
    fi
}

delete_tmp