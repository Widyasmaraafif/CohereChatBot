# 🚀 Flutter Cohere Chatbot

## 📌 Deskripsi
Ini adalah aplikasi chatbot sederhana berbasis **Flutter** yang menggunakan **Cohere API** untuk menghasilkan respons AI. Aplikasi ini memungkinkan pengguna mengobrol dengan AI secara real-time.

---

## 🎯 Fitur
✅ Menggunakan **Cohere API** untuk respons AI  
✅ Indikator **"AI sedang mengetik..."** saat AI memproses jawaban  
✅ UI berbasis **DashChat** untuk tampilan chat yang rapi  

---

## 📥 Cara Clone dan Install

### 🔹 1. Clone Repository
```sh
git clone https://github.com/Widyasmaraafif/CohereChatBot.git
```

### 🔹 2. Masuk ke Direktori Proyek
```sh
cd repository-name
```

### 🔹 3. Install Dependencies
```sh
flutter pub get
```
### 🔹 4. Mendapatkan API Key Cohere
> 1. Buat Akun Cohere
>> - Buka website Cohere -> https://cohere.com  
>> - Klik "Get Started" atau "Sign Up"  
>> - Daftar menggunakan email atau akun Google  
>> - Verifikasi email jika diminta
> 2. Masuk ke Dashboard Cohere
>> - Setelah login, buka Dashboard Cohere -> https://dashboard.cohere.com
>> - Pilih tab "API Keys"
> 3. Buat API Key
>> - Klik tombol "Create API Key"  
>> - Beri nama API Key (misal: Flutter App)  
>> - Pilih role akses (bisa pakai default)  
>> - Klik "Generate"  
#### 📌 Catatan:
Simpan API Key dengan aman karena tidak bisa dilihat lagi setelah keluar dari halaman ini.  
Jangan share API Key ke publik (misal, jangan commit ke GitHub).
### 🔹 5. Tambahkan API Key Cohere
1. Buka file chat_page.dart
2. Temukan baris ini:
```sh
const String COHERE_API_KEY = "YOUR_COHERE_API_KEY";
```
3. Ganti "YOUR_COHERE_API_KEY" dengan API Key Cohere Anda.

### 🔹 6. Jalankan Aplikasi
```sh
flutter run
```
Pastikan emulator atau perangkat terhubung sebelum menjalankan aplikasi.
## 🔧 Troubleshooting
### ❌ 1. Gradle Build Lama atau Error

Jalankan perintah berikut:

```sh
flutter clean
flutter pub get
```

Jika masih error, coba:


```sh
cd android
./gradlew clean
```

### ❌ 2. API Cohere Tidak Memberikan Respons

- Pastikan API Key valid.  
- Pastikan kuota pemakaian API belum habis.  
- Cek koneksi internet Anda.  

### ❌ 3. Tidak Bisa Menjalankan gradlew di Windows

Jika error 'gradlew' is not recognized, coba jalankan:

```sh
cd android
.\gradlew clean
```
## 🛠 Teknologi yang Digunakan

- Flutter (SDK UI modern dari Google)  
- DashChat (Paket untuk UI chat)  
- Cohere API (AI generatif berbasis teks)

## 📞 Kontak

Jika ada pertanyaan atau masalah, silakan hubungi:  
📧 Email: [Kirim Email](https://mail.google.com/mail/?view=cm&fs=1&to=widyasmaraanr25@gmail.com&su=Tanya%20Dong&body=Aku%20punya%20trouble%20di%20)  
🔗 GitHub: [Pozzy](https://github.com/Widyasmaraafif)