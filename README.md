# tes_pwa

# tes_pwa

Flutter Web Progressive Web App (PWA).

## Run locally

```bash
flutter pub get
flutter run -d chrome
```

## Deploy ke Vercel dari GitHub

1. Push repository ini ke GitHub.
2. Di Vercel, pilih **Add New > Project**, lalu import repository GitHub.
3. Biarkan konfigurasi dari `vercel.json` digunakan.
4. Klik **Deploy**.

Konfigurasi akan memasang Flutter SDK dan menjalankan `flutter build web --release`.
Hasil deploy berada pada `build/web`, sehingga URL `/manifest.json` dan service worker
tersedia untuk instalasi PWA.

Setelah deploy berhasil, buka URL Vercel menggunakan Chrome pada perangkat Android,
lalu pilih **Install app** atau **Add to Home screen**.

## Build PWA lokal

```bash
flutter build web --release
```

Output berada di `build/web` dan dapat di-host pada layanan statis apa pun yang
mendukung HTTPS.
