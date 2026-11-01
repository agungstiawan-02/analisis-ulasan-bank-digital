# Analisis Ulasan Aplikasi Bank Digital di Google Play

Analisis 155.967 ulasan pengguna tiga aplikasi bank digital (Aladin, Jago, BYOND by BSI) untuk melihat tren rating, jenis keluhan utama, dan rekomendasi bagi tim produk.

## Pertanyaan Bisnis
1. Mengapa rating BYOND jauh lebih rendah dari Aladin dan Jago?
2. Apa keluhan utama pengguna di tiap aplikasi?

## Sumber Data
Dataset "Review Aplikasi Bank Syariah Play Store" di Kaggle, lisensi CC0 (public domain)(https://www.kaggle.com/datasets/achmadathazayyan/review-aplikasi-bank-syariah-play-store).
Data tidak disertakan di repositori ini karena ukurannya besar (sekitar 83 MB). Silakan unduh dari tautan di atas.

| Aplikasi | Ulasan | Periode |
|---|---|---|
| Aladin | 30.243 | Jan 2022 – Apr 2026 |
| BYOND by BSI | 57.005 | Okt 2024 – Apr 2026 |
| Jago | 68.719 | Apr 2021 – Apr 2026 |

## Tools
Python (pandas, matplotlib), SQL (SQLite), Google Colab.

## Data Cleaning
- Kolom nama dan foto pengguna dibuang demi privasi.
- Tidak ada `reviewId` ganda, jadi tiap baris adalah ulasan unik.
- Ulasan dengan isi yang sama (sekitar 14%) tidak dihapus, karena ditulis oleh pengguna berbeda dan sebagian besar berupa pujian singkat ("mantap", "ok", "bagus").
- Ulasan berisi 2 kata atau kurang (19%) hanya dikeluarkan dari analisis teks karena tidak informatif.
- Teks diseragamkan ke huruf kecil.

## Temuan Utama
- Rata-rata rating: Aladin 4,25, Jago 3,77, BYOND 3,09.
- Rating BYOND terbelah: 38,6% bintang 1 dan 45,1% bintang 5.
- BYOND membalas 99,5% ulasan, tetapi ratingnya tetap yang terendah. Membalas ulasan belum tentu memperbaiki rating.
- Rating BYOND turun dari 4,91 di bulan peluncuran (Okt 2024) menjadi 2,46 di Februari 2025, saat jumlah ulasan melonjak menjadi 12.443 dalam satu bulan.
- Ulasan pendek berating lebih tinggi (rata-rata 4,46) daripada ulasan yang lebih panjang (3,41).

Porsi ulasan bintang 1 (teks lebih dari 2 kata) menurut jenis keluhan:

| Keluhan | Aladin | BYOND | Jago |
|---|---|---|---|
| Error/gangguan | 14,8% | 34,6% | 9,4% |
| Lambat/loading | 7,2% | 12,3% | 7,2% |
| Login/akses | 20,8% | 17,5% | 33,6% |
| Transaksi/saldo | 19,4% | 22,6% | 18,6% |
| Registrasi/verifikasi | 24,5% | 6,1% | 18,2% |

Rating BYOND berbeda tajam antarversi aplikasi, misalnya v1.1.0 (2,42) dan v1.0.4 (2,61) dibanding v1.2.0 (3,90).

## Rekomendasi untuk Tim Produk BYOND
1. Perketat pengujian sebelum rilis. Keluhan error muncul di 34,6% ulasan bintang 1, dan rating turun tajam di beberapa versi.
2. Selidiki penyebab loading lambat dan pantau waktu muat, karena sekitar 12% ulasan bintang 1 menyebutnya.
3. Prioritaskan keandalan transaksi dan kejelasan status saldo, karena keluhan ini ada di 22,6% ulasan bintang 1.

## Batas Analisis
- Kategori keluhan dihitung dengan pencarian kata kunci, jadi hasilnya perkiraan.
- Karena ulasan pendek cenderung berating tinggi, analisis teks lebih condong ke keluhan.
- Jumlah ulasan Aladin per bulan sedikit (median sekitar 366), sehingga rata-rata bulanannya mudah berfluktuasi.
- Hubungan antara versi aplikasi dan rating adalah korelasi, bukan bukti sebab-akibat. Kolom versi kosong di sekitar 20% baris.

## Struktur Repositori
- `notebook/` : notebook analisis
- `sql/` : query SQL

## Penulis
Agung Stiawan · linkedin.com/in/agung-stiawan-0b6990280 · agungstiawan2002@gmail.com
