class Kullanici
  attr_accessor :id, :kullanici_adi, :adi, :soyadi, :resim_url, :admin_mi
  def initialize(id,kullanici_adi,adi,soyadi,resim_url,admin_mi)
    @id = id
    @kullanici_adi = kullanici_adi
    @adi = adi
    @soyadi = soyadi
    @resim_url = resim_url
    @admin_mi = admin_mi
  end
  def self.ara(adi)

  end
  def olustur()

  end
  def sil()

  end
  def guncelle(kullanici_adi, ad, soyad, parola)

  end

  def self.giris(kullanici_adi, parola)
    sorgu = baglanti.prepare("SELECT * FROM Kullanicilar WHERE kullanici_adi = ? and parola = ?")
    sonuc = sorgu.execute(kullanici_adi, parola)

  end
end
