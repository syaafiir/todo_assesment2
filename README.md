# 📝 TODO Assessment 2 - Flutter App

---

## Anggota Tim
Muhammad Syafir 
2310120027
Karena project dikerjakan secara solo, seluruh tugas dan pekerjaan dilakukan oleh saya sendiri.

---

## Fitur Aplikasi

### 1. Fitur Login
- Pengguna masuk menggunakan **username** dan **password**.
- Validasi input untuk memastikan tidak ada field kosong.
- Setelah login berhasil, diarahkan ke **Home Page**.

### 2. Fitur Light/Dark Mode
- Toggle tema **Light/Dark** tersedia di Home Page.
- Pilihan tema disimpan dengan **SharedPreferences**, sehingga preferensi tetap ketika aplikasi dibuka kembali.

### 3. Implementasi SQLite & SharedPreferences
| Fitur | Teknologi | Kegunaan |
|-------|-----------|----------|
| Data Todo/Task | SQLite | Menyimpan daftar tugas secara lokal di device |
| Preferensi Pengguna | SharedPreferences | Menyimpan status login dan tema (Light/Dark) |

---

## Cara Menggunakan Aplikasi

1. Buka aplikasi → muncul **Login Page**.
2. Masukkan **username** & **password** → klik **Login**.
3. Berhasil login → masuk ke **Home Page** untuk melihat daftar tugas.
4. Klik **Add Item** untuk menambah tugas baru → data disimpan di **SQLite**.
5. Gunakan toggle **Light/Dark Mode** untuk mengubah tema → preferensi disimpan di **SharedPreferences**.
6. Data tugas tetap tersimpan meskipun aplikasi ditutup atau tema diubah.

---
