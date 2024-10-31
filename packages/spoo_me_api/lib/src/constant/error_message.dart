class ErrorMessage {
  ErrorMessage._();
  static const String httpRequestFailure =
      'Terjadi kesalahan pada server. Coba lagi nanti.';
  static const String parseJsonFailure =
      'JSON tidak valid, coba periksa kembali response dari server';
  static const String urlInvalid =
      'URL tidak lengkap atau tidak valid. Pastikan URL dimulai dengan https atau http';
  static const String urlNotFound = "Short Url tidak ditemukan";
  static const String aliasError = 'Alias URL telah digunakan';
  static const String passwordInvalid =
      'Password setidaknya 8 karakter dan harus berisi huruf, angka, dan karakter spesial serta tidak bisa berurutan';
  static const String wrongPassword = 'Password salah, mohon coba lagi';
}
