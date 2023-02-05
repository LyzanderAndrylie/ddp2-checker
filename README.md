# DDP2 Checker  

DDP2 Checker adalah script untuk memudahkan asdos untuk mengecek output mahasiswa dan membandingkannya dengan output solusi.  

## Requirements

1. [Git Bash](https://git-scm.com/downloads)
2. [VS Code](https://code.visualstudio.com/)

## Cara Penggunaan  

1. `bash create_folder.bash` (hanya perlu dilakukan sekali)

    Berfungsi untuk membuat struktur folder awal.  

    > :memo: **Note:** Sebelum menjalankan perintah tersebut, kalian harus menyesuaikan nama-nama mahasiswa asdosan kalian di `students.bash`'.

2. `bash extract_submission.bash`

    Berfungsi untuk mengekstrak file submisi mahasiswa ke folder yang sesuai.

    > :memo: **Note:** Sebelum menjalankan perintah tersebut, kalian harus meletakkan file submisi `.zip` ke dalam folder `tmp-submission`.  Kalian dapat men-*download* file submisi `.zip` pada dropdown menu di bawah judul 'Submisi Lab XX'.

3. `bash get_output.bash`

    Berfungsi untuk mendapatkan output solusi dan mahasiswa dalam bentuk text file di masing-masing folder yang sesuai.

    > :memo: **Note:** Untuk mendapatkan output solusi dan mahasiswa, source code solusi harus diletakkan pada folder `solution/lab<indeks>/src/` dan setiap testcase input pada folder `solution/lab<indeks>/in/`.  

4. `bash compare_output.bash`

    Berfungsi untuk membandingkan output solusi dengan output dari mahasiswa. Pembandingan dilakukan dengan memanfaatkan fitur VS Code.  

5. `bash delete_tmp.bash`

    Berfungsi untuk menghapus semua file pada `tmp-submission`.  

## Catatan

Script hanya digunakan untuk membandingkan output. Oleh karena itu, input tidak akan dicetak pada file-file di folder `output`. Selain itu, format output tidak tersusun dengan rapih.  
