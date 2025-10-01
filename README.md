# Laporan Resmi Praktikum Jarkom Modul 1

| Nama Anggota | NRP |
|--------------|-----|
|Khumaidi Kharis A. | 5027241049|
|Nadia Fauziazahra K. | 5027241094|


## nomor 1

## nomor 2

## nomor 3

## nomor 4

## nomor 5

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

## Nomor 7

Pada soal ini, kita diminta untuk membuat dan konfigurasi FTP server di eru, membuat directory shared, dan membuat 2 user ainur dengan hak akses write&read dan melkor tanpa hak akses sama sekali 

-pertama, kita perlu install dan setup ftp di router eru
        
        apt update && apt install vsftpd -y
        service vsftpd start
        apt install inetutils-ftp -y

-lalu, buat 2 user, yakni ainur dan melkor

        adduser ainur 
        adduser melkor

-setelah itu, buat folder shared di directory /srv/ftp
        
        cd ../srv/ftp
        mkdir shared

-karena yang memiliki hak akses adalah ainur. Sedangkan melkor tidak ada hak akses sama sekali, maka kepemilikan folder shared diganti ainur dan untuk permission dari folder diubah menjadi full access untuk user/owner

        chown -R ainur:ainur shared
        chmod -R 700 shared

-selanjutnya, kita perlu melakuakan konfigurasi untuk komponen ftp untuk membatasi user yang dapat ftp ke eru/localhost. Kita perlu menambahkan beberapa script pada vsftpd.conf

        nano /etc/vsftpd.conf

-tambahkan script berikut

        listen=YES
        listen_ipv6=NO
        anonymous_enable=NO
        local_enable=YES
        write_enable=YES
        dirmessage_enable=YES
        use_localtime=YES
        xferlog_enable=YES
        connect_from_port_20=YES
        chroot_local_user=YES
        pam_service_name=vsftpd
        allow_writeable_chroot=YES
        local_root=/srv/ftp/shared
        tcp_wrappers=YES
        
        user_config_dir=/etc/vsftpd_user.conf
        userlist_enable=YES
        userlist_file=/etc/vsftpd.user_list
        userlist_deny=YES

--script tersebut berfungsi konfigurasi folder dan untuk membuat list user yang nantinya diblacklist/ditolak jika melakukan ftp ke eru

-selanjutnya, kita tambahkan user yang ingin diblacklist

        echo "melkor" | tee etc/vsftpd.user_list

-terakhir, kita perlu merestart ftp untuk memperbarui progam

        service vsftpd restart

## Nomor 8

Pada sooal ini, kita mengirim file cuaca.zip dari ulmo ke eru melalui ftp ke ip address eru menggunakan user ainur dan melakukan checking di wireshark.

-pertama, kita perlu melakukan capture ke ethernet yang menghubungkan client ulmo ke router eru

-selanjutnya masuk ke client ulmo dan download file cuaca.zip

        wget --no-check-certificate "https://docs.google.com/uc?export=download&id=11ra_yTV_adsPIXeIPMSt0vrxCBZu0r33" -O cuaca.zip

-install inetutils-ftp untuk mengirimkan dan mengunduh file antar komputer menggunakan protokol FTP

        apt update && apt install inetutils-ftp -y

-lalu connect ftp ip address eru

-setelah connect ftp eru, masuk ke user ainur dan kirim file cuaca.zip

        put cuaca.zip

-terakhir, cek file di eru

## Nomor 10

Pada soal ini, kita diminta untuk mengirim banyak permintaan (ping) ke server eru melalui node melkor dengan jumlah yang tidak biasa. Kita juga perlu validasi hasilnya, seperti packet loss ataupun average round trip time 

-pertama, kita telnet ke client melkor

-lalu melakuka ping sebanyak 100 ke server eru

        ping -c 100 -f 192.168.122.251

-validasi request di wireshark

## Nomor 14

Pada soal ini, kita diminta untuk menganalisis file capture yang disediakan dan identifikasi upaya brute force Melkor. Kita perlu mendownload file yang sudah disediakan dan buka melalui GUI wireshark. Selanjutnya, melakukan nc 10.15.43.32 3401 untuk connect ke soal.

+ Flag

        KOMJAR{Brut3_F0rc3_yWhCfnTdOMRenvU2ZggCiZWAH}

+ Q1. How many packet are recorded in the pcapng file?

        500358
  
+ Q2. What are the user that successfully logged in?

        n1enna:y4v4nn4_k3m3nt4r1

+ Q3. In which stream were the credentials found?

        41824

+ Q4. What tools are used for brute force?

        Fuzz Faster U Fool v2.1.0-dev

## Nomor 19

Pada soal ini, kita diminta untuk Analisis file capture jaringan dan gagalkan lagi rencana melkor meneror Varda dengan email yang disamarkan. Untuk menyelesaikan soal ini, Kita perlu mendownload file yang sudah disediakan dan buka melalui GUI wireshark. Selanjutnya, melakukan nc 10.15.43.32 340 untuk connect ke soal.

+ Flag

        KOMJAR25{Y0u_4re_J4rk0m_G0d_Ac9RTRPYNNi3pU1RGLbrVyfAu}

+ Q1. Who sent the threatening message?

        Your Life
  
+ Q2. How much ransom did the attacker demand ($)?

        1600

+ Q3. What is the attacker's bitcoin wallet?

        1CWHmuF8dHt7HBGx5RKKLgg9QA2GmE3UyL
