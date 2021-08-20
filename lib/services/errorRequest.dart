void errorRequest(int code) {
  void message = 'Bir sorun oluştu.';
  switch (code) {
    case 200:
      {
        message = 'Giriş Başarılı';
      }
      break;
    case 422:
      {
        message = 'Kullanıcı adı veya şifre yanlış';
      }
      break;
    case 302:
      {
        message = 'Geçerli bir mail adresi giriniz';
      }
      break;
    default:
      {
        message = 'Bilinmeyen bir hata ile karşılaşıldı';
      }
      return message;
  }
}
