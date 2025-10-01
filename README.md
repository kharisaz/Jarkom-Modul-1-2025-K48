# Laporan Resmi Praktikum Jarkom Modul 1

| Nama Anggota | NRP |
|--------------|-----|
|Khumaidi Kharis A. | 5027241049|
|Nadia Fauziazahra K. | 5027241094|


## nomor 1-5 mengikuti modul

--penjelasan dikit

## Nomor  6

Pada soal ini, kita diminta untuk packet sniffing antara manwe dan eru, dimana dengan menjalankan file traffic.sh 

-pertama kita perlu capture ethernet yang menghubungkan manwe dan eru

-selanjutnya masuk telnet ke manwe dan mendownload file dan menjalankannya untuk membuat koneksi ke eru
        
    wget --no-check-certificate "https://docs.google.com/uc?export=download&id=1bE3kF1Nclw0VyKq4bL2VtOOt53IC7lG5" -O traffic.zip
    ./traffic.zip
    chmod +x traffic.sh
    ./traffic.sh

-buka wireshark dan display filter untuk mencari paket baik itu dari maupun ke ip address manwe

    ip.addr == 192.235.1.3

# Nomor 7

Pada soal ini, kita diminta untuk membuat dan konfigurasi FTP server di eru, membuat directory shared, dan membuat 2 user ainur dengan hak akses write&read dan melkor tanpa hak akses sama sekali 

-pertama, kita perlu install FTP 
