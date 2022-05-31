
class AppUser {
  final String ad;
  final String soyad;
  final String bio;
  final String kullaniciadi;
  final int sifre;
  final DateTime? dogumtarihi;
  final String cinsiyet;
  AppUser(
      {required this.ad,
        required this.soyad,
        required this.bio,
        required this.kullaniciadi,
        required this.cinsiyet,
        required this.dogumtarihi,
        required this.sifre});

  olustur(String isim, String soyisim, String bio, String kullaniciadi,
      int sifre, DateTime dogumtarihi, bool cinsiyet) {
    Map<String, String> kullanici = {
      "isim": isim,
      "soyisim": soyisim,
      "kullaniciadi": kullaniciadi,
      "bio": bio,
      "sifre": sifre.toString(),
      "dogumtarihi": dogumtarihi.toString(),
      "cinsiyet": cinsiyet.toString(),
    };
  }
}